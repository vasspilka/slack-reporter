# Slack Reporter

A very simple wrapper for a a simple wrapper for posting to slack channels.
requires [slack-notifier](https://github.com/stevenosloan/slack-notifier)

### Requirements
A slack channel with webhooks intergration and your api key in the `SLACK_WEBHOOK_URI` environmental variable and this
`gem 'slack-reporter'` in your gemfile.

### Usage

```
SlackReporter.new('user reporter', { channel: '#awesome-feedback' }).call do
  "#{current_user.name} said we are awesome!"
end
```

This will report the following to the '#awesome-feedback` channnel
```
user_reporter BOT  10:04 PM
Bob said we are awesome!
```

Ofcourse whats the use without defaults!! SlackReporter uses four defaults, one for the webhook, one for the channel and two for naming the reporter.
They default to

```
{
  webhook:  ENV["SLACK_WEBHOOK_URI"],
  channel:  '#feedback',
  name:     'user',
  followup: '_announcer'
}
```
You can set your own by `SlackReporter.defaults` by providing the values you want to change afterwards.


With defauts set the reporter can be called simply by

```
SlackReporter.new.call do
  "Important message!!"
end
```

### Notes
The reporter gets called *ONLY* on production enviroments if inside Rails or Hanami.
To report regardless of environment call `#call` with `true` in arguments e.g.
`SlackReporter.new.call(true)`


You can create as many custom reporters as you want and the use them by calling `#call` and giving them a block of text. e.g.

```
@reporter1 = SlackReporter.new("Nelson said")
@reporter1.call { 'Hahaa' }
```


The naming of a reporter matches the name if its 2 words or more, else its the `name` + `followup`
Also you can put an object or class instead of a name and slack-reporter will combine the object class, or class with the followup to create the name.

There is an `attr_accessor` for name and channel in case you want to change them for an existing reporter.

The code is just 50 lines long so for any questions you might want to check it out!
