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

# e.g. "blocker|high|medium|minor|trivial"
issuePriorities = process.env.HUBOT_JIRA_ISSUE_PRIORITIES
issuePriorities or= "blocker|high|medium|minor|trivial" #some defaults


module.exports = (robot) ->

  robot.hear /((show|list)( me )?)?issues (.*)/i, (msg) ->
    msg.send "First word after match "+msg.match[3]
    username = "adam.menges@sendgrid.com" #if msg.match[1] then msg.message.user.email.split('@')[0] else null
    issueType = if msg.match[5] and msg.match[5] != "issue" then msg.match[5] else null
    msg.send "Searching for issues..."
    getIssues msg, issueType, username, msg.match[3], msg.match[6], (response) ->
      msg.send response

getIssues = (msg, issueType, assignee, priority, phrase, callback) ->

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
  prio = if priority? then ' and priority=' + priority else ''
  search = if phrase? then ' and (summary~"' + phrase + '" or description~"' + phrase + '")' else ''

  path = '/rest/api/latest/search'
  url = "https://" + domain + path
  queryString = type + ' and status!=closed' + user + prio + search
  auth = "Basic " + new Buffer(username + ':' + password).toString('base64')

  msg.send "Querying "+url+queryString
  msg.http(url)
    .header('Authorization', auth)
    .query(jql: queryString)
    .get() (err, res, body) ->
      json = JSON.parse(body)
      if json.total?
      then msg.send(json.total+" Issues Found") for issue in json.issues
        msg.send(issue.self)

