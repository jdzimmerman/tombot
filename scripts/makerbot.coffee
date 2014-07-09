# Description
#   Maintains a really simple queue for the Denver makerbot.
#
# Dependencies:
#   
#
# Configuration:
#   
#
# Commands:
#   hubot queue me => adds user to queue
#  	hubot remove me => removes user from queue
#   hubot show queue => shows entire queue
#	hubot clear list => clears entire list
#	hubot remove <user> => attempts to remove <user> from queue.
#
# Author:
#   jhloa2

queue = []

module.exports = (robot)->
	robot.respond /queue( me)/i, (msg)->
		user = msg.message.user.name
		date = new Date
		queue.push {user: user, date: date}
		msg.send "Successfully added user " + user + " to queue!"

	robot.respond /show queue/i, (msg)->
		position = 1
		for item in queue
			msg.send "Position: " + position.toString() + ", User: " + item['user'] + ", Time: " + item['date']
			position += 1

	robot.respond /remove( me)/i, (msg)->
		user = msg.message.user.name
		queue = (x for x in queue when x['user'] != user)
		msg.send "Attempted to remove " + user + " from queue."

	robot.respond /clear list/i, (msg)->
		queue = []
		msg.send "Hope you meant to do that because queue is cleared!"

	robot.respond /remove (.*)/i, (msg)->
		user = msg.match[1]
		queue = (x for x in queue when x['user'] != user)
		msg.send "Attempted to remove " + user + " from queue."
