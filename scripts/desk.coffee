module.exports = (robot) ->
  robot.respond /sit down$/i, (msg) ->
    @exec = require('child_process').exec

    params = "d"
    
    ms = 3000
    params = params.concat(ms)

    command = "curl https://api.spark.io/v1/devices/53ff74065075535146321387/"
    command = command.concat("move -d access_token=")
    command = command.concat("fe40b68bb3de0a4b35b8510eb1f2278dca4168e7 ")
    command = command.concat("-d params=#{params}")

    @exec command, (error, stdout, stderr) ->
      msg.send stdout

  robot.respond /stand up$/i, (msg) ->
    @exec = require('child_process').exec

    params = "u"
    
    ms = 3000
    params = params.concat(ms)

    command = "curl https://api.spark.io/v1/devices/53ff74065075535146321387/"
    command = command.concat("move -d access_token=")
    command = command.concat("fe40b68bb3de0a4b35b8510eb1f2278dca4168e7 ")
    command = command.concat("-d params=#{params}")

    @exec command, (error, stdout, stderr) ->
      msg.send stdout

  robot.respond /vibrate$/i, (msg) ->
    @exec = require('child_process').exec

    params = "v"
    
    ms = 5
    params = params.concat(ms)

    command = "curl https://api.spark.io/v1/devices/53ff74065075535146321387/"
    command = command.concat("move -d access_token=")
    command = command.concat("fe40b68bb3de0a4b35b8510eb1f2278dca4168e7 ")
    command = command.concat("-d params=#{params}")

    @exec command, (error, stdout, stderr) ->
      msg.send stdout
