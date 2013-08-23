# Description:
#   Miley Cyrus
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   miley me
#
# Author:
#   tomszymanski
miley = [
  "http://cdn.sheknows.com/articles/2013/06/Miley-Cyrus-Cant-Stop-Teeth.gif",
  "http://i.perezhilton.com/wp-content/uploads/2013/06/tumblr_monubuafof1ru3yoeo1_500.gif",
  "http://31.media.tumblr.com/c8c5c4e08a74867dacb5c7cd0789bf1f/tumblr_monkkp10wZ1sqneito1_500.gif",
  "http://24.media.tumblr.com/e6b187b5ceccf2544b7cc7a1f480cb24/tumblr_monj7r9TPK1qct818o1_400.gif",
  "http://cdn.sheknows.com/articles/2013/06/Miley-Cyrus-Cant-Stop-dancing-bears.gif",
  "http://31.media.tumblr.com/949b3801564e20aa3832ff6c84ba18c9/tumblr_monsgeYGZF1rvv267o1_500.gif",
  "http://rack.1.mshcdn.com/media/ZgkyMDEzLzA2LzE5L2QyL21pbGV5Y3lydXNmLmQ0NGMwLmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/00d406b5/d27/miley-cyrus-fingers-o.gif",
  "http://rack.0.mshcdn.com/media/ZgkyMDEzLzA2LzE5LzAwLzIxcWpwLmMxOTI0LmdpZgpwCXRodW1iCTEyMDB4OTYwMD4/cfce20e4/881/21qjp.gif",
  "http://rack.2.mshcdn.com/media/ZgkyMDEzLzA2LzE5L2IzL01pbGV5Ni5kZjlkZS5naWYKcAl0aHVtYgkxMjAweDk2MDA-/8e643423/54b/Miley-6.gif",

]

module.exports = (robot) ->
  robot.respond /miley me/i, (msg) ->
    msg.reply msg.random infomercial
