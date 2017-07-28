require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User

  include BCrypt
  include DataMapper::Resource

  property :id,    Serial
  property :email, String
  property :password, BCryptHash, :required => true


  validates_format_of :email, :as => :email_address

  end
