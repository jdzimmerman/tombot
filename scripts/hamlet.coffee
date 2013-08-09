# Description:
#   Hamlet Quotes
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listen for @hamlet --> provide awesome hamlet quote
#
# Author:
#   tomszymanski
#   http://www.goodreads.com/work/quotes/1885548-hamlet

hamlets = [
	"/quote This above all: to thine own self be true, And it must follow, as the night the day, Thou canst not then be false to any man.",
	"/quote Doubt thou the stars are fire; Doubt that the sun doth move; Doubt truth to be a liar; But never doubt I love.",
	"/quote There is nothing either good or bad, but thinking makes it so.",
	"/quote To be, or not to be: that is the question",
	"/quote To die, to sleep - To sleep, perchance to dream - ay, there's the rub, For in this sleep of death what dreams may come...",
	"/quote There are more things in Heaven and Earth, Horatio, than are dreamt of in your philosophy.",
	"/quote Though this be madness, yet there is method in't.",
	"/quote Brevity is the soul of wit.",
	"/quote Conscience doth make cowards of us all.",
	"/quote My words fly up, my thoughts remain below: Words without thoughts never to heaven go.",
	"/quote Sweets to the sweet.",
	"/quote Now cracks a noble heart. Good-night, sweet prince; flights of angels sing thee to thy rest.",
	"/quote One may smile, and smile, and be a villain.",
	"/quote The lady doth protest too much, methinks.",
	"/quote When sorrows come, they come not single spies. But in battalions!",
	"/quote This above all: to thine own self be true.",
	"/quote Madness in great ones must not unwatched go.",
	"/quote I loved Ophelia. Forty thousand brothers could not, with all their quantity of love, make up my sum.",
	"/quote Give every man thy ear, but few thy voice.",
	"/quote Words, words, words.",
	"/quote I am but mad north-north-west. When the wind is southerly, I know a hawk from a handsaw.",
	"/quote God hath given you one face, and you make yourself another.",
	"/quote To be honest, as this world goes, is to be one man picked out of ten thousand.",
	"/quote Something is rotten in the state of Denmark.",
	"/quote I must be cruel only to be kind; bad begins, and worse remains behind.",
	"/quote So full of artless jealousy is guilt, It spills itself in fearing to be spilt."
]
module.exports = (robot) ->
  robot.hear /@hamlet/i, (msg) ->
    msg.send msg.random hamlets