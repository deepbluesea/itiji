require 'rubygems'
require 'cleverbot-api'
require 'cinch'

cleverbot = CleverBot.new

ircbot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.org"
    c.channels = ["#iit"]
    c.nick = "itiji"
  end

  on :message, /test/ do |m|
    m.reply "test"
  end
end

ircbot.start
