require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

  include BCrypt
  include DataMapper::Resource

  property :id,    Serial
  property :email, String, required: true , unique: true
  property :password, BCryptHash, :required => true
end
