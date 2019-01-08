require './lib/message'
require './lib/tag'
require './lib/tagging'

DataMapper.setup(:default, "postgres://localhost/app_#{ENV["RACK_ENV"]}")

DataMapper.finalize
