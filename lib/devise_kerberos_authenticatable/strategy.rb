require 'devise/strategies/base'

module Devise
  module Strategies
    class KerberosAuthenticatable < Base
      def authenticate!
        if resource = mapping.to.authenticate_with_kerberos(params[scope])
          success!(resource)
        else
          return fail(:invalid)
        end
      end
    end
  end
end

Warden::Strategies.add(:kerberos_authenticatable, Devise::Strategies::KerberosAuthenticatable)
