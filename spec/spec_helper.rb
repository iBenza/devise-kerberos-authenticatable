ENV['KRB5_CONFIG'] ||= File.expand_path('../vagrant/krb5.conf.local', __FILE__)

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

end

def restore_default_settings!
  $cache ||= {}
  %i(kerberos_realm kerberos_create_user).each do |sym|
    $cache[sym] = ::Devise.send(sym) if $cache[sym].nil?
    ::Devise.send("#{sym}=", $cache[sym])
  end
end
