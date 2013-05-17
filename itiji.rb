require 'rubygems'
require 'cleverbot-api'
require 'cinch'

#@cleverbot = CleverBot.new

@prefixes = ["LOL", "zomg", "hahahahaha", "lololol", "HAHAHA"]

ircbot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#iit"]
    c.nick = "itiji"
  end

  on :message, /itiji/ do |m|
    cleverbot = CleverBot.new
    m.reply "#{@prefixes.sample} #{cleverbot.think(m.message)}"
  end
end

ircbot.start
