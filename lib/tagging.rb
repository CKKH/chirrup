require 'data_mapper'

class Tagging

  include DataMapper::Resource

  belongs_to :message, :key => true
  belongs_to :tag, :key => true

end
