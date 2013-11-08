# Description:
#   TomTom
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   1) listen for "@tom" --> 2) ... --> Profit!
#
# Author:
#   mr-joshua
tom = [
  "https://lh4.googleusercontent.com/-m4AGYxekTis/Ulh1iY6Qn0I/AAAAAAAAAIs/b6PSanaQ_VU/w630-h420-no/Tom1.jpg",
  "https://lh5.googleusercontent.com/-G4bNX7m2VPk/Ulh1iUhlKyI/AAAAAAAAAIk/I45-hH8h2Es/w424-h283-no/Tom2.jpg",
  "https://lh5.googleusercontent.com/-cUy7I2Mh5es/Ulh1iZ6RMOI/AAAAAAAAAI0/B9BjDdGh9YU/w500-h400-no/Tom3.jpg",
  "https://lh6.googleusercontent.com/-7KvceSyKn-I/Ulh1ixmgTJI/AAAAAAAAAI8/ZOgBldOjW3s/w470-h671-no/Tom4.jpg",
  "https://lh3.googleusercontent.com/-Be1atPjw8Ws/Ulh1jLRGTMI/AAAAAAAAAJA/h_YCZjnXjvs/w510-h320-no/Tom5.jpg"
]

module.exports = (robot) ->
  robot.hear /tomothy/i, (msg) ->
    msg.send msg.random tom
