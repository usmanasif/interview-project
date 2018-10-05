Dir[File.join('app/controllers', '**/base_controller.rb')].each { |file| require File.expand_path(file) }
Dir[File.join('app/serializers', '**/book_serializer.rb')].each { |file| require File.expand_path(file) }

module Api
  module V1
    class BooksController < Api::BaseController

      get '/books' do
        books = Book.all
        books.map { |book| BookSerializer.new(book) }.to_json
      end

      get '/books/:id' do |id|
        book = Book.where(id: id).first
        halt(404, { message:'Book Not Found'}.to_json) unless book
        BookSerializer.new(book).to_json
      end

      get '/books/:isbn' do |isbn|
        book = Book.where(id: isbn).first
        halt(404, { message:'Book Not Found'}.to_json) unless book
        BookSerializer.new(book).to_json
      end

      post '/books' do
        authors_ids = json_params[:author_ids]
        halt(404, { message:'Atleat one author id is needed'}.to_json) unless (authors_ids&.size.to_i > 0)
        authors = Author.where(id: json_params[:author_ids])
        halt(404, { message:'Some other ids are invalid'}.to_json) unless (authors&.size != authors_ids.size)
        book = Book.new(json_params)

        if book.save && (book.authors << authors)
          response.headers['Location'] = "/books/#{book.id}"
          status 201
        else
          status 422
          body BookSerializer.new(book).to_json
        end
      end

      patch '/books/:id' do |id|
        book = Book.where(id: id).first
        halt(404, { message:'Book Not Found'}.to_json) unless book
        if book.update_attributes(json_params)
          BookSerializer.new(book).to_json
        else
          status 422
          body BookSerializer.new(book).to_json
        end
      end

      delete '/books/:id' do |id|
        book = Book.where(id: id).first
        halt(404, { message:'Book Not Found'}.to_json) unless book
        book.destroy if book
        status 204
      end

    end
  end
end
