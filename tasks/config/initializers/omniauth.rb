# frozen_string_literal: true

require 'auth_strategy'

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :auth_strategy, ENV["AUTH_KEY"], ENV["AUTH_SECRET"], scope: 'public write'
end
