Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'  # Allows requests from any origin
      resource '*',  # Allows access to any resource
        headers: :any,  # Allows any headers in the request
        methods: [:get, :post, :put, :patch, :delete, :options, :head],  # Allows these HTTP methods
        expose: ['access-token', 'expiry', 'token-type', 'Authorization']  # Specifies headers to expose
    end
  end
  