# frozen_string_literal: true
require 'chefspec'
require 'chefspec/berkshelf'

RSpec.configure do |config|
  config.file_cache_path = Chef::Config[:file_cache_path]
end
