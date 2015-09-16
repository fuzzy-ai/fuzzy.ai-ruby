# FuzzyIo

Client library for the fuzzy.io RESTful API

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'fuzzy_io'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install fuzzy_io

## Usage

This gem handles the most basic usage of Fuzzy.io.

  # Require the module

  require 'fuzzy_io'

  # Your API key (get one from https://fuzzy.io/)

  API_KEY = 'YOUR_API_KEY_HERE'

  # Create an account object

  acct = FuzzyIo::Account.new API_KEY

  # ID of the agent you want to call; get it from https://fuzzy.io/

  AGENT_ID = 'AGENT_ID_HERE'

  # Inputs; map of string or symbol to numbers

  inputs = {
    input1: 10,
    input2: 30
  }

  # Ask the agent to evaluate the inputs; returns two values!

  outputs, evaluation_id = acct.evaluate AGENT_ID, inputs

  # Outputs is all the outputs

  puts outputs["output1"]

  # An opaque ID for the evaluation

  puts evaluation_id

  # For feedback, provide a performance metric

  performance = {
    performance1: 3
  }

  fb = acct.feedback evaluation_id, performance

### FuzzyIo::Account

Class representing a single account; you can use it to do evaluations and give
feedback.

#### initialize(key)

Takes a string representing the API key. You can get the key on the top of your
account page on https://fuzzy.io/ .

#### evaluate(agent_id, inputs)

Takes a string representing the agent ID, and a hash mapping input names
(strings or symbols) to numbers.

Response is two values (2!) -- a map of the output names to numbers, and a
string for the evaluation ID.

#### feedback(evaluation_id, peformance)

Takes a string for the evaluation ID, and a hash mapping performance metrics to
numbers. You can provide more than one metric.

The metrics will be optimized to increase -- so, number of clicks,
profit on sale, etc. If you have a number that will go towards negative infinity,
multiple it by -1. If you have a number that will go toward zero, give its
inverse (1/x).

## Contributing

1. Fork it ( https://github.com/fuzzy-io/ruby/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
