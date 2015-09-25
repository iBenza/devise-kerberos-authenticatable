require 'spec_helper'
require 'rails_app_helper'

RSpec.describe 'Kerberos Authentication Server' do
  describe 'abc' do
    it 'passes krb authentication' do
      expect(Krb5Auth::Krb5.new.get_init_creds_password('dog@TG2KRB5.COM', 'bowwow')).to be true
      expect(Krb5Auth::Krb5.new.get_init_creds_password('cat@TG2KRB5.COM', 'mewmew')).to be true
    end

    it 'failed exception' do
      expect{Krb5Auth::Krb5.new.get_init_creds_password('oinkoink@TG2KRB5.COM', 'mewmew')}.to raise_error(Krb5Auth::Krb5::Exception)
    end
  end
end
