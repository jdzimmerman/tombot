# Description:
#   Insert Pictures of Magic: The Gathering Cards
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot cast <card name> - a picture of the named magic card
#
# Author:
#   djljr

querystring = require 'querystring';


module.exports = (robot) ->
  robot.respond /cast (.+)/i, (msg) ->
    url = "http://gatherer.wizards.com/Handlers/Image.ashx"
    card = msg.match[1] || "Dismal%20Failure"
    query = { type: "card", name: card }
    msg.send "#{url}?#{querystring.stringify(query)}#.jpg"

  robot.respond /price (.+)/i, (msg) ->
    card_name = msg.match[1]
    msg.http("http://blacklotusproject.com/json/")
      .query
        cards : card_name
      .get() (err, res, body) ->
        result = JSON.parse(body)

        msg.send card_name + "'s average price is $" + result.cards[0].average
