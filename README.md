# ShiftCipher

A simple shift cipher, also known as a Caeser cipher

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shift_cipher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shift_cipher

## Usage

Initialise the Caeser cipher

```ruby
  cipher = ShiftCipher::Caeser.new(3) # initialised with an offset of 3 ('a' = 'd')
```

or

```ruby
  cipher = ShiftCipher::Caeser.new('d') # initialised with an offset of 3 ('a' = 'd')
```

Encrypt a message:

```ruby
  encrypted_message = cipher.encrypt('hello world') 
  p encrypted_message # => "khoor zruog"
```

Decrypt a message:

```ruby
  decrypted_message = cipher.decrypt('khoor zruog') 
  p decrypted_message # => "hello world"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/shift_cipher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
