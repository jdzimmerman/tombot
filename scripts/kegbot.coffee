# Description:
#   Kegbot Integration support
#
# Dependencies:
#   None
#
# Configuration:
#   KEGBOT_NAME (default: kegbot)
#   KEGBOT_URL
#
# Commands:
#   #{KEGBOT_NAME} commands|help
#   #{KEGBOT_NAME} taps
#
# Author:
#   ppgengler
VERSION = '0.1.0'

KEGBOT_NAME = process.env.KEGBOT_NAME || "kegbot"

module.exports = (robot) ->
  # list kegbot commands (allow if not configured)
  robot.hear new RegExp("#{KEGBOT_NAME}( commands| help)?$", "i"), (msg) ->
    commands = "#{KEGBOT_NAME} Integration - #{VERSION}\n" +
               "-------------------------------\n" +
               "#{KEGBOT_NAME} commands|help - display this help menu\n" +
               "#{KEGBOT_NAME} kegs - display information about all the kegs\n" +
               "#{KEGBOT_NAME} keg <id> - display detailed information about a specific keg\n" +
               "#{KEGBOT_NAME} taps - display information about all the taps\n" +
               "#{KEGBOT_NAME} tap <id> - display detailed information about a specific tap\n"
    msg.send commands

  # check kegbot configuration and stop further process if not configured
  robot.hear new RegExp(KEGBOT_NAME, "i"), (msg) ->
    unless process.env.KEGBOT_URL
      console.error "KEGBOT_URL is missing"
      msg.send "#{KEGBOT_NAME} Integration is NOT configured!  See your administrator."
      msg.finish()

  # All items below here are skipped if not configured

  # list kegs
  robot.hear new RegExp("#{KEGBOT_NAME} kegs$", "i"), (msg) ->
    url = "#{process.env.KEGBOT_URL}/api/kegs"
    robot.http(url)
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        object = JSON.parse(body)
        kegs = object.objects
        for keg in kegs
          msg.send formatKegHeader(keg)

  # info keg
  robot.hear new RegExp("#{KEGBOT_NAME} keg (\\d+)$", "i"), (msg) ->
    url = "#{process.env.KEGBOT_URL}/api/kegs/#{msg.match[1]}"
    robot.http(url)
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        object = JSON.parse(body)
        if keg = object.object
          msg.send formatKegHeader(keg) + formatKegDetails(keg)
        else
          msg.send "I'm sorry, I don't know any information about that keg! (perhaps use the keg's ID?)"

  # list taps
  robot.hear new RegExp("#{KEGBOT_NAME} taps$", "i"), (msg) ->
    url = "#{process.env.KEGBOT_URL}/api/taps"
    robot.http(url)
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        object = JSON.parse(body)
        taps = object.objects
        for tap in taps
          msg.send formatTapHeader(tap)

  # info tap
  robot.hear new RegExp("#{KEGBOT_NAME} tap (\\d+)$", "i"), (msg) ->
    url = "#{process.env.KEGBOT_URL}/api/taps/#{msg.match[1]}"
    robot.http(url)
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        object = JSON.parse(body)
        if tap = object.object
          msg.send formatTapHeader(tap) + formatTapDetails(tap)
        else
          msg.send "I'm sorry, I don't know any information about that tap! (perhaps use the tap's ID?)"


#*** HELPER METHODS

formatKegHeader = (keg) ->
  beverage = keg.beverage
  message = "#{beverage.name} (id:#{keg.id})"
  message += " - ON TAP" if keg.online
  message += " - #{keg.percent_full.toFixed(0)}% remaining"
  message += " (#{(keg.remaining_volume_ml / 1000.0).toFixed(2)} / #{(keg.full_volume_ml / 1000.0).toFixed(2)} L)\n"

  message += "#{beverage.picture.thumbnail_url}\n" if beverage.picture

  message += "#{beverage.description}\n" if beverage.description

  message

formatKegDetails = (keg) ->
  beverage = keg.beverage
  producer = beverage.producer
  message = "\n"
  message += "Style: #{beverage.style}\n"
  message += "Brewery:\n"
  message += "  Name: #{producer.name}\n"
  message += "  URL: #{producer.url}\n"
  message += "  Location: #{[producer.origin_city, producer.origin_state, producer.country].join(', ')}\n"
  message += "  Description: #{producer.description}\n"
  message

formatTapHeader = (tap) ->
  message = "#{tap.name} (id:#{tap.id}):\n"
  if keg = tap.current_keg
    message += formatKegHeader(keg)
  else
    message += "OPEN\n"

formatTapDetails = (tap) ->
  if keg = tap.current_keg
    formatKegDetails(keg)
  else
    ""
