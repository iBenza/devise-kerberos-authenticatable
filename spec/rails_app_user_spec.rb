require 'spec_helper'
require 'rails_app_helper'

RSpec.describe 'rails_app project' do
  before do
    restore_default_settings!
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
      subject { User.authenticate_with_kerberos(name: 'dog', password: 'bowwow') }
      it { should be_nil }
    end
  end
  describe 'kerberos_create_user option' do
    before { Devise.kerberos_create_user = true }
    context 'when krb auth successes' do
      it 'creates new record' do
        u = User.authenticate_with_kerberos(name: 'dog', password: 'bowwow')
        expect(u.persisted?).to be true
      end
    end

    context 'when krb auth fails' do
      it 'does not create new record' do
        u = User.authenticate_with_kerberos(name: 'dog', password: 'oink')
        expect(u).to be_nil
      end
    end
  end
end
