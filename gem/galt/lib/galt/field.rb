module Galt
  # A Galt item
  class Field
    attr_accessor :name, :type
    def initialize(field_name_or_hash)
      if field_name_or_hash.is_a?(String)
        @name = field_name_or_hash
        @type = :string
      elsif field_name_or_hash.is_a?(Hash)
        raise ArgumentError, 'hash must contain exactly one pair' if field_name_or_hash.length != 1
        @type = field_name_or_hash.keys.first
        @name = field_name_or_hash.values.first
      end
    end
  end
end
