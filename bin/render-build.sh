#!/usr/bin/env bash

# Exit on error
set -o errexit

# Print commands before executing them
set -o xtrace

# Specify Ruby version
export RUBY_VERSION=2.7.0

# Install specific bundler version compatible with your Gemfile.lock
gem install bundler -v '2.0.0.pre.3' --no-document

# Use the installed bundler version
export BUNDLER_VERSION=2.0.0.pre.3

# Clean any previous bundle
rm -f .bundle/config

# Install dependencies
bundle _2.0.0.pre.3_ install

# Precompile assets
bin/rails assets:precompile
bin/rails assets:clean

# Run database migrations
bin/rails db:migrate