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
  "http://img.gawkerassets.com/img/18y7z880lrkpzgif/original.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/8/25/21/anigif_enhanced-buzz-11688-1377481574-8.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr03/2013/8/25/21/anigif_enhanced-buzz-4844-1377481571-9.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/8/25/21/anigif_enhanced-buzz-17744-1377481570-27.gif",
  "http://31.media.tumblr.com/tumblr_m5fqjp3CUo1rs34ldo1_500.gif",
  "http://buzzworthy.mtv.com//wp-content/uploads/buzz/2012/11/miley-5.gif",
  "http://25.media.tumblr.com/tumblr_m8rpn1uHPS1qec4gro1_500.gif",
  "http://data.whicdn.com/images/49971933/tumblr_mgy362VblP1s22gz9o1_500_large.gif",
  "http://fc04.deviantart.net/fs71/f/2012/252/c/0/miley_cyrus__gif__by_lovecomesback-d5e5tkk.gif",
  "http://media.tumblr.com/tumblr_ma5uciRzjI1qkdght.gif"


]

module.exports = (robot) ->
  robot.respond /miley me/i, (msg) ->
    msg.reply msg.random miley
