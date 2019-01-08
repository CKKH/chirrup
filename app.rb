ENV["RACK_ENV"] ||= 'development'

require 'sinatra/base'
require './config/datamapper'
require 'pry'

class Chirrup < Sinatra::Base

  set :sessions, true
  set :method_override, true

  get '/' do
    @messages = Message.all
    @tags = Tag.all
    erb :index
  end

  post '/message' do
    message = Message.create(content: params[:content])
    tag = Tag.first_or_create(content: params[:tag])
    message.tags << tag
    message.save
    redirect '/'
  end

  get '/message/:id' do
    @message = Message.get(params[:id])
    erb :show
  end

  get '/edit-message/:id' do
    @message = Message.get(params[:id])
    erb :edit
  end

  put '/message/edit/:id' do
    message = Message.get(params[:id])
    message.update(:content => params[:message])
    redirect '/'
  end

  delete '/message/delete/:id' do
    message = Message.get(params[:id])
    message.destroy
    redirect '/'
  end

  run! if app_file == 0

end
