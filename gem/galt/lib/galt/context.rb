module Galt
  class Context
    attr_accessor :context_type, :context_binding, :context_object
    def initialize(ctype, cbinding, cobject)
      @context_type = ctype
      @context_binding = cbinding
      @context_object = cobject
    end
  end
end