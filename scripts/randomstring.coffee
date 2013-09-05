# Description:
#   Random string
#
# Dependencies:
#   "htmlparser": "1.7.6"
#   "soupselect": "0.2.0"
#
# Configuration:
#   None
#
# Commands:
#   random me - generates random alphaNumeric string with a length of 20 characters
#
# Author:
#   tomszymanski

# Select     = require("soupselect").select
# HtmlParser = require "htmlparser"

# module.exports = (robot) ->
#   robot.respond /random me/i, (msg) ->
#   msg.robot.http("http://www.sethcardoza.com/api/rest/tools/random_password_generator/type:json/length:20/complexity:alphaNumeric")
#     .get() (error, response, body)->

#   send JSON.parse(body).password

  
