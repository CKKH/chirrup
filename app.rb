require 'sinatra/base'
require './lib/message'

class Chirrup < Sinatra::Base

  enable :sessions

  get '/' do
    session[:messages] ||= []
    @messages = session[:messages]
    erb :index
  end

  post '/message' do
    message = Message.new(params[:message])
    session[:messages] << message
    redirect '/'
  end

  run! if app_file == $0

end
