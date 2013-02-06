Rails.application.config.middleware.use OmniAuth::Builder do
  config = YAML.load(File.open(File.expand_path('../../facebook_auth.yml', __FILE__))) 
  provider :facebook,
           config[:app_id],
           config[:app_secret],
           {:client_options => {:ssl => {:ca_file => "/System/Library/OpenSSL/ca-bundle.crt"}},
            :scope => ""}
end
