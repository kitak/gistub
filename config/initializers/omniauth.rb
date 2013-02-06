Rails.application.config.middleware.use OmniAuth::Builder do
  config = YAML.load('../facebook_auth.yaml', __FILE__) 
  provider :facebook,
           config[:app_id],
           config[:app_secret],
           {:client_options => {:ssl => {:ca_file => "/System/Library/OpenSSL/ca-bundle.crt"}},
            :scope => ""}
end
