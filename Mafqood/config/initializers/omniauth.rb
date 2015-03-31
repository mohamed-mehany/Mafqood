OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1571552789759205', '772805ce42aec0343af6f526935fee83'
end
