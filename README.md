# Icms

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/icms`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'icms'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install icms

## Usage

First of all create a new instance of Icms::States passing the taxes rates and the separator. example:
```ruby
state_rates = Icms::StateRates.new

# Use get_percentual to get the value between two states
puts state_rates.get_percentual(:SP, :AC) # 7.0
puts state_rates.get_percentual(:AC, :SP) # 12.0

# Passing only source state will return that state rate
puts state_rates.get_percentual(:SP) # 18.0

# To obtain all informations about the source and destination state use `get`
result = state_rates.get(:AC, :SP) # <struct Icms::StateRates::Result destination_state=18.0, source_state=17.0, between=12.0>
puts result.source_state # AC: 17.0
puts result.destination_state # AC: 18.0
puts result.between # AC -> SP: 12.0



# You can use a custom rates table instead of using the default table in Icms module
# Rates table
TABLE = <<-TABLE
AC,AL,AM,AP,BA,CE,DF,ES,GO,MA,MT,MS,MG,PA,PB,PR,PE,PI,RN,RS,RJ,RO,RR,SC,SP,SE,TO
--
AC,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
AL,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
AM,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
AP,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
BA,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
CE,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
DF,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
ES,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
GO,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
MA,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
MT,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
MS,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12
MG,7,7,7,7,7,7,7,7,7,7,7,7,18,7,7,12,7,7,7,12,12,7,7,12,12,7,7
PA,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12,12
PB,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12,12,12
PR,7,7,7,7,7,7,7,7,7,7,7,7,12,7,7,18,7,7,7,12,12,7,7,12,12,7,7
PE,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12,12
PI,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12,12
RN,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12,12,12,12
RS,7,7,7,7,7,7,7,7,7,7,7,7,12,7,7,12,7,7,7,17,12,7,7,12,12,7,7
RJ,7,7,7,7,7,7,7,7,7,7,7,7,12,7,7,12,7,7,7,12,19,7,7,12,12,7,7
RO,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12,12
RR,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12,12,12,12
SC,7,7,7,7,7,7,7,7,7,7,7,7,12,7,7,12,7,7,7,12,12,7,7,17,12,7,7
SP,7,7,7,7,7,7,7,7,7,7,7,7,12,7,7,12,7,7,7,12,12,7,7,12,18,7,7
SE,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17,12
TO,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,12,17
TABLE

separator = ','

state_rates = Icms::StateRates.new(table, separator)
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/icms. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
