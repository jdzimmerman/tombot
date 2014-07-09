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
               "#{KEGBOT_NAME} taps - display information about all the taps\n"
               "#{KEGBOT_NAME} tap <id> - display detailed information about a specific tap\n"
    msg.send commands

  # check kegbot configuration and stop further process if not configured
  robot.hear new RegExp(KEGBOT_NAME, "i"), (msg) ->
    unless process.env.KEGBOT_URL
      console.error "KEGBOT_URL is missing"
      msg.send "#{KEGBOT_NAME} Integration is NOT configured!  See your administrator."
      msg.finish()

  # All items below here are skipped if not configured

  # list taps
  robot.hear new RegExp("#{KEGBOT_NAME} taps$", "i"), (msg) ->
    url = "#{process.env.KEGBOT_URL}/api/taps"
    robot.http(url)
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        object = JSON.parse(body)
        taps = object.objects
        for tap in taps
          msg.send formatTapBrief(tap)

  # info tap
  robot.hear new RegExp("#{KEGBOT_NAME} tap (\\d+)$", "i"), (msg) ->
    url = "#{process.env.KEGBOT_URL}/api/taps/#{msg.match[1]}"
    robot.http(url)
      .headers(Accept: 'application/json')
      .get() (err, res, body) ->
        object = JSON.parse(body)
        if tap = object.object
          msg.send formatTapFull(tap)
        else
          msg.send "I'm sorry, I don't know any information about that tap! (perhaps use the tap's ID?)"

formatTapBrief = (tap) ->
  message = "#{tap.name} (id:#{tap.id}): "
  if keg = tap.current_keg
    beverage = keg.beverage
    message += "#{beverage.name}"
    message += " - #{keg.percent_full.toFixed(0)}% remaining"
    message += " (#{(keg.remaining_volume_ml / 1000.0).toFixed(2)} / #{(keg.full_volume_ml / 1000.0).toFixed(2)} L)\n"

    message += "#{beverage.picture.thumbnail_url}\n" if beverage.picture

    message += "#{beverage.description}\n"
  else
    message += "OPEN\n"

formatTapFull = (tap) ->
  message = formatTapBrief(tap)
  if keg = tap.current_keg
    beverage = keg.beverage
    producer = beverage.producer
    message += "\n\n"
    message += "Style: #{beverage.style}\n"
    message += "Brewery:\n"
    message += "  Name: #{producer.name}\n"
    message += "  URL: #{producer.url}\n"
    message += "  Location: #{[producer.origin_city, producer.origin_state, producer.country].join(', ')}\n"
    message += "  Description: #{producer.description}\n"
  else
    message
