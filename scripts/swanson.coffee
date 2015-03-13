# Description:
#   Motivation from Ron Swanson
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   hubot swanson me - Motivates you to be more awesome
#
# Author:
#   danielmurphy
# Modified by Eric Barnard
#   - returns animated GIFs to increase awesomeness

module.exports = (robot) ->
  robot.respond /swanson me$/i, (msg) ->
   images = [
      "http://media.giphy.com/media/Be7iMvNVSPL7G/giphy.gif",
      "http://media.giphy.com/media/A6zNIVa9ggyWc/giphy.gif",
      "http://media.giphy.com/media/WET7HHGLaYec0/giphy.gif",
      "http://media.giphy.com/media/L0LVMx7sn1Id2/giphy.gif",
      "http://media.giphy.com/media/xkqTRFkgzKPF6/giphy.gif",
      "http://media2.giphy.com/media/e3HeWt2zBu4AU/giphy.gif",
      "http://media0.giphy.com/media/b9IUb8DEXM1JC/giphy.gif",
      "http://media.giphy.com/media/IdmfEtnMWPzOg/giphy.gif",
      "http://media.giphy.com/media/RaGBLqdHJOQ8w/giphy.gif",
      "http://media3.giphy.com/media/t3QBygPkz1zJC/giphy.gif",
      "http://media.giphy.com/media/uPWPoHdtpYkww/giphy.gif",
      "http://media.giphy.com/media/A413bgMWn5ew/giphy.gif",
      "http://media2.giphy.com/media/9HhbIaWdz4F1K/giphy.gif",
      "http://media.giphy.com/media/HKx5p4APGBxi8/giphy.gif",
      "http://media.giphy.com/media/a1ehUmSCgihr2/giphy.gif",
      "http://media3.giphy.com/media/XBu2hy3y2X9Bu/giphy.gif",
      "https://media.giphy.com/media/qZiUOutzxgfKM/giphy.gif",
      "http://media.giphy.com/media/wGB3JIcR6yyIw/giphy.gif",
      "http://27.media.tumblr.com/tumblr_m0mgytbSfc1qe2ha5o1_500.gif",
      "http://s3-ec.buzzfed.com/static/2013-10/enhanced/webdr01/27/11/anigif_enhanced-buzz-20586-1382888933-26.gif",
      "http://media1.giphy.com/media/FpuWitmVjjSE/giphy.gif"]
    msg.send msg.random images
