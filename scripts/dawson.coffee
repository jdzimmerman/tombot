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
  nerdy : "http://media.tumblr.com/tumblr_lgbiutS7Go1qf8yek.gif",
  sleepy : "http://media.tumblr.com/tumblr_lgbith0wC61qf8yek.gif",
  eyebrow : "http://media.tumblr.com/tumblr_lgbisdjUUm1qf8yek.gif",
  wave : "http://media.tumblr.com/tumblr_lgbira8pXh1qf8yek.gif",
  disco : "http://media.tumblr.com/tumblr_lgbira8pXh1qf8yek.gif",
  dealwithit : "http://media.tumblr.com/tumblr_lgbinlBeoY1qf8yek.gif",
  spit : "http://media.tumblr.com/tumblr_lgbj6dMOzl1qf8yek.gif",
  check : "http://media.tumblr.com/tumblr_lfrdq2bYTQ1qf8yek.gif",
  doh : "http://media.tumblr.com/tumblr_lfrdr2ft581qf8yek.gif",
  callme : "http://media.tumblr.com/tumblr_lfrdph18C01qf8yek.gif",
  gross : "http://media.tumblr.com/tumblr_lf5scbhNav1qf8yek.gif",
  loser : "http://media.tumblr.com/tumblr_leuthtJThf1qf8yek.gif",
  blewit : "http://media.tumblr.com/tumblr_leutioX0PS1qf8yek.gif",
  tweensmile : "http://media.tumblr.com/tumblr_lf5sj1Ztp81qf8yek.gif",
  vanderpire : "http://media.tumblr.com/tumblr_leutfk28sy1qf8yek.gif",
  whatsup : "http://media.tumblr.com/tumblr_lgbjdhUa8Q1qf8yek.gif",
  married : "http://media.tumblr.com/tumblr_lgbjc0j72L1qf8yek.gif",
  wig : "http://media.tumblr.com/tumblr_lgbjekshoV1qf8yek.gif",
  bringit : "http://media.tumblr.com/tumblr_lgbjamtiVV1qf8yek.gif",
  itstime : "http://media.tumblr.com/tumblr_lgbj9gBHFn1qf8yek.gif",
  hmm : "http://media.tumblr.com/tumblr_lgbj8uInMX1qf8yek.gif",
  slowclap : "http://media.tumblr.com/tumblr_lgbilzDkVB1qf8yek.gif",

}

module.exports = (robot) ->
  robot.hear /(.+) dawson/i, (msg) ->
    type = msg.match[1]
    msg.reply dawson[type]
