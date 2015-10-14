# Description:
#   manage members who want to eat pizza.
#
# Commands:
# hubot achieve <user> <achievement> - record <user>'s <achievement>
# hubot achieve-list <user> - show <user>'s achievements
# hubot achieve-help - show help

module.exports = (robot) ->
  init = ->
    robot.brain.data.achievement ?= {}

  cmds = require("./achievements")(robot.brain.data, robot.name)

  robot.respond /achieve\s+(\S.*)$/i, (msg) ->
    init()
    args = msg.match[1].split /\s+/
    msg.send cmds.increment(args)

  robot.respond /achieve-list\s+(\S.*)$/i, (msg) ->
    init()
    args = msg.match[1].split /\s+/
    msg.send cmds.list(args)

  robot.respond /achieve-help/i, (msg) ->
    msg.send cmds.help()
