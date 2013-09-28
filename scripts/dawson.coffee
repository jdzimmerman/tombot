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
  "nerdy" => "http://media.tumblr.com/tumblr_lgbiutS7Go1qf8yek.gif",
  "sleepy" => "http://media.tumblr.com/tumblr_lgbith0wC61qf8yek.gif",
  "eyebrow" => "http://media.tumblr.com/tumblr_lgbisdjUUm1qf8yek.gif",
  "wave" => "http://media.tumblr.com/tumblr_lgbira8pXh1qf8yek.gif",
  "disco" => "http://media.tumblr.com/tumblr_lgbira8pXh1qf8yek.gif"

}

module.exports = (robot) ->
  robot.respond /(.*) dawson/i, (msg) ->
    msg.reply msg.match[1]
