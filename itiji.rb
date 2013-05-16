require 'rubygems'
require 'cleverbot-api'
require 'cinch'

@cleverbot = CleverBot.new

@ircbot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#iit"]
    c.nick = "itiji"
  end

  on :message, /itiji/ do |m|
    m.reply @cleverbot.think m.message
  end
end

@ircbot.start
