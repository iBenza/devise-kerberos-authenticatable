require 'devise'

$: << File.expand_path('..', __FILE__)

require 'devise_kerberos_authenticatable/model'
require 'devise_kerberos_authenticatable/strategy'
require 'devise_kerberos_authenticatable/kerberos_adapter'

module Devise
  #Kerberos realm to use
  mattr_accessor :kerberos_realm
  @@kerberos_realm = ""

  mattr_accessor :kerberos_create_user
  @@kerberos_create_user = false
end

Devise.add_module(
  :kerberos_authenticatable,
  :strategy                   => true,
  :model                      => 'devise_kerberos_authenticatable/model',
  :route                      => :session,
  :controller                 => :sessions
)
