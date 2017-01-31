module Galt
  # A Galt item
  class Item
    attr_accessor :name, :fields
    def initialize(item_name)
      @name = item_name
      @fields = []
    end
  end
end
