# ShiftCipher

A simple shift cipher, also known as a Caesar cipher

## Installation

Add this line to your application's Gemfile:

```
gem 'shift_cipher'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shift_cipher

## Usage

Initialise the Caesar cipher

```
  cipher = ShiftCipher::Caesar.new(3) # initialised with an offset of 3 ('a' = 'd')
```

or

```
  cipher = ShiftCipher::Caesar.new(-3) # initialised with a negative offset of 3 ('a' = 'x')
```

or


```
  cipher = ShiftCipher::Caesar.new('d') # initialised with an offset of 3 ('a' = 'd')
```

Encrypt a message:

```
  encrypted_message = cipher.encrypt('hello world') 
  p encrypted_message # => "khoor zruog"
```

Decrypt a message:

```
  decrypted_message = cipher.decrypt('khoor zruog') 
  p decrypted_message # => "hello world"
```

### Using the CLI tool:

````
  shift_cipher [options] text
````

#### Options
   ```-h, --help```                Displays help message
   ```-o, --offset OFFSET```       Sets the alphabet offset
   ```-s, --start START```         Sets the starting letter of the shifted alphabet
   ```-d, --decrypt```             Decrypts the given message    Decrypt


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/shift_cipher/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
