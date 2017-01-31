module Galt
  # A Galt item
  class Item
    attr_accessor :name, :fields, :children
    def initialize(item_name)
      @name = item_name
      @fields = []
      @children = []
    end
  end
end
