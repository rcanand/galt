require "galt/version"
require "app"

module Galt
  def app(app_name)
    @app = App.new(app_name)
  end

  def method_missing(meth, *args, &blk)
    meth.to_s
  end

  def Object.const_missing(const_name)
    const_name.to_s
  end
end
