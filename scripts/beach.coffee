# Description:
#   Find Your Beach Ads
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   listen for @FindUrBeach --> provide corona ad
#
# Author:
#   abeach

beachs = [
	"http://brucemctague.com/wp-content/uploads/2011/04/corona-find_your_beach.jpg",
	"http://1.bp.blogspot.com/-dwPf7TaXzbw/Te-mFS4aLuI/AAAAAAAAShg/p6JQapUYYyM/s1600/111322_logoff_68x47kiosk_v2_cropped_72.jpg",
	"http://media.mediapost.com/images/inline_image/2012/03/26/Corona-B.jpg",
	"http://www.jhunderground.com/wp-content/uploads/2011/09/Corona_commercial.jpg",
	"http://windsormedia.blogs.com/.a/6a00d8341c011b53ef016303ace2ee970d-800wi",
	"http://www.thechicagoegotist.com/sites/www.thechicagoegotist.com/files/images/111304_winsome_35x18_v8_cropped_72.preview.jpg",
	"http://www.thechicagoegotist.com/sites/www.thechicagoegotist.com/files/images/111312_lifelime_20x50_v2_cropped_72.preview.jpg",
	"http://www.margaritashack.com/TinyMCE/thumbnail.ashx?src=%2Fcontent%2F163194%2FCorona_Cantina.jpg&size=250",
	"http://behance.vo.llnwd.net/profiles7/1865585/projects/6781181/fb60b7d985fe67f159fb6baf275af54e.jpg",
	"https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcTE2GRQKPmUA4InLJiWzNtXaYKiyIj7OVWSuRNGOb5kmPY1JWocFA",
	"http://b.vimeocdn.com/ts/448/565/448565726_640.jpg",
	"http://marketingleader1.files.wordpress.com/2011/06/corona-extra-unplugged-photo.jpg?w=500",
	"http://payload.cargocollective.com/1/1/60964/1553554/CORONA%20WSJ4_600.jpg",
	"http://www.lafuente.com/images/enlarge_new/2013/06/13/1371156274-can296a.jpg",
	"http://www.neoplexonline.com/catalog/images/F-1552.JPG",
	"http://static.squarespace.com/static/52432941e4b0ae90650adbc2/524357a1e4b06b950f8e237f/524357dce4b03b33d727e517/1380145119904/Corona_MiniBeach_SNOW.jpg",
	"http://static.squarespace.com/static/52432941e4b0ae90650adbc2/524357a1e4b06b950f8e237f/524357dce4b06b950f8e242f/1380145119741/CORONA_MiniBeach_BACKYARD.jpg",
	"http://media.joe.ie/wp-content/uploads/2013/07/ibiza4-634x356.jpg",
	"http://barbanouille.files.wordpress.com/2012/10/find-your-beach-corona-bitch.jpg?w=400&h=225",
	"http://i1.ytimg.com/vi/Jaq1RcfUMJU/maxresdefault.jpg"
]
module.exports = (robot) ->
  robot.hear /@FindUrBeach/i, (msg) ->
    msg.send msg.random beachs