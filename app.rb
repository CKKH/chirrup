require 'sinatra/base'
require './lib/message'

class Chirrup < Sinatra::Base
  enable :sessions

  get '/' do
    @message = session[:message]
    erb :index
  end

  post '/message' do
    session[:message] = params[:message]
    p @message = Message.new(session[:message])
    redirect '/'
  end

  run! if app_file == $0

end
