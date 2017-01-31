# A Galt app
class Galt::App
  attr_accessor :name, :items
  def initialize(app_name)
    @name = app_name
    @items = []
  end
end
