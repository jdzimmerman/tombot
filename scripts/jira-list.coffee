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

username = process.env.HUBOT_JIRA_USER
password = process.env.HUBOT_JIRA_PASSWORD
domain = process.env.HUBOT_JIRA_DOMAIN
auth = "#{username}:#{password}"


module.exports = (robot) ->
  http = require 'https'
  #**********************
  #Listing of all projects
  #**********************=
  robot.hear /((show|list))? projects/i, (msg) ->
    msg.send("opreq - Ops Requests")
    msg.send("op - Ops-New")
    msg.send("com - Compiance")
    msg.send("bo - Back Office")
    msg.send("ad - Admin")
    msg.send("mkt - Marketing")
    msg.send("uxui - UX/UI Team")
    msg.send("meme - Meme Team")
    msg.send("core - Core Transactional")
    msg.send("ap - App Team")

  #**********************
  #Listing of all Jira Commands
  #**********************
  robot.hear /jira ((commands|help))/i, (msg) ->
    msg.send("show|list projects - list all available jira projects")
    msg.send("show/list <projectCode|all> issues (in) <status> - list all issues from the selected project with the selected status")
    msg.send("<jiraTicketNumber> start - moves the jira ticket to 'in progress'")
    msg.send("<jiraTicketNumber> schedule - moves the jira ticket to 'scheduled'")
    msg.send("<jiraTicketNumber> resolve - moves the jira ticket to 'resovled'")
    msg.send("<jiraTicketNumber> close - moves the jira ticket to 'closed'")
    msg.send("<jiraTicketNumber> in test - moves the jira ticket to 'qa'")
    msg.send("<jiraTicketNumber> qa - moves the jira ticket to 'qa'")
    msg.send("<jiraTicketNumber> code review - moves the jira ticket to 'code review'")
    msg.send("<jiraTicketNumber> merge - moves the jira ticket to 'merged'")
    msg.send("<jiraTicketNumber> move to production - moves the jira ticket to 'merged'")
    msg.send("<jiraTicketNumber> ready to deploy - moves the jira ticket to 'merged'")



  robot.respond /move (.*)?/i, (msg) ->
    msg.send("Matched Word is: "+msg.match[1])
    issue=msg.match[1]
    path = '/rest/api/2/issue/'+issue+"/transitions"
    url = "https://" + domain + path
    msg.send(url)
    msg.http(url)
      .auth(auth)
      .post({"transition":"5"}) (err, res, body) ->
        msg.send("Post returned: "+JSON.parse(body))
        json = JSON.parse(body)
        msg.send(json)


  robot.hear /((show|list))? (.*) issues( in)? (.*)?/i, (msg) ->
    issueState = if msg.match[4] and msg.match[4] != "in" and msg.match[4] !=" in" then msg.match[4]
    else if msg.match[5] then msg.match[5]
    project = if msg.match[3] then msg.match[3] else "ops-req"

    if issueState.toLowerCase() == "todo" then issueState = "open,reopened"
    if issueState.toLowerCase() == "done" then issueState = "resolved,closed"
    if issueState.toLowerCase() == "test" then issueState = "qa"
    if issueState.toLowerCase() == "ready to deploy" then issueState = "merged,'in deployment'"
    issueState = "("+issueState+")"
    #msg.send "Searching for issues in project "+project
    getIssues msg, issueState, project, (response) ->
      msg.send response

getIssues = (msg, issueState, project, callback) ->



  #msg.send "Forming Query..."

  #msg.send "Creating Jira Type Lists...."

  #msg.send "Jira Type List includes - "+jiraTypeList

  type = 'issueType in (' + jiraTypeList + ')'
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
        msg.send(issue.key+"("+issue.fields.issuetype.name+") - "+issue.self)

