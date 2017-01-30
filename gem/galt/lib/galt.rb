require "galt/version"
require "app"

module Galt
  def app(app_name)
    @app = App.new(app_name)
  end

  def method_missing(meth, *args, &blk)
    meth.to_s
  end
end
