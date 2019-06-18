# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!
ENV['RAILS_ENV'] ||= 'production'
# ENV['RAILS_MASTER_KEY'] = '08dfb841edccfb39e436d214005f40f0'