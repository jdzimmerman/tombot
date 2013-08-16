# Description:
#   Get all bugs from JIRA assigned to user
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_JIRA_DOMAIN
#   HUBOT_JIRA_USER
#   HUBOT_JIRA_PASSWORD
#   HUBOT_JIRA_ISSUE_TYPES
#   HUBOT_JIRA_ISSUE_PRIORITIES
#
# Commands:
#   hubot list my bugs - Retrieve the list of all a user's bugs from JIRA ('my' is optional)
#   hubot list my bugs about <searchterm> - Retrieve list of all a user's bugs from JIRA where the summary or description field contains <phrase> ('my' is optional)
#   hubot list my <priority> priority bugs  - Retrieve the list of a user's <priority> priority bugs from JIRA ('my' is optional)
#   hubot list my <priority> priority bugs about <phrase> - Retrieve list of all a user's <priority> priority bugs from JIRA where the summary or description field contains <phrase> ('my' is optional)
#
# Author:
#   crcastle

# e.g. "bug|task|sub task|support ticket|new feature|epic"
issueTypes = process.env.HUBOT_JIRA_ISSUE_TYPES
issueTypes or= "bug|task|sub task|support ticket|new feature|epic" #some defaults

formattedIssueLists = ""
issueList = []

issueState = process.env.HUBOT_JIRA_ISSUE_STATE
issueState or= "open|in progress|qa|merged|reopened|scheduled|closed" #some defaults


module.exports = (robot) ->

  robot.hear /((show|list))? (.*) issues( in)? (.*)?/i, (msg) ->
    msg.send "First word after match "+msg.match[3]
    username = "adam.menges@sendgrid.com" #if msg.match[1] then msg.message.user.email.split('@')[0] else null
    issueState = if msg.match[4] and msg.match[4] != "in" and msg.match[4] !=" in" then msg.match[3]
    else if msg.match[5] then msg.match[5]
    project = if msg.match[1] then msg.match[1] else "ops-req"

    if issueState.toLowerCase() == "todo" then issueState = "open,reopened"
    if issueState.toLowerCase() == "done" then issueState = "resolved,closed"
    issueState = "("+issueState+")"
    msg.send "Searching for issues in project "+project
    getIssues msg, issueState, username, (response) ->
      msg.send response

getIssues = (msg, issueState, assignee, callback) ->

  username = process.env.HUBOT_JIRA_USER
  password = process.env.HUBOT_JIRA_PASSWORD
  domain = process.env.HUBOT_JIRA_DOMAIN

  # do some error handling
  msg.send "Forming Query..."

  msg.send "Creating Jira Type Lists...."

  jiraTypeList = 'bug,story'

  msg.send "Jira Type List includes - "+jiraTypeList

  type = 'issueType in (' + jiraTypeList + ')'
  user = if assignee? then ' and assignee="' + assignee + '"' else ''
  if issueState? then msg.send "Jira Issue State = "+issueState else msg.send "No Issue State"
  status = if issueState? then ' and status in ' + issueState else 'and status!=closed'
  projectString = if project? then ' and project = '+project else ''

  path = '/rest/api/latest/search'
  url = "https://" + domain + path
  queryString = type + user + status + projectString
  auth = "Basic " + new Buffer(username + ':' + password).toString('base64')

  msg.send "Querying "+url+queryString
  msg.http(url)
    .header('Authorization', auth)
    .query(jql: queryString)
    .get() (err, res, body) ->
      json = JSON.parse(body)
      if json.total? then msg.send(json.total+" Issues Found")
      if json.issues? then for issue in json.issues
        msg.send(issue.self)

