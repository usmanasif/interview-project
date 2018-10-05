require 'rubygems' if RUBY_VERSION < "1.9"
require 'bundler/setup'
require 'sinatra'
require 'sinatra/base'
require "sinatra/activerecord"
require 'json'
require 'logger'

Dir[File.join('app/helpers', '**/*._helper.rb')].each { |file| require File.expand_path(file) }
Dir[File.join('app/controllers', '**/*_controller.rb')].each { |file| require File.expand_path(file) }
Dir[File.join('app/models', '**/*.rb')].each { |file| require File.expand_path(file) }

run Api::BaseController
run Api::V1::BooksController
run Api::V1::AuthorsController
