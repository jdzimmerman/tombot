# Description:
#   Dilbert
#
# Dependencies:
#   "htmlparser": "1.7.6"
#
# Configuration:
#   None
#
# Commands:
#   hubot show me dilbert - gets the daily dilbert
#
# Author:
#   evilmarty

cheerio = require('cheerio')

module.exports = (robot) ->
  robot.respond /((show|fetch)( me )?)?dilbert/i, (msg) ->
    dilbert(msg)

dilbert = (msg) ->
  msg.robot.http('http://rss.latunyi.com/dilbert/dilbert.php')
    .get() (err, resp, body) ->
      msg.send get_dilbert body

get_dilbert = (body) ->
  $ = cheerio.load(body.replace(/<!\[CDATA\[([^\]]+)]\]>/ig, "$1"),{ ignoreWhitespace : true, xmlMode : true});
  $('items').text()