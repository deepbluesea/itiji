require 'rubygems'
require 'cleverbot-api'
require 'cinch'

@@use_prefixes = false
@@prefixes         = ["LOL", "zomg", "hahahahaha", "lololol", "HAHAHA"]
@@prefix_chance    = 25
@@interrupt_chance = 3

@@cleverbot = CleverBot.new

def chance(percent)
  rand(100) <= percent
end

def create_reply(message)
  prefix = ""
  prefix = "#{@@prefixes.sample} " if chance(@@prefix_chance) and @@use_prefixes

  "#{prefix}#{@@cleverbot.think(message)}"
end

ircbot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#chat"]
    c.nick = "chadx1"
  end

  # Any message
  on :message do |m|
    if chance(@@interrupt_chance)
      m.reply "#{m.user.nick}: #{create_reply(m.message)}"
    end
  end

  # Hilight message
  on :message, /nocynbot/ do |m|
    m.reply create_reply(m.message)
  end
end

ircbot.start
