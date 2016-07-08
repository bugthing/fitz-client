# FitzClient - An Elixir CLI client to an API

Client to acompany a FizzBuzz api sitting on port 3000

## Usage

Ensure you have Elixir 1.3 installed

### Fetch dependancies

    $ mix deps.get

### Run tests

    $ mix test

### Build

    $ mix escript.build

### Run

Ensure you have started the FizzBuzz rails app on localhost port 3000

    $ cd ../fitz-test/ && bundle exec guard

Now you can use the client

    $ ./fitz_client --user abc  --page 321 --page-size 123
