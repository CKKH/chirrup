ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require './lib/message'
require './config/datamapper'

class Chirrup < Sinatra::Base

  set :sessions, true
  set :method_override, true

  get '/' do
    @messages = Message.all
    erb :index
  end

  post '/message' do
    Message.create(content: params[:content])
    redirect '/'
  end

  get '/messages/:id' do
    @message = Message.get(params[:id])
    erb :show
  end

  get '/edit-message/:id' do
    @message = Message.get(params[:id])
    erb :edit
  end

  put '/message/:id' do
    message = Message.get(params[:id])
    message.update(:content => params[:message])
    redirect '/'
  end

  delete '/message/:id' do
    message = Message.get(params[:id])
    message.destroy
    redirect '/'
  end

  run! if app_file == 0

end
