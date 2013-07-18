# Description:
#   Email from hubot to any address
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot email <user@email.com> -s <subject> -m <message> - Sends email with the <subject> <message> to address <user@email.com>
#
# Author:
#   earlonrails
#
# Additional Requirements
#   unix mail client installed on the system

util = require 'util'
child_process = require 'child_process'

module.exports = (robot) ->
  emailTime = null
  sendEmail = (msg, from) -> #recipients is hard-defined, subject is hard-defined, msg, from
    mailArgs = ['-s', 'Support Status Alert', '-a', "From: #{from}", '--'] #need to find out what these need to be
    mailArgs = mailArgs.concat 'jacob@sendgrid.com'
    p = child_process.execFile 'mail', mailArgs, {}, (error, stdout, stderr) ->
      util.print 'stdout: ' + stdout
      util.print 'stderr: ' + stderr
    p.stdin.write "#{msg}\n"
    p.stdin.end()

  robot.respond /status (.*)/i, (msg) ->
    sendEmail msg.match[1], msg.message.user.id
    msg.reply "Status emailed. (fuckyeah)"
