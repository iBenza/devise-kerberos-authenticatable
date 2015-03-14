require 'devise_kerberos_authenticatable/strategy'

module Devise
  module Models
    module KerberosAuthenticatable
      extend ActiveSupport::Concern

      included do
        attr_accessor :password
      end

      def login_with
        @login_with ||= Devise.mappings.find {|k,v| v.class_name == self.class.name}.last.to.authentication_keys.first
        self[@login_with]
      end

      def valid_kerberos_authentication?(password)
        Devise::KerberosAdapter.valid_credentials?(login_with, password)
      end

      module ClassMethods
        def authenticate_with_kerberos(attributes = {})
          auth_key = self.authentication_keys.first
          return nil unless attributes[auth_key].present?

          auth_key_value = (self.case_insensitive_keys || []).include?(auth_key) ? attributes[auth_key].downcase : attributes[auth_key]
          auth_key_value = (self.strip_whitespace_keys || []).include?(auth_key) ? auth_key_value.strip : auth_key_value

          resource = where(auth_key => auth_key_value).first

          if resource.blank?
            resource = new
            resource[auth_key] = auth_key_value
          end

          if resource.try(:valid_kerberos_authentication?, attributes[:password])
            resource.save if resource.new_record?
            return resource
          else
            return nil
          end
        end
      end
    end
  end
end
