# Delorean
[![CircleCI](https://circleci.com/gh/GetTerminus/delorean-rails.svg?style=svg)](https://circleci.com/gh/GetTerminus/delorean-rails)

A Rails Engine to Control the passage of time in a test bed.
![alt text](http://i.giphy.com/UTKINn9rjA2mQ.gif "Delorean")
## Installation

Add this line to your application's Gemfile:

```ruby
group :test, :development do
  gem 'delorean_test_bed'
end
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install delorean_test_bed

Add routes to your routes.rb

```ruby
  mount Delorean::Engine, at: '/delorean'
```

## Usage

Browse to [localhost:3000/delorean](http://localhost:3000/delorean), stop (pause),
flux (scale), or accelerate (jump) to the times you need to test.

![image](https://cloud.githubusercontent.com/assets/571594/23485262/b64ada12-fea8-11e6-96d7-56c5fb25197f.png)

1. To Reset, Turn the Time Circuits off and Back on
2. To Freeze Time, Turn the Time Circuits Off
3. To Scale Time, enter a value > 1 and flux
4. To Jump to A Time, accelerate (to 88mph) Time will change and continue to run.


### Usage in Test Beds

You may want to know the time factors (start, scale) when writing test beds.
We've built a cache store so that any application (backend/frontend) can share
this information.

```ruby
  Delorean::Cache.read(:start)
  Delorean::Cache.read(:scale)
  Delorean::Cache.read(:future)
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Testing

Please locally test your code. You can test your engine within the dummy app with
```bash
  $ cd test/dummy
  $ rails s
```

Automated tests are handled by mintest (limited to controller thus far)
```bash
  $ rake tests
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/delorean. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
