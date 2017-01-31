# A Galt item
class Galt::Item
  attr_accessor :name, :items
  def initialize(item_name)
    @name = item_name
  end
end