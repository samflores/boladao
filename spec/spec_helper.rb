# frozen_string_literal: true

require 'simplecov'
SimpleCov.start do
  load_profile 'test_frameworks'

  add_filter %r{^/config/}
  add_filter %r{^/db/}

  add_group 'Controllers', 'app/controllers'
  add_group 'Models', 'app/models'
  # add_group 'Helpers', 'app/helpers'
  add_group 'Libraries', 'lib/'
  add_group 'Validators', 'app/validators'

  track_files '{app,lib}/**/*.rb'
end

# See https://rubydoc.info/gems/rspec-core/RSpec/Core/Configuration
RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
