# Description:
#   Animals on Roombas
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   roomba me
#
# Author:
#   tomszymanski
roomba = [
  "http://s3-ec.buzzfed.com/static/enhanced/webdr05/2013/4/26/11/anigif_enhanced-buzz-17087-1366991892-12.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/4/26/11/anigif_enhanced-buzz-28512-1366990942-13.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr03/2013/4/26/12/anigif_enhanced-buzz-7044-1366992705-16.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/4/26/12/anigif_enhanced-buzz-28451-1366993150-19.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/4/26/12/anigif_enhanced-buzz-24924-1366993629-26.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr03/2013/4/26/11/anigif_enhanced-buzz-8794-1366991558-13.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr01/2013/4/26/15/anigif_enhanced-buzz-6707-1367002864-11.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr01/2013/4/26/14/anigif_enhanced-buzz-6763-1366999763-18.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr03/2013/4/26/15/anigif_enhanced-buzz-20774-1367003876-7.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/4/26/12/anigif_enhanced-buzz-27938-1366993835-52.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/4/26/14/anigif_enhanced-buzz-8859-1366999845-21.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/4/26/15/anigif_enhanced-buzz-21568-1367004186-2.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr05/2013/4/26/14/anigif_enhanced-buzz-31925-1366999980-8.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr02/2013/4/26/14/anigif_enhanced-buzz-16085-1367002612-2.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr02/2013/4/26/15/anigif_enhanced-buzz-17815-1367004710-4.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/4/26/16/anigif_enhanced-buzz-1400-1367007770-12.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr02/2013/4/26/15/anigif_enhanced-buzz-14271-1367003618-5.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr06/2013/4/26/16/anigif_enhanced-buzz-17113-1367008149-17.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr02/2013/4/26/16/anigif_enhanced-buzz-29190-1367007181-6.gif",
  "http://s3-ec.buzzfed.com/static/enhanced/webdr02/2013/4/26/16/anigif_enhanced-buzz-29178-1367008389-10.gif",
  "http://www.dogtheblog.net/wp-content/uploads/2010/05/Roombacat.gif",
  "http://www.shootingatbubbles.com/wp-content/uploads/2010/08/funny-pictures-gif-cat-room.gif",
  "https://i.chzbgr.com/maxW500/6073679360/h70381734/",
  "http://25.media.tumblr.com/84e18f78a855e9eecc7be5bd9dacf124/tumblr_mhv08kK5qg1qh3tlco1_400.gif",
  "https://i.chzbgr.com/maxW500/6991108352/hAC70554A/",
  "http://rateeveryanimal.com/wp-content/uploads/2013/05/cat-on-roomba.gif",
  "https://i.chzbgr.com/maxW500/5282873088/hE3ABAE7C/",
  "http://std3.ru/ba/fe/1369414390-bafe28022f89688d950cb2ae69d26328.gif",
  "http://25.media.tumblr.com/tumblr_m9vwgufCWs1qzizmho1_250.gif"
]

module.exports = (robot) ->
  robot.respond /roomba me/i, (msg) ->
    msg.reply msg.random roomba
