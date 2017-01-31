module Galt
  # A Galt item
  class Field
    attr_accessor :name, :type
    def initialize(field_name)
      @name = field_name
      @type = :string
    end
  end
end
