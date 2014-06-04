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
#   listen for loon --> provide a loon image followed by a loon call
#
# Author:
#   nquinlan

loonImages = [
  "http://www.loon.org/assets/images/HomePage-LoonWithChick.jpg",
  "http://www.statesymbolsusa.org/IMAGES/Minnesota/common_loon_masterclipweb.jpg",
  "http://www.learner.org/jnorth/images/graphics/h-l/loon_hagge11.jpg",
  "http://swanlakemaine.org/img/loon.jpg",
  "http://newsite.beachwoodhollow.com/wp-content/uploads/loons_on_stoco_lake.jpg",
  "http://www.sciencebuzz.org/sites/default/files/images/loon2.jpg",
  "http://www.umlaufstudio.com/images/loons.jpg",
  "http://www.watchiclake.org/powercms/imagesupload/cms_files/Loons%207-15-13-8.jpg",
  "http://www.northernimages.com/Wildlife/Birds/Loons/i-FvDbd8h/0/XL/WBL-02259-XL.jpg",
  "http://www.animalhi.com/thumbnails/detail/20121101/birds%20canadian%20lakes%20reflections%20loon%202776x1159%20wallpaper_www.animalhi.com_45.jpg"
]

loonCalls = [
  "http://etc.nicholasquinlan.com/bird-calls/resources/loon-call.mp3",
  "http://www.xeno-canto.org/download.php?XC=154996",
  "http://www.xeno-canto.org/download.php?XC=138264",
  "http://www.xeno-canto.org/download.php?XC=138256",
  "http://www.xeno-canto.org/download.php?XC=134512",
  "http://www.xeno-canto.org/download.php?XC=103422",
  "http://www.xeno-canto.org/download.php?XC=103421",
  "http://www.xeno-canto.org/download.php?XC=94142",
  "http://www.xeno-canto.org/download.php?XC=83957",
  "http://www.xeno-canto.org/download.php?XC=83547"
]


module.exports = (robot) ->
  robot.hear /loon me/i, (msg) ->
    msg.send msg.random loonImages
    msg.send "\u25B6 " + msg.random loonCalls
