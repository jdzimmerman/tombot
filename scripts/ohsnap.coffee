# Description:
#   oh snap
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#  oh snap
#
# Author:
#   Hung


module.exports = (robot) ->
  robot.hear /\b(oh snap)\b/i, (msg) ->
    msg.send 'https://i.imgur.com/QFywFtF.gif'
