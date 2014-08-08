# Description
#   Maintains a really simple queue for the Denver makerbot. 
#	Could be used for other queuing systems.
#
# Dependencies:
#   
#
# Configuration:
#   
#
# Commands:
#   makerbot queue me => adds you to queue
# 	makerbot add me => same as 'makerbot queue me'
#  	makerbot remove me => removes user from queue
#   makerbot show queue => shows entire queue
#	makerbot clear queue => clears entire list
#	makerbot remove <user> => attempts to remove <user> from queue.
#	makerbot add <user> => attempts to add <user> to queue.
#
# Author:
#   jhloa2


makerbot_queue = []

module.exports = (robot)->
	robot.hear /makerbot (queue|add)( me)/i, (msg)->
		user = msg.message.user.name
		date = new Date
		makerbot_queue.push {user: user, date: date}
		msg.send "Successfully added user " + user + " to makerbot queue!"

	robot.hear /makerbot show queue/i, (msg)->
		position = 1
		if makerbot_queue.length == 0
			msg.send "No queue!"

		for item in makerbot_queue
			msg.send "Position: " + position.toString() + ", User: " + item['user'] + ", Time: " + item['date']
			position += 1

	robot.hear /makerbot remove( me)/i, (msg)->
		user = msg.message.user.name
		makerbot_queue = (x for x in makerbot_queue when x['user'] != user)
		msg.send "Attempted to remove " + user + " from makerbot queue."

	robot.hear /makerbot clear queue/i, (msg)->
		makerbot_queue = []
		msg.send "Hope you meant to do that because makerbot queue is cleared!"

	robot.hear /makerbot add (.*)/i, (msg)->
		user = msg.match[1]
		date = new Date
		if user != "me"
			makerbot_queue.push {user: user, date: date}
			msg.send "Attempted to add " + user + " from makerbot queue."

	robot.hear /makerbot remove (.*)/i, (msg)->
		user = msg.match[1]
		if user != "me"
			makerbot_queue = (x for x in makerbot_queue when x['user'] != user)
			msg.send "Attempted to remove " + user + " from makerbot queue."
