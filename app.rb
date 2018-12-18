require 'sinatra/base'
require './lib/message'

class Chirrup < Sinatra::Base

  enable :sessions

  get '/' do
    if session[:message] == nil
      @message = Message.new('No messages')
    else
      @message = Message.new(session[:message])
    end
    erb :index
  end

  post '/message' do
    session[:message] = params[:message]
    redirect '/'
  end

  run! if app_file == $0

end
