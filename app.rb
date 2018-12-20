require 'sinatra/base'
require './lib/message'

class Chirrup < Sinatra::Base

  set :sessions, true

  get '/' do
    @messages = Message.all(session)
    erb :index
  end

  post '/message' do
    Message.create(session, params[:content])
    redirect '/'
  end

  run! if app_file == $0

end
