module.exports = (data, bot_name) ->
  return {
    "help": () ->
      return  """
              Hubot-achievements logs what you achieved.
              commands:
              `#{bot_name} achieve <user> <achievement>` - increment <user>'s <achievement>.
              `#{bot_name} achieve-list <user>` - show <user>'s achievements.
              `#{bot_name} achieve-help` - show this help.
              """
    
    "increment": (args) ->
      if args.length < 2
        return "usage: `#{bot_name} achieve <user> <achievement>`"
      [user, achievement] = args
      data.achievement[user] ?= {}
      data.achievement[user][achievement] ?= 0
      data.achievement[user][achievement] += 1
      return "#{user} achieved #{achievement} (#{data.achievement[user][achievement]})"

    "list": (args) ->
      if args.length < 1
        return "usage: `#{bot_name} achieve-list <user>`"
      [user] = args
      data.achievement[user] ?= {}
      val = "* #{user}'s achievements\n"
      for achievement of data.achievement[user]
        val += "#{achievement}: #{data.achievement[user][achievement]}\n"
      return val
  }
