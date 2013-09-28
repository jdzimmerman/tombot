# Description:
#   JamesVanderMeme
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   _blank_ dawson
#
# Author:
#   tomszymanski
dawson = {
  "nerdy" : "http://media.tumblr.com/tumblr_lgbiutS7Go1qf8yek.gif",
  "sleepy" : "http://media.tumblr.com/tumblr_lgbith0wC61qf8yek.gif",
  "eyebrow" : "http://media.tumblr.com/tumblr_lgbisdjUUm1qf8yek.gif",
  "wave" : "http://media.tumblr.com/tumblr_lgbira8pXh1qf8yek.gif",
  "disco" : "http://media.tumblr.com/tumblr_lgbira8pXh1qf8yek.gif",
  "dealwithit" : "http://media.tumblr.com/tumblr_lgbinlBeoY1qf8yek.gif",
  "spit" : "http://media.tumblr.com/tumblr_lgbj6dMOzl1qf8yek.gif",
  "check" : "http://media.tumblr.com/tumblr_lfrdq2bYTQ1qf8yek.gif"
}

module.exports = (robot) ->
  robot.hear /(.*) dawson/i, (msg) ->
    msg.reply dawson[msg.match[1]]
