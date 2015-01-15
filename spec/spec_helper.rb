require 'devise'
require_relative 'support/controller_macros'

RSpec.configure do |config|

  config.after :all do
    ActiveRecord::Base.subclasses.each(&:delete_all)
  end

  config.default_formatter = 'doc'
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end
