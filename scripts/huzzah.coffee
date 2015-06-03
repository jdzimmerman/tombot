# Description:
#   Huzzah
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#  huzzah
#
# Author:
#   Hung and Trevor Smith


module.exports = (robot) ->
  robot.hear /\b(huzzah)\b/i, (msg) ->
    msg.send 'https://s3.amazonaws.com/uploads.hipchat.com/17705/861703/enMm4g1SKzeeQQN/mansoor.gif'
