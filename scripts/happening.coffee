# Description:
#   Andy Sandberg saying Cool Beans
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listening for "cool beans"
#
# Author:
#   tomszymanski

happenings = [
	"http://mrwgifs.com/wp-content/uploads/2013/04/Hot-Rods-Andy-Samberg-Cool-Beans-Reaction-Gif.gif"
]

module.exports = (robot) ->
  robot.hear /cool beans/i, (msg) ->
    msg.send msg.random happenings