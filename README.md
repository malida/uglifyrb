# Uglifyrb

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/uglifyrb`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'uglifyrb'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install uglifyrb

## Usage

```ruby
require 'uglifyrb'

Uglifyrb.new.compile(File.read("source.js"))
# => js file minified

# Or alternatively
Uglifyrb.compile(File.read("source.js"))
```

When initializing UglifyJS, you can tune the behavior of UglifyJS by passing options. For example, if you want disable variable name mangling:

```ruby
Uglifyrb.new(:mangle => false).compile(source)

# Or
Uglifyrb.compile(source, :mangle => false)
```

Available options and their defaults are

```ruby
{
  :output => {
    :ascii_only => true,        # Escape non-ASCII characters
    :comments => :copyright,    # Preserve comments (:all, :jsdoc, :copyright, :none, Regexp (see below))
    :inline_script => false,    # Escape occurrences of </script in strings
    :quote_keys => false,       # Quote keys in object literals
    :max_line_len => 32 * 1024, # Maximum line length in minified code
    :bracketize => false,       # Bracketize if, for, do, while or with statements, even if their body is a single statement
    :semicolons => true,        # Separate statements with semicolons
    :preserve_line => false,    # Preserve line numbers in outputs
    :beautify => false,         # Beautify output
    :indent_level => 4,         # Indent level in spaces
    :indent_start => 0,         # Starting indent level
    :space_colon => false,      # Insert space before colons (only with beautifier)
    :width => 80,               # Specify line width when beautifier is used (only with beautifier)
    :preamble => nil            # Preamble for the generated JS file. Can be used to insert any code or comment.
  },
  :mangle => {
    :eval => false,             # Mangle names when eval of when is used in scope
    :except => ["$super"],      # Argument names to be excluded from mangling
    :sort => false,             # Assign shorter names to most frequently used variables. Often results in bigger output after gzip.
    :toplevel => false          # Mangle names declared in the toplevel scope
  },                            # Mangle variable and function names, set to false to skip mangling
  :compress => {
    :sequences => true,         # Allow statements to be joined by commas
    :properties => true,        # Rewrite property access using the dot notation
    :dead_code => true,         # Remove unreachable code
    :drop_debugger => true,     # Remove debugger; statements
    :unsafe => false,           # Apply "unsafe" transformations
    :conditionals => true,      # Optimize for if-s and conditional expressions
    :comparisons => true,       # Apply binary node optimizations for comparisons
    :evaluate => true,          # Attempt to evaluate constant expressions
    :booleans => true,          # Various optimizations to boolean contexts
    :loops => true,             # Optimize loops when condition can be statically determined
    :unused => true,            # Drop unreferenced functions and variables
    :hoist_funs => true,        # Hoist function declarations
    :hoist_vars => false,       # Hoist var declarations
    :if_return => true,         # Optimizations for if/return and if/continue
    :join_vars => true,         # Join consecutive var statements
    :cascade => true,           # Cascade sequences
    :negate_iife => true,       # Negate immediately invoked function expressions to avoid extra parens
    :pure_getters => false,     # Assume that object property access does not have any side-effects
    :pure_funcs => nil,         # List of functions without side-effects. Can safely discard function calls when the result value is not used
    :drop_console => false,     # Drop calls to console.* functions
    :angular => false,          # Process @ngInject annotations
    :keep_fargs => false,       # Preserve unused function arguments
    :keep_fnames => false       # Preserve function names
  },                            # Apply transformations to code, set to false to skip
  :define => {},                # Define values for symbol replacement
  :enclose => false,            # Enclose in output function wrapper, define replacements as key-value pairs
  :source_filename => nil,      # The filename of the input file
  :source_root => nil,          # The URL of the directory which contains :source_filename
  :output_filename => nil,      # The filename or URL where the minified output can be found
  :input_source_map => nil,     # The contents of the source map describing the input
  :screw_ie8 => false,          # Don't bother to generate safe code for IE8
  :source_map_url => false,     # Url for source mapping to be appended in minified source
  :source_url => false          # Url to original source to be appended in minified source
}
```
## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/malida/uglifyrb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

