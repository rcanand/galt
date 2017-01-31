require 'test_helper'
require 'galt'
require 'byebug'

class GaltTest < Minitest::Test
  include Galt

  def test_that_it_has_a_version_number
    refute_nil ::Galt::VERSION
  end

  def test_can_create_empty_app_with_name
    blog_app = app blog
    assert_equal('blog', blog_app.name)
  end

  def test_can_create_empty_app_with_upper_case_name
    blog_app = app Blog
    assert_equal('Blog', blog_app.name)
  end

  def test_can_create_multiple_apps
    app1 = app App1
    app2 = app App2
    assert_equal('App1', app1.name)
    assert_equal('App2', app2.name)
  end

  def test_can_create_app_with_underscore_in_name
    app1 = app app_1
    assert_equal('app_1', app1.name)
  end

  def test_app_must_have_name
    assert_raises(ArgumentError) { app }
  end

  def test_can_use_parens
    blog_app = app(Blog)
    assert_equal('Blog', blog_app.name)
  end

  def test_can_create_app_with_item
    blog = app Blog do
      item Post
    end

    assert_equal('Blog', blog.name)
    refute_empty(blog.items)
    assert_equal('Post', blog.items.first.name)
  end
end
