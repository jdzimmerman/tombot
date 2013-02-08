# Description:
#   Generates commands to track days since an event
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot it's <number> days until <event> - Set the day when the event happened
#   hubot how long until <event>? - Display the number of days since the event
#
# Author:
#   tomszymanski
module.exports = (robot) ->
  robot.respond /it's (\d+) days until\s+(.*?)[.?!]?$/i, (msg) ->
    date = new Date
    date.setTime(date.getTime() + (parseInt(msg.match[1])*1000*24*60*60))
    date.setHours(0,0,0,0)
    robot.brain.data.days_since ||= {}
    robot.brain.data.days_since[msg.match[2]] = date
    msg.send "okay, it's " + msg.match[1] + " days until " + msg.match[2]

  robot.respond /how long until\s+(.*?)\??$/i, (msg) ->
    if robot.brain.data.days_since && robot.brain.data.days_since[msg.match[1]]
      date = robot.brain.data.days_since[msg.match[1]]
      days_since = Math.floor((new Date(date).getTime() - new Date) / (1000*24*60*60))
      if days_since == 0
      	msg.send msg.match[1] + " is today!"
      else if days_since < 0
      	msg.send msg.match[1] + " already happened."
      else
      	msg.send "it's " + days_since + " day(s) until " + msg.match[1]
    else
      msg.send "I don't recall that event"