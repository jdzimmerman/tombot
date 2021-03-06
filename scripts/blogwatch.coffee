#Description
#   Parse some RSS feeds and show who is up next for to write a blog post.
#   Intended to be used for individual author feeds.
#
# Dependencies:
#   "moment": "~2.8.3",
#   "async": "~0.9.0"
#
# Commands:
#   hubot blog set <url> - register an RSS feed for yourself
#   hubot blog set <name> <url> - register an RSS feed for someone else
#   hubot blog me - see the last time you published a post
#   hubot blog show <name> - see the last time <name> published a post
#   hubot blog status - see status all registered RSS feeds
#   hubot blog next - see who is due to write the next post
#
# Author:
#   Brandon West <brawest@gmail.com>

async = require("async")
moment = require("moment")

module.exports = (robot) ->
  #blog me
  robot.respond /blog me?(.+)?/i, (msg) ->
    user = robot.brain.userForId(msg.message.user.id)
    if user.blogFeedUrl
      loadRSSFeed msg, user.blogFeedUrl, (err,result) ->
          if err
            msg.reply "There was a problem loading the feed (#{user.blogFeedUrl})."
          else
            msg.reply "Last published on " + moment(result.date).format("MMMM Do YYYY") + ", " + moment(result.date).fromNow() + "."
    else
      msg.reply "What's your feed address? Use @bot blog set <url>"

  #blog show <name>
  robot.respond /blog show\s+([\w .\-]+)/i, (msg) ->
    name = msg.match[1].trim()
    users = robot.brain.usersForFuzzyName(name)

    if users.length is 1
      user = users[0]
      if user.blogFeedUrl
        loadRSSFeed msg, user.blogFeedUrl, (err,result) ->
          if err
            msg.reply "There was a problem loading the feed (#{user.blogFeedUrl})."
          else
            msg.reply "#{user.name} published on " + moment(result.date).format("MMMM Do YYYY") + ", " + moment(result.date).fromNow() + "."
    else
      msg.reply "Sorry, I'm not sure who #{name} is."
  
  #blog status
  robot.respond /blog status?/i, (msg) ->    
    output = new Array
    
    loadAllFeeds robot, (err, results) ->
      for result in results
        output.push result.author + " last published " + moment(result.date).format("MMMM Do YYYY") + ", " + moment(result.date).fromNow() + "."
    
      msg.send output.join("\n")
    
  #blog next
  robot.respond /blog next?(.+)?/i, (msg) ->
    loadAllFeeds robot, (err, results) ->
      result = results[0]
      name = result.author
      users = robot.brain.usersForFuzzyName(name)
      
      if users.length is 1
        user = users[0]
        name = user.mention_name
        msg.send "Next up for a blog post is @#{name}!"
      else
        msg.send "Next up for a blog post is #{name}!"

  #blog set <url>
  robot.respond /blog set\s+(https?:\/\/[^\s]+)/i, (msg) ->
    user = robot.brain.userForId(msg.message.user.id)
    user.blogFeedUrl = msg.match[1].trim()
    msg.reply "Got it!"

  #blog set <name> <url>
  robot.respond /blog set\s+([\w .\-]+)\s+(https?:\/\/[^\s]+)/i, (msg) ->
    name = msg.match[1].trim()
    users = robot.brain.usersForFuzzyName(name)
    if users.length is 1
      user = users[0]
      user.blogFeedUrl = msg.match[2].trim()
      msg.reply "Got it! I set #{user.name}'s RSS feed url."
    else
      msg.reply "Sorry, I'm not sure who #{name} is."

sortResults = (err, results) ->
  if results.length > 1
    results = results.sort(compareDates);
  results

compareDates = (a,b) ->
  if a?.date? and b?.date?
    if moment(a.date) < moment(b.date)
      return -1
    if moment(a.date) > moment(b.date)
      return 1
    0

loadAllFeeds = (robot, callback) ->
  blogFeedUrls = new Array()
  for id, user of robot.brain.users()
    if user.blogFeedUrl?
      blogFeedUrls.push(user.blogFeedUrl)

  async.map(blogFeedUrls, (feedUrl, callback) ->
    loadRSSFeed(robot, feedUrl, (err,results) ->
      callback err, results
    )
  , (err, results) ->
    results = results.filter((n) ->
      n?
    )
    sorted = sortResults err,results
    callback err, sorted
  )

loadRSSFeed = (robot, q, callback) ->
  url = "https://ajax.googleapis.com/ajax/services/feed/load?v=1.0&num=1&q=#{q}"
  robot.http(url)
    .get() (err, res, body) ->
      result = JSON.parse(body)
      if result.error
        callback "#{result.error}"
        return

      if result?.responseData?.feed?.entries[0]?
        entry = result.responseData.feed.entries[0];
        response = {author: entry.author, date: entry.publishedDate, title: entry.title}
        callback null, response
      else
        callback "#{result.error}", null