require 'sinatra/base'

class Chirrup < Sinatra::Base

  get '/' do
    "Chirrup!"
  end

  run! if app_file == $0

end
