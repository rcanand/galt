# A Galt app
class App
  attr_accessor :name, :items
  def initialize(app_name)
    @name = app_name
    @items = []
  end
end
