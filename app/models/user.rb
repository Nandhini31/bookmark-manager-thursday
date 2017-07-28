require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'


class User

  include BCrypt
  include DataMapper::Resource

  property :id,    Serial
  property :email, String
    validates_format_of :email, :as => :email_address
  property :password, BCryptHash, :required => true

end
