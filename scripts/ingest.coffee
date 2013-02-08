# Description:
#   Ingest
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listen for "ingest"
#
# Author:
#   ?

no_fucks = [
  "http://hubot-assets.s3.amazonaws.com/ingest/1.gif",

]

module.exports = (robot) ->
  robot.hear /.*(ingest).*/i, (msg) ->
    msg.send msg.random no_fucks
