require 'spec_helper'
require 'rails_app_helper'

RSpec.describe 'devise initializer spec' do
  describe 'Default values' do
    describe 'kerberos_realm' do
      subject { Devise.kerberos_realm }
      it { should match 'TG2KRB5.COM' }
    end
  end
end
