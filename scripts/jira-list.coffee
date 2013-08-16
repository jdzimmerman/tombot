# Description:
#   Get all issues for a project in jira in a certain status
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_JIRA_DOMAIN
#   HUBOT_JIRA_USER
#   HUBOT_JIRA_PASSWORD
#   HUBOT_JIRA_ISSUE_TYPES
#   HUBOT_JIRA_ISSUE_STATES
#
# Commands:
#   hubot list/show <projectName> issues (in) <status> - Retrieve the list of all the issues in the selected project and selected status
#   hubot list/show projects - Retrieve list of all the projects available for the above query
#
# Author:
#   rysulliv

# e.g. "bug|task|sub task|support ticket|new feature|epic"
jiraTypeList = process.env.HUBOT_JIRA_ISSUE_TYPES
jiraTypeList or= "bug,task,story" #some defaults

formattedIssueLists = ""
issueList = []

issueState = process.env.HUBOT_JIRA_ISSUE_STATES
issueState or= "open|in progress|qa|merged|reopened|scheduled|closed" #some defaults


module.exports = (robot) ->
  #**********************
  #Listing of all projects
  #**********************
  robot.hear /((show|list))? projects/i, (msg) ->
    msg.send("opreq - Ops Requests")
    msg.send("com - Compiance")

  #**********************
  #Listing of all Jira Commands
  #**********************
  robot.hear /((show|list))? jira ((commands|help))/i, (msg) ->
    msg.send("opreq - Ops Requests")
    msg.send("com - Compiance")

  robot.hear /jira ((commands|help))?/i, (msg) ->
    msg.send("opreq - Ops Requests")
    msg.send("com - Compiance")

  robot.hear /((show|list))? (.*) issues( in)? (.*)?/i, (msg) ->
    username = "adam.menges@sendgrid.com" #if msg.match[1] then msg.message.user.email.split('@')[0] else null
    issueState = if msg.match[4] and msg.match[4] != "in" and msg.match[4] !=" in" then msg.match[4]
    else if msg.match[5] then msg.match[5]
    project = if msg.match[3] then msg.match[3] else "ops-req"

    if issueState.toLowerCase() == "todo" then issueState = "open,reopened"
    if issueState.toLowerCase() == "done" then issueState = "resolved,closed"
    if issueState.toLowerCase() == "test" then issueState = "qa"
    if issueState.toLowerCase() == "ready to deploy" then issueState = "merged"
    issueState = "("+issueState+")"
    #msg.send "Searching for issues in project "+project
    getIssues msg, issueState, username, project, (response) ->
      msg.send response

getIssues = (msg, issueState, assignee, project, callback) ->

  username = process.env.HUBOT_JIRA_USER
  password = process.env.HUBOT_JIRA_PASSWORD
  domain = process.env.HUBOT_JIRA_DOMAIN

  #msg.send "Forming Query..."

  #msg.send "Creating Jira Type Lists...."

  #msg.send "Jira Type List includes - "+jiraTypeList

  type = 'issueType in (' + jiraTypeList + ')'
  user = if assignee? then ' and assignee="' + assignee + '"' else ''
  if issueState? then msg.send "Jira Issue State = "+issueState else msg.send "No Issue State"
  status = if issueState? then ' and status in ' + issueState else 'and status!=closed'
  projectString = if project? and project.toLowerCase() != 'all' then ' and project = '+project
  else if project? and project.toLowerCase() == 'all' then 'and project in (ad,com,op,opreq,mkt,uxui,meme,core,bo)' else ''

  path = '/rest/api/latest/search'
  url = "https://" + domain + path
  currentSprint = if project.toLowerCase() != 'opreq' and project.toLowerCase() !='op' and project.toLowerCase() != 'ad' and project.toLowerCase() != 'all' then ' and sprint in openSprints()' else ' '
  queryString = type + status + projectString + currentSprint + " order by rank"
  auth = "Basic " + new Buffer(username + ':' + password).toString('base64')

  #msg.send "Querying "+url+queryString
  msg.http(url)
    .header('Authorization', auth)
    .query(jql: queryString)
    .get() (err, res, body) ->
      json = JSON.parse(body)
      if json.total? then msg.send(json.total+" Issues Found")
      if json.issues? then for issue in json.issues
        msg.send(issue.key+" - "+issue.self)

