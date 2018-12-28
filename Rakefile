ENV["RACK_ENV"] ||= 'development'
require './config/datamapper'

namespace :db do 
  desc 'run test env migrations'
  task :auto_migrate do
    abort('Wrong env!') if ENV["RACK_ENV"] == 'development'
    puts 'Migration successful' if DataMapper.auto_migrate!
  end

  desc 'run development env update'
  task :auto_upgrade do
    abort('Wrong env!') if ENV["RACK_ENV"] == 'test'
    puts 'Upgrade successful!' if DataMapper.auto_upgrade!
  end

end
