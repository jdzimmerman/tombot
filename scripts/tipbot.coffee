# Description:
#   Tip people with dogecoins!
#   You or someone you know needs to setup and run https://github.com/ninetwentyfour/tipbot
#   Only works with hipchat
#   ░░░░░░░░░▄░░░░░░░░░░░░░░▄░░░░
#   ░░░░░░░░▌▒█░░░░░░░░░░░▄▀▒▌░░░
#   ░░░░░░░░▌▒▒█░░░░░░░░▄▀▒▒▒▐░░░
#   ░░░░░░░▐▄▀▒▒▀▀▀▀▄▄▄▀▒▒▒▒▒▐░░░
#   ░░░░░▄▄▀▒░▒▒▒▒▒▒▒▒▒█▒▒▄█▒▐░░░
#   ░░░▄▀▒▒▒░░░▒▒▒░░░▒▒▒▀██▀▒▌░░░
#   ░░▐▒▒▒▄▄▒▒▒▒░░░▒▒▒▒▒▒▒▀▄▒▒▌░░
#   ░░▌░░▌█▀▒▒▒▒▒▄▀█▄▒▒▒▒▒▒▒█▒▐░░
#   ░▐░░░▒▒▒▒▒▒▒▒▌██▀▒▒░░░▒▒▒▀▄▌░
#   ░▌░▒▄██▄▒▒▒▒▒▒▒▒▒░░░░░░▒▒▒▒▌░
#   ▀▒▀▐▄█▄█▌▄░▀▒▒░░░░░░░░░░▒▒▒▐░
#   ▐▒▒▐▀▐▀▒░▄▄▒▄▒▒▒▒▒▒░▒░▒░▒▒▒▒▌
#   ▐▒▒▒▀▀▄▄▒▒▒▄▒▒▒▒▒▒▒▒░▒░▒░▒▒▐░
#   ░▌▒▒▒▒▒▒▀▀▀▒▒▒▒▒▒░▒░▒░▒░▒▒▒▌░
#   ░▐▒▒▒▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▒▄▒▒▐░░
#   ░░▀▄▒▒▒▒▒▒▒▒▒▒▒░▒░▒░▒▄▒▒▒▒▌░░
#   ░░░░▀▄▒▒▒▒▒▒▒▒▒▒▄▄▄▀▒▒▒▒▄▀░░░
#   ░░░░░░▀▄▄▄▄▄▄▀▀▀▒▒▒▒▒▄▄▀░░░░░
#   ░░░░░░░░░▒▒▒▒▒▒▒▒▒▒▀▀░░░░░░░░
#
# Dependencies:
#   "hipchat-client": "0.0.9"
#
# Configuration:
#   HIPCHAT_TOKEN
#   TIPBOT_AUTH_TOKEN
#   TIPBOT_URL
#
# Commands:
#   tipbot register - register to use tipbot (only needed if you have never been tipped)
#   tipbot address - show the address you can send coins to for tipping
#   tipbot balance - show your current balance
#   tipbot history - show transaction history
#   tipbot tip @mentionName <amount> - tip someone coins e.g. tipbot tip @ExampleUser 10
#   tipbot withdraw <personalAddress> - withdraw your tips into your personal wallet
# 
# Author:
#   ninetwentyfour
# 
# WARNING:
#   This is a pretty basic start to this script. Don't keep large amounts of dogecoins in this app!

HipchatClient = require('hipchat-client')
crypto = require('crypto')
HipChat = new HipchatClient(process.env.HIPCHAT_TOKEN)

# make sure the email is a string and not blank
validEmail = (email) ->
  # pulled regex from https://github.com/chriso/validator.js
  emailRegex = /^(?:[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+\.)*[\w\!\#\$\%\&\'\*\+\-\/\=\?\^\`\{\|\}\~]+@(?:(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!\.)){0,61}[a-zA-Z0-9]?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9\-](?!$)){0,61}[a-zA-Z0-9]?)|(?:\[(?:(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\.){3}(?:[01]?\d{1,2}|2[0-4]\d|25[0-5])\]))$/
  return false if typeof email isnt "string"
  return false if not email? or email is ''
  emailRegex.test(email)

module.exports = (robot) ->
  # list tipbot commands
  robot.hear /tipbot (commands|help)/i, (msg) ->
    commands = "tipbot register (only needed if never recieved a tip) \n" +
               "tipbot address (returns the address you can deposit coins into for tipping) \n" +
               "tipbot balance (returns how many coins you have) \n" +
               "tipbot history (show your transaction history) \n" +
               "tipbot tip @mentionName amount (e.g. tipbot tip @ExampleUser 10) \n" +
               "tipbot withdraw personalAddress (pull your coins out of tipbot)"
    msg.send commands

  # register with tipbot
  robot.hear /tipbot register/i, (msg) ->
    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      return msg.send("Error") unless validEmail(email)
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      console.log "#{from_hash} is registering"
      robot.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}/register")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          console.log object

    msg.send "You have been registered."

  # get address to send coins to
  robot.hear /tipbot address/i, (msg) ->
    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      return msg.send("Error") unless validEmail(email)
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      robot.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          msg.send object.address

  # get current balance
  robot.hear /tipbot balance/i, (msg) ->
    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      return msg.send("Error") unless validEmail(email)
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      robot.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}/balance")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          balance = (if (isNaN(object.balance)) then 0 else object.balance)
          msg.send "You have #{balance} dogecoins"

  # get transaction history
  robot.hear /tipbot history/i, (msg) ->
    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      return msg.send("Error") unless validEmail(email)
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      robot.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}/history")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          msg.send body

  # tip someone
  robot.hear /tipbot tip (.\S*) (.\d*)/i, (msg) ->
    to_name = msg.match[1].trim()
    amount = msg.match[2]

    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      return msg.send("Error") unless validEmail(email)
      from_hash = crypto.createHash('md5').update(email).digest('hex')

      HipChat.getMailByMentionName to_name.substring(1), (email) ->
        return msg.send("Error") unless validEmail(email)
        to_hash = crypto.createHash('md5').update(email).digest('hex')

        data = JSON.stringify({from: from_hash, to: to_hash, amount: amount})
        robot.http("#{process.env.TIPBOT_URL}/wallet/tip")
          .headers('Authorization': process.env.TIPBOT_AUTH_TOKEN, 'Accept': 'application/json', 'Content-Type': 'application/json')
          .post(data) (err, res, body) ->
            object = JSON.parse(body)
            msg.send "Tip sent! Such kind shibe."

  # withdraw coins to personal wallet
  robot.hear /tipbot withdraw (.*)/i, (msg) ->
    wallet_address = msg.match[1]

    HipChat.getMailByMentionName msg.message.user.mention_name, (email) ->
      return msg.send("Error") unless validEmail(email)
      from_hash = crypto.createHash('md5').update(email).digest('hex')
      robot.http("#{process.env.TIPBOT_URL}/wallet/#{from_hash}/withdraw/#{wallet_address}")
        .headers(Authorization: process.env.TIPBOT_AUTH_TOKEN, Accept: 'application/json')
        .get() (err, res, body) ->
          object = JSON.parse(body)
          msg.send object.message
