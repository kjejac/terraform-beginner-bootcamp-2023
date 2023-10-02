# Terraform Beginner Bootcamp 2023 - Week 2

## Working with Ruby

### Bundler

Bundler is a package manager for Ruby. 
It is the primary way to install Ruby packages (known as gmes) for Ruby.

#### Install Gems

You need to create a Gemfile and define your gmes in that file.

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```

Then you need to run the `bundle install` command.

This will install the gem on the system globally (unlike nodejs which install packages in place in a directory called node_modules).

A Gemfile.lock will be created to lock down the gem versions used in this project.

#### Executing Ruby scripts in the context of bundler

We have to use `bundle exec` to tell future Ruby scripts to use gems we installed. This is the way we set context.

### Sinatra

Sinatra is a micro web-framework for Ruby to build web-apps.

Its great for mock or developments servers or for very simple projects.

You can create a web-server in a single file.

[Sinatra](https://sinatrarb.com/)

## Terratowns Mock Web Server

### Running the web server

We can run the web server by executing the following commands:

```rb
bundle install
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.