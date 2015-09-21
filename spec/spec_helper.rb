RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    puts "Starting up virtual machine..."
    `VAGRANT_CWD=#{File.expand_path('../vagrant', __FILE__)} vagrant up`
  end
end
