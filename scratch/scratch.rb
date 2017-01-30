module MyModule
  def foo(param)
    puts param
  end
end

class Object
  def method_missing(meth, *args, &blk)
    meth.to_s
  end

  def self.const_missing(const_name)
    const_name.to_s
  end
end

include MyModule
foo("bar")
foo bar
foo Baz
