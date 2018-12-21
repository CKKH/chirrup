require './lib/message'

DataMapper.setup(:default, "postgres://localhost/app_#{ENV["RACK_ENV"]}")

DataMapper.finalize

ENV["RACK_ENV"] == 'test' ? DataMapper.auto_migrate! : DataMapper.auto_upgrade!
