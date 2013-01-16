## Welcome to Support Roulette, wait a minute while we transfer your call…

Do you need a support phone number in your company? What do you think about a phone number that rotates between your team members?

In the company that I work for, we decided to have a support developer per week, a guy who will carry a support cellphone at night, weekend etc. If there is an emergency in our website this cellphone will ring.

Everybody has already a cellphone, carrying another isn't a good idea. That's the motivation of Support Roulette.

## How it works

Basically, create a [Twilio](http://www.twilio.com) account, get a phone number, configure the `application.yml`, that's it.

**config/application.yml**

```yaml
agents:
  - {name: "Batman", phone: "+5511111111111"}
  - {name: "Homer", phone: "+5511222222222"}
twilio:
  account_sid: ""
  auth_token: ""
  from_call: "+5511333333333"
  from_sms: "+5511444444444"
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

You can configure [Heroku Scheduler](https://addons.heroku.com/scheduler) (for free) to notify the current support agent automatically.

The current support agent will by notified by SMS

`Congratulations you are the current support agent!`

Congratulations??? :trollface:

#### Note

There is an explicit `if Date.today.sunday?` on `scheduler:notify_current_agent`, it exists to guarantee that the current support agent will be notified only when it was rotated (on sundays).



