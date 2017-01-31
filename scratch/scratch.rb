# module MyModule
#   def foo(param)
#     puts param
#   end
# end

# class Object
#   def method_missing(meth, *args, &blk)
#     meth.to_s
#   end

#   def self.const_missing(const_name)
#     const_name.to_s
#   end
# end

# include MyModule
# foo("bar")
# foo bar
# foo Baz

# class Thing
#   def initialize &blk
#     yield
#   end
# end

# Thing.new do 
#   puts "In block"
# end

class App
  attr_accessor :name, :items
  def initialize(app_name)
    @name = app_name
    @items = []
  end
end

class Item
  attr_accessor :name, :items
  def initialize(item_name)
    @name = item_name
  end
end

module MyModule
  def app(name)
    @app = App.new(name)
    yield if block_given? 
  end

  def item(name)
    puts @app.name
  end

  def method_missing(method_name, *_args, &_blk)
    method_name.to_s || super
  end

  def respond_to_missing?(_method_name)
    true
  end

  def Object.const_missing(const_name)
    const_name.to_s
  end
end

include MyModule

app Blog


