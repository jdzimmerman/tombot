# Description:
#   Email from hubot to all_support
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot status <message> - Sends email with the <subject> <message> to address <user@email.com>
#
# Author:
#   earlonrails
#
# Additional Requirements
#   unix mail client installed on the system

util = require 'util'
child_process = require 'child_process'
http = require 'http'
url_options =
  hostname: "http://mandrillapp.com"
  path: "/api/1.0/messages/send.json"
  method: "POST"
  agent: "Mandrill-Curl/1.0"

module.exports = (robot) ->
  emailTime = null

  robot.respond /status (.*)/i, (msg) ->
    sendEmail msg.match[1], msg.message.user.name
    msg.reply "Status emailed. (fuckyeah)"