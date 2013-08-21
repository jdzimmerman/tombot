# Description:
#   Looks up jira issues when they're mentioned in chat
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_JIRA_DOMAIN
#   HUBOT_JIRA_IGNORECASE (optional; default is "true")
#   HUBOT_JIRA_USERNAME (optional)
#   HUBOT_JIRA_PASSWORD (optional)
#
# Commands:
# 
# Author:
#   stuartf

module.exports = (robot) ->
  cache = []
  jiraDomain = process.env.HUBOT_JIRA_DOMAIN
  jiraUrl = "https://" + jiraDomain
  http = require 'https'

  jiraUsername = process.env.HUBOT_JIRA_USERNAME
  jiraPassword = process.env.HUBOT_JIRA_PASSWORD
  if jiraUsername != undefined && jiraUsername.length > 0
    auth = "#{jiraUsername}:#{jiraPassword}"

  http.get {host: jiraDomain, auth: auth, path: "/rest/api/2/project"}, (res) ->
    data = ''
    res.on 'data', (chunk) ->
      data += chunk.toString()
    res.on 'end', () ->
      json = JSON.parse(data)
