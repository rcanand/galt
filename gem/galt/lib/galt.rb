require 'galt/version'

# Galt: Generic application layout template
module Galt
  def app(app_name)
    @app = App.new(app_name)

    if block_given?
      old_context = nil
      old_context = @context if defined?(@context)
      @context = { type: :app, binding: binding, object: @app }
      yield
      @context = old_context
    end
    @app
  end

  def item(item_name)
    raise 'cannot create an item without parent' if !defined?(@context) ||
                                                    @context.nil? ||
                                                    ![:app, :item].include?(@context[:type])
    @item = Item.new(item_name)
    if @context[:type] == :app
      @context[:object].instance_eval('items') << @item
    else
      @context[:object].instance_eval('children') << @item
    end

    if block_given?
      old_context = @context
      @context = { type: :item, binding: binding, object: @item }
      yield
      @context = old_context
    end
    @item
  end

  def field(field_name)
    raise 'cannot create a field without item' if !defined?(@context) ||
                                                  @context.nil? ||
                                                  @context[:type] != :item
    @field = Field.new(field_name)
    eval('@item.fields', @context[:binding]) << @field
  end

  def method_missing(method_name)
    raise ArgumentError, 'Cannot pass a block to name' if block_given?
    method_name.to_s || super
  end

  def respond_to_missing?(_method_name)
    true
  end

  def Object.const_missing(const_name)
    raise ArgumentError, 'Cannot pass a block to name' if block_given?
    const_name.to_s
  end
end

require 'galt/app'
require 'galt/item'
require 'galt/field'
