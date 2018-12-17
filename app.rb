require 'sinatra/base'

class Chirrup < Sinatra::Base
  enable :sessions

  get '/' do
    @message = session[:message]
    erb :index
  end

  post '/message' do
    session[:message] = params[:message]
    redirect '/'
  end

  # get '/messages' do
  #   @message = session[:message]
  #   erb :messages
  # end



  run! if app_file == $0

end
