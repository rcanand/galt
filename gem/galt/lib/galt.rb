require 'galt/version'
require 'app'
require 'item'

# Galt: Generic application layout template
module Galt
  def app(app_name)
    @app = App.new(app_name)
    yield if block_given?
    @app
  end

  def item(item_name)
    raise RuntimeError, 'cannot create an item without an app' if @app.nil?
    @app.items << Item.new(item_name)
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
