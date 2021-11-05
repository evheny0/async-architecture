# frozen_string_literal: true

require 'auth_strategy'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :auth_strategy, "YgRJGTWdsWAHoq-m-d1ZesjBeHVRAFD33OOYImklFnE", "2jEYhdJLI58wzpiCwHRsFbabAkYjJtBjbvc9P6iNYUQ", scope: 'public write'
end
