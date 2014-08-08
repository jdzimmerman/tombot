# Description:
#   The Tron Dev Dance
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   tron dev - Do the tron dev dance
#
# Author:
#   Arjun


module.exports = (robot) ->
  robot.hear /\b(tron dev)\b/i, (msg) ->
    msg.send 'http://assets0.ordienetworks.com/images/GifGuide/dancing/tumblr_lhpckhQ2mO1qamwa1o1_400.gif'