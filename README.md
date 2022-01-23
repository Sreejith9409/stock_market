# Welcome to TruePower

## Description

This application is built to help users to buy/sell stocks.

## Requirements

This app currently works with:

* Ruby 3.0.0
* Rails 6.1.4
* PostgreSQL

## Installation

### Clone the repository

```shell
git clone git@github.com:Sreejith9409/stock_market.git
cd stock_market
```

### Check your Ruby version

```shell
ruby -v
```

The output should start with something like `ruby 3.0.0`

If not, install the right ruby version using [rvm]:

```shell
rvm install 3.0.0
```

### Check your Ruby version

```shell
rails -v
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle
```

### Run below Script for creating database

```shell
rails db:setup
```

### Run below Script for creating stocks data

```shell
rails db:seed
```

### Set development environment variables

To create credentials for development environment, we can run the following command:

```shell
EDITOR="vim" rails credentials:edit --environment=development
```

The above command does the following:
1. Creates config/credentials/development.key if missing. Don’t commit this file to git version, and update the below key and save it.

```shell
ee0dfebe61e69bfba93a7c7d66fd8b10
```

2. Creates config/credentials/development.yml.enc if missing. Commit this file to git version.
3. Decrypts and opens the development credentials file in the default editor.

### Testing
1. Creates config/credentials/test.key if missing. Don’t commit this file to git version, and update the below key and save it.
```shell
1f8724c9e66c60e0bbfa73dc68266125
```
2. Creates config/credentials/development.yml.enc

3. Edit/Update the config using the below commend
```shell
EDITOR="vim" rails credentials:edit --environment=test
```

and copy the values from `development` environment to `test` and save.

## Run the server

```shell
rails s
```

### Refer the below link to get details about the API 

```shell
https://docs.google.com/document/d/1L2Db2bgpZZlUIbM1GIZIYaGEM7DsT9wGbbbnklplPV8/edit?usp=sharing
```

-----
# Best practices

* Use snake case for variable naming
* Use metaprogramming as a last resource
* Abstain from using single line blocks when more than one thing is being done inside of it
* Declare very descriptive method names, no matter if they are long
* Don't name your classes or modules with the type on it, `SearchClass`, `VotableModule`
* Use camel case for naming your classes/modules
* Never build methods with more than 3 arguments
* Choose the syntax `{ key: value }` over `{ :key => value }` for hash
* Choose the one line syntax for `if` and `unless` from the `if/unless ... end` syntax when there is only one condition
* Abstain monkey-patching
* Abstain optional parameters
* Write self-documenting code
* Try to keep your classes as SOLID as possible
* Trust [reek](https://github.com/troessner/reek) & [rubocop](https://github.com/bbatsov/rubocop)