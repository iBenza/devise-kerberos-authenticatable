class User < ActiveRecord::Base
  devise :kerberos_authenticatable, :database_authenticatable,
         :registerable, :rememberable, :trackable
end
