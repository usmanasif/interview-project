module Api
  class BaseController < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    before do
      content_type 'application/json'
    end

    helpers do
      def json_params
        JSON.parse(request.body.read).map { |k, v| [k.to_sym, v] }.to_h
      rescue
        halt 400, { message:'Invalid JSON', json: request.body.read}.to_json
      end
    end

    get '/' do
      output = "Hello world! Version 3. Now with test-suite! </br>"
      env_string = JSON.pretty_generate(ENV.to_a).gsub!("\n",'</br>')
      output += "Environment: </br> #{env_string} </br>"
      output
    end

  end
end
