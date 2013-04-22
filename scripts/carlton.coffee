# Description:
#   Carlton & More Celebration
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   dance - Display a dancing Carlton
#
# Author:
#   pingles
#   http://www.funnyordie.com/lists/1d2da3358d/the-best-dancing-gifs

carltons = [
	"http://media.tumblr.com/tumblr_lrzrlymUZA1qbliwr.gif",
	"http://3deadmonkeys.com/gallery3/var/albums/random_stuff/Carlton-Dance-GIF.gif",
	"http://gifsoup.com/webroot/animatedgifs/987761_o.gif",
	"http://gifsoup.com/view1/1307943/carlton-banks-dance-o.gif",
	"http://s2.favim.com/orig/28/carlton-banks-dance-Favim.com-239179.gif",
	"http://gifsoup.com/webroot/animatedgifs/131815_o.gif",
	"http://media.tumblr.com/tumblr_lrzrlymUZA1qbliwr.gif",
	"http://3deadmonkeys.com/gallery3/var/albums/random_stuff/Carlton-Dance-GIF.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/1.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/2.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/3.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/4.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/5.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/6.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/7.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/8.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/9.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/10.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/11.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/12.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/13.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/14.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/15.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/16.gif",
	"http://hubot-assets.s3.amazonaws.com/dance/17.gif"
]

module.exports = (robot) ->
  robot.hear /\b(dance|happy)\b/i, (msg) ->
    msg.send msg.random carltons