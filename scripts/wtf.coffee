# Description:
#   WTF Stares
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   wtf
#
# Author:
#   tomszymanski

wtfs = [
	'http://www.gifsforum.com/images/gif/wtf/grand/65990164_wtf_gif.gif',
	'http://www.reactiongifs.com/wp-content/uploads/2012/12/wedding-crashers-wtf.gif',
	'http://25.media.tumblr.com/tumblr_m7bdklh68o1rw47tho1_400.gif',
	'http://www.arwrath.com/content/1/112255.gif',
	'http://www.reactiongifs.com/wp-content/uploads/2013/06/Marty-McFly-What.gif',
	'http://i.imgur.com/6nOpSJh.gif',
	'http://27.media.tumblr.com/tumblr_lw7zc5yylf1qdsft1o1_500.gif',
	'http://www.reactiongifs.com/wp-content/uploads/2013/06/what-the-f-tom-delonge.gif',
	'http://www.gifgifgifgifgif.com/gif/835.gif',
	'http://www.gifgifgifgifgif.com/gif/8650.gif',
	'http://www.gifgifgifgifgif.com/gif/700.gif',
	'http://www.gifgifgifgifgif.com/gif/50.gif',
	'http://www.gifgifgifgifgif.com/gif/12140.gif',
	'http://www.gifgifgifgifgif.com/gif/5215.gif',
	'http://www.gifgifgifgifgif.com/gif/720.gif',
	'http://www.gifgifgifgifgif.com/gif/5630.gif',
	'http://www.gifgifgifgifgif.com/gif/4585.gif',
	'http://www.gifgifgifgifgif.com/gif/5210.gif',
	'http://www.gifgifgifgifgif.com/gif/12440.gif',
	'http://www.gifgifgifgifgif.com/gif/705.gif',
	'http://www.gifgifgifgifgif.com/gif/11850.gif'
]

module.exports = (robot) ->
  robot.hear /\b(wtf)\b/i, (msg) ->
    msg.send msg.random wtfs