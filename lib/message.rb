require 'data_mapper'

class Message

  include DataMapper::Resource

  property :id, Serial
  property :content, Text
  property :created_at, DateTime

  has n, :tags, :through => Resource

  def timestamp
    created_at.strftime("%d-%m-%Y %H:%M:%S")
  end

  def twenty_chars
    content[0, 20]
  end

end
