require 'data_mapper'

class Tag

  include DataMapper::Resource

  property :id, Serial
  property :content, Text, :unique => true

  has n, :messages, :through => Resource

end
