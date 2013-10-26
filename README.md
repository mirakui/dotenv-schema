# dotenv-schema [![Build Status](https://travis-ci.org/mirakui/dotenv-schema.png?branch=master)](https://travis-ci.org/mirakui/dotenv-schema)

Dotenv-schema makes [dotenv](https://github.com/bkeepers/dotenv) schemaful.

## Installation
Write `.env` and `.env_schema`:

```shell
$ cat .env
DB_HOST=db.example.com
DB_PORT=3306

$ cat .env_schema
DB_HOST:
DB_PORT:
```

### Rails
Add this line to your application's Gemfile:

```ruby
gem 'dotenv-shcmea-rails'
```

And then execute:
```
$ bundle
$ rails server
```
It fails Dotenv::Schema::ValidationError if the validation failed.

### Sinatra or Plain ol' Ruby
```
$ gem install dotenv
```

```ruby
require 'dotenv-schema'
Dotenv.load # raises Dotenv::Schema::ValidationError if the validation failed.
```

## Schema validation rule and `.env_schema` format
`.env_schema` is based on YAML format.

### Basic rule
It fails validation If any variables which are defined in `.env_schema` don't exist in `.env`.
```shell
# .env_schema
DB_HOST:
DB_PORT:

# .env
DB_HOST=db.example.com
# => Dotenv::Schema::ValidationError: ENV['DB_PORT'] must exist
```

It fails validation If any variables which aren't defined in `.env_schema` exist in `.env`.
```shell
# .env_schema
DB_HOST:

# .env
DB_HOST=db.example.com
DB_PORT=3306
# => Dotenv::Schema::ValidationError: Undefined variable(s): DB_PORT; Please add them into .env_schema
```

### To allow empty string
In default, it fails if any environment variables in `.env` are empty string.
```shell
# .env_schema
DB_HOST:

# .env
DB_HOST=
# => Dotenv::Schema::ValidationError: ENV['DB_HOST'] must not be empty string
```

You can allow it by using `allow_empty_string` option.

```shell
# .env_schema
DB_HOST:
  allow_empty_string: true

# .env
DB_HOST=
# => Passes validation even though DB_HOST is empty
```

### To allow variables to don't exist
```shell
# .env_schema
DB_HOST:
DB_PORT:
  allow_not_exists: true

# .env
DB_HOST=
# => Passes validation even though DB_PORT doesn't exist
```

