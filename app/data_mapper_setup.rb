require 'data_mapper'
require 'dm-postgres-adapter'

require_relative 'models/tag'
require_relative 'models/link'
require_relative 'models/user'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/bookmark_manager_development")
DataMapper.finalize
DataMapper.auto_upgrade!
