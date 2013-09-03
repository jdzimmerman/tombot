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
username or= "pm"
password = process.env.HUBOT_JIRA_PASSWORD
password or="s3ndgr1d"
domain = process.env.HUBOT_JIRA_DOMAIN
domain or="jira.sendgrid.net"
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
    msg.send("/code show|list projects                         #list all available jira projects\nshow|list <projectKey> issues <status>     #list all issues from the selected project with the selected status\nshow|list all issues <status>              #list all issues from all projects with the selected status\n<jiraTicketNumber> Comment <comment>       #add a comment to the issue selected\nmove <jiraTicketNumber> to <status>        #moves the jira ticket to the new status (Many statuses work)")

  #*****************************
  # Move Command
  #*****************************
  robot.respond /move (.*) to (.*)/i, (msg) ->
    issue=msg.match[1]
    action=msg.match[2]
    #msg.send("Action: "+action)
    path = '/rest/api/2/issue/'+issue+"/transitions"
    url = "https://" + domain + path

    actionAlias = ''
    transitionCode = ''

    # Read json file for project transition commands
    fs = require 'fs'
    #msg.send("Directory: "+__dirname)
    fs.readFile __dirname+'/projectData.json', (err, projectData) ->
      if err
        msg.send("Error: "+err)
      projectData = JSON.parse(projectData)

      #get the project code from the issue name
      issueCode = issue.split("-");

      #loop through the projects and find the current one from the issueCode
      for project in projectData.Projects
        if project.Code == issueCode[0].toLowerCase()
          #we found the correct project, now find the correct command
          for command in project.Commands
            if command.Name == action.toLowerCase()
              #set the transitionCode and actionAlias from the json data
              actionAlias = command.Alias
              transitionCode = command.Code

      #msg.send("Alias: "+actionAlias+ " TransitionCode: "+transitionCode)
      data={"transition":{"id":transitionCode}}

      #call the transition api
      msg.http(url)
        .header('Content-Length', data.length)
        .header('Content-Type', "application/json")
        .auth(auth)
        .post(JSON.stringify(data)) (err, res, body) ->
          #if successfull tell the user and then post comment
          if(res.statusCode==204)
            msg.send("Successfully moved "+issue)
            path = '/rest/api/2/issue/'+issue+'/comment'
            url ="https://" + domain + path
            data={"body":"TOMBOT: "+msg.message.user.name+" moved "+issue+" to "+actionAlias}

            #call the comment api
            msg.http(url)
              .header('Content-Length', data.length)
              .header('Content-Type', "application/json")
              .auth(auth)
              .post(JSON.stringify(data)) (err, res, body) ->
                if err
                  console.log(err)
                  console.log(body+res)

          else if(res.statusCode==400)
            msg.send("That Transition Is Not Available for "+issue)
          else
            console.log(err)
            msg.send("Error trying to move "+issue)

  #*****************************
  # Deploy Command
  #*****************************
  robot.hear /deploy (.*)/i, (msg) ->
    userid = msg.message.user.id
    msg.send("User "+JSON.stringify(msg.message.user))
    msg.http("https://api.hipchat.com/v1/users/show?user_id="+userid+"&format=json&auth_token=09d7f55d7da159faae36d9a14b1a0e")
      .get() (err,res,body) ->
        json = JSON.parse(body)
        msg.send("HipChat Email: "+json.user.email)
    path = '/rest/api/2/user/search?username=ryan.sullivan@sendgrid.com'
    url = "https://" + domain + path

    msg.http(url)
      .auth(auth)
      .get() (err, res, body) ->
        json = JSON.parse(body)
        msg.send("Jira UserName: "+json[0].emailAddress)




  #*****************************
  # Comment Command
  #*****************************
  robot.respond /(.*) comment (.*)/i, (msg) ->
    issue=msg.match[1]
    comment=msg.match[2]
    # msg.send("Issue: "+issue+" Comment: "+comment)
    path = '/rest/api/2/issue/'+issue+"/comment"
    url = "https://" + domain + path
    username = msg.message.user.name
    if username == "undefined"
      username or= "PM User"
    data={"body":username+": "+comment}
    #call the comment api
    msg.http(url)
      .header('Content-Length', data.length)
      .header('Content-Type', "application/json")
      .auth(auth)
      .post(JSON.stringify(data)) (err, res, body) ->
        if err
          console.log(err)
          console.log(body+res)
        else
          msg.send("Succefully Addded Comment to "+issue)



  robot.respond /((show|list))? (.*) issues (.*)?/i, (msg) ->
    issueState = msg.match[4]
    project = if msg.match[3] then msg.match[3] else "ops-req"

    if issueState.toLowerCase() == "todo" then issueState = "'open','reopened'"
    else if issueState.toLowerCase() == "done" then issueState = "'resolved','closed'"
    else if issueState.toLowerCase() == "test" then issueState = "'qa'"
    else if issueState.toLowerCase() == "ready to deploy" then issueState = "'merged','in deployment'"
    else issueState = "'"+issueState+"'"
    issueState = "("+issueState+")"
    #msg.send "Searching for issues in project "+project
    getIssues msg, issueState, project, (response) ->
      #msg.send response

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
      if json.issues? then for issue in json.issues
        msg.send(issue.key+"("+issue.fields.summary+") - http://"+domain+"/browse/"+issue)

