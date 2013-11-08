# Description:
#   For Interacting with CountyMyReps.com
#
# Dependencies:
# 
#
# Configuration:
#   None
#
# Commands:
#   
#
# Author:
#   tomszymanski
module.exports = (robot) ->
  robot.respond /countmyreps/i, (msg) ->
    msg.robot.http('http://countmyreps.com/parseapi/get_data.php?email=tom.szymanski%40sendgrid.com&json=1')
      .get() (err, res, body) ->
        anaheim_total = JSON.parse(body).california.total
        boulder_total = JSON.parse(body).boulder.total
        denver_total = JSON.parse(body).denver.total
        ri_total = JSON.parse(body).rhode_island.total
        euro_total = JSON.parse(body).euro.total

        msg.send "\nAnaheim: #{anaheim_total} \nBoulder: #{boulder_total} \nDenver: #{denver_total} \nRhode Island: #{ri_total} \nEurope: #{euro_total} \n"