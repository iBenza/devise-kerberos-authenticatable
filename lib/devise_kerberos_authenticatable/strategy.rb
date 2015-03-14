require 'devise/strategies/base'

module Devise
  module Strategies
    class KerberosAuthenticatable < Authenticatable
      def authenticate!
        if resource = mapping.to.authenticate_with_kerberos(authentication_hash.merge(password: password))
          success!(resource)
        else
          return fail(:invalid)
        end
      end
    end
  end
end

Warden::Strategies.add(:kerberos_authenticatable, Devise::Strategies::KerberosAuthenticatable)
