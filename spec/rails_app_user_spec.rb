require 'spec_helper'
require 'rails_app_helper'

RSpec.describe 'rails_app project' do
  before do
    ::Devise.kerberos_realm = 'TG2KRB5.COM'
  end

  context 'when user does not exist in principals' do
    describe 'User is in database' do
      before { User.create(name: 'pig') }
      subject { User.authenticate_with_kerberos(name: 'pig', password: 'oink') }
      it { should be_nil }
    end
  end

  context 'when user exists in in principals' do
    describe 'User is in database' do
      before { User.create(name: 'dog') }
      subject { User.authenticate_with_kerberos(name: 'dog', password: 'bowwow') }
      it { should be_truthy }
    end

    describe 'User is not in database' do
      before { User.create(name: 'pig') }
      subject { User.authenticate_with_kerberos(name: 'pig', password: 'oink') }
      it { should be_nil }
    end
  end
end
