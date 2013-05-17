require 'rubygems'
require 'cleverbot-api'
require 'cinch'

def chance(percent)
  rand(100) <= percent
end

@@cleverbot     = CleverBot.new
@@prefixes      = ["LOL", "zomg", "hahahahaha", "lololol", "HAHAHA"]
@@prefix_chance = 25

ircbot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#iit"]
    c.nick = "itiji"
  end

  on :message, /itiji/ do |m|
    prefix = ""
    prefix = "#{@@prefixes.sample} " if chance(@@prefix_chance)

    m.reply "#{prefix}#{@@cleverbot.think(m.message)}"
  end
end

ircbot.start
