# Description:
#   The Force Push Magnifier
#
# Dependencies:
#   git
#   The force
#
# Configuration:
#   None
#
# Commands:
#   force-pushed - Jedi force tricks
#
# Author:
#   Travis & Michael


module.exports = (robot) ->
  robot.hear /\b(force-pushed)\b/i, (msg) ->
    msg.send 'http://i.imgur.com/dqSIv6j.gif'
