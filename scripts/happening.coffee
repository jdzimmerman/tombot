# Description:
#   Ron Paul Says It's Happening
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listening for "it's happening"
#
# Author:
#   tomszymanski

happenings = [
	"http://www.reactiongifs.com/wp-content/uploads/2013/05/Ron-Paul_Its-Happening1.gif"
]

module.exports = (robot) ->
  robot.hear /it's happening|its happening|It's happening|Its happening|It's Happening|Its Happening/i, (msg) ->
    msg.send msg.random happenings