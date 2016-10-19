# slack_uberzeit

Minimal Rails 5 app to control your
[uberzeit](https://github.com/ninech/uberzeit) timer via slack.

It's still in very early development, pull requests/issues are very welcome!

## Deploy it!

### Create a slack integration

* Go to https://yourteam.slack.com/apps/manage/custom-integrations
* Slash commands
* Add Configuration:
* Choose A command: /uberzeit (this is what I prefer)
* Fill in the following:
..* URL: https://example.com (we'll change that later)
..* Customize Name: Uberzeit
..* Customize Icon: Just upload an icon you like
..* Autocomplete > Description: Uberzeit timer manager
..* Autocomplete > Usage hint: [info/start/stop] [time_type]
* Save Integration

### Setup rails app

To setup the basic stuff just run `bin/setup`.

Fill out `.env.production` with your data.

In the `config/users.yml` you'll have to store all the users with their uberzeit
API keys. So the key is the slack username and value is the uberzeit API key.

Publish the app under a domain and go back to the slack custom integrations and
change the url to the following: `https://<yourdeployedapp>.com/api`


## Usage

![alt text](doc/basic.gif)

To go a little more advanced you can use `/uberzeit start time_type`. Let's say
you have a Homeoffice time type configured in your uberzeit app, you can then
use `/uberzeit start homeoffice`.
Side note: if the time type is not availabe, it will print all the time types
available, so you can choose one of them, of course they're case-insensitive.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/siegy22/slack_uberzeit. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
