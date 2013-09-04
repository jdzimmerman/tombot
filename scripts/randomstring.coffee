# Description:
#   Because animals are animals.
#
# Dependencies:
#   "htmlparser": "1.7.6"
#   "soupselect": "0.2.0"
#
# Configuration:
#   None
#
# Commands:
#   hubot animal me - Grab a random gif from http://animalsbeingdicks.com/
#
# Author:
#   unsay

Select     = require("soupselect").select
HtmlParser = require "htmlparser"

module.exports = (robot) ->
  robot.respond /random me/i, (msg) ->
  
  msg.http("http://www.sethcardoza.com/api/rest/tools/random_password_generator/length:20/complexity:alphaNumeric")
    .get() (err, res, body) ->
      handler = new HtmlParser.DefaultHandler()
      parser  = new HtmlParser.Parser handler

      string = parser.parseComplete body

  msg.send string
