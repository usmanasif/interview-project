Dir[File.join('app/controllers', '**/base_controller.rb')].each { |file| require File.expand_path(file) }
Dir[File.join('app/serializers', '**/author_serializer.rb')].each { |file| require File.expand_path(file) }
module Api
  module V1
    class AuthorsController < Api::BaseController

      get '/authors' do
        authors = Author.all
        authors.map { |author| AuthorSerializer.new(author) }.to_json
      end

      get '/authors/:id' do |id|
        author = Author.where(id: id).first
        halt(404, { message:'Author Not Found'}.to_json) unless author
        AuthorSerializer.new(author).to_json
      end

      post '/authors' do
        author = Author.new(json_params)
        if author.save
          response.headers['Location'] = "/authors/#{author.id}"
          status 201
        else
          status 422
          body AuthorSerializer.new(author).to_json
        end
      end

      patch '/authors/:id' do |id|
        author = Author.where(id: id).first
        halt(404, { message:'Author Not Found'}.to_json) unless author
        if author.update_attributes(json_params)
          AuthorSerializer.new(author).to_json
        else
          status 422
          body AuthorSerializer.new(author).to_json
        end
      end

      delete '/authors/:id' do |id|
        author = Author.where(id: id).first
        halt(404, { message:'Author Not Found'}.to_json) unless author
        author.destroy if author
        status 204
      end

    end
  end
end
