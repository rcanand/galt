require 'test_helper'
require 'galt'

class GaltTest < Minitest::Test
  include Galt
  def test_that_it_has_a_version_number
    refute_nil ::Galt::VERSION
  end

  def test_can_create_empty_app_with_name
    blog_app = app blog
    assert_equal("blog", blog_app.name)
  end
end
