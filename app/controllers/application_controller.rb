class ApplicationController < ActionController::API

	config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'localhost:3000', /https*:\/\/.*?chompoo500ml.github\.io/
        resource '*', :headers => :any, :methods => :any
      end
    end

end
