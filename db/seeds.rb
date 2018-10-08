require 'faker'
require "sinatra/activerecord"
Dir[File.join('app/models', '**/*.rb')].each { |file| require File.expand_path(file) }

print "Create authors"

authors = []
15.times do
  print "."
  authors << Author.where(email: Faker::Internet.email, name: Faker::Name.name, gender: Faker::Gender.binary_type).first_or_create
end
print "\n"

print "Create Books"
first = 0

3.times do
  print "."
  book = Book.where(isbn: Faker::Code.isbn, title: Faker::Book.title, number_of_pages: Faker::Number.between(1, 500)).first_or_create
  authors[first..first+5].count
  first += 5
end
print "\n"



