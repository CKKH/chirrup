require './lib/message'

DataMapper.setup(:default, "postgres://localhost/app_#{ENV["RACK_ENV"]}")

DataMapper.finalize

DataMapper.auto_migrate!
