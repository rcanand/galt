require 'galt/version'

# Galt: Generic application layout template
module Galt
  def app(app_name)
    @app = App.new(app_name)
    @context = binding
    yield if block_given?
    @context = nil
    @app
  end

  def item(item_name)
    raise 'cannot create an item without parent' if @context.nil?
    eval('@app.items', @context) << Item.new(item_name)
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

require 'galt/app'
require 'galt/item'
