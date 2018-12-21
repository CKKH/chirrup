require 'data_mapper'

class Message
  
  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  def timestamp
    created_at.strftime("%d-%m-%Y %H:%M:%S")
  end

end
