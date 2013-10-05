## Welcome to Support Roulette, wait a minute while we transfer your call…

Do you need a support phone number in your company? What do you think about a phone number that rotates between your team members?

A long time ago, in a galaxy far, far away, we decided to have a support developer per week, a guy who will carry a support cellphone at night, weekend etc in case of any emergency in the company's website.

Everybody has already a cellphone, carrying another isn't a good idea. That's the motivation of Support Roulette.

## How it works

Basically, create a [Twilio](http://www.twilio.com) account, get a phone number, configure the `application.yml` and nothing more, that's it. :smile:

**config/application.yml.sample**

```yaml
agents:
  - {name: "Batman", phone: "+5511111111111"}
  - {name: "Homer", phone: "+5511111111111"}
twilio:
  account_sid: "abc123"
  auth_token: "abc123"
  from_call: "+5511111111111"
  from_sms: "+5511111111111"
```

You can add as many support agents as you want. They will rotate weekly.

**models/agent.rb**

```ruby
  def self.current
    all[(Date.today.cweek % all.size) - 1]
  end
```


### Notifying the current support agent

You can notify the current support agent by calling:

```shell
$ bundle exec rake scheduler:notify_current_agent
```

Looking for something more automated? You can configure [Heroku Scheduler](https://addons.heroku.com/scheduler) (for free) to notify the current support agent automatically.

The current support agent will by notified by SMS.

`Congratulations you are the current support agent!`

Congratulations??? :trollface:

#### Note

There is an explicit `if Date.today.sunday?` on `scheduler:notify_current_agent`, it exists to guarantee that the current support agent will be notified only when it was rotated (on Sundays).

## To start

```shell
foreman start
open http://localhost:5000
```

The available urls: `/voice_request` and `/notify_current_agent`.

## To run the test suite

```shell
rake spec
```


