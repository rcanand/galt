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

  def test_can_create_app_with_item_with_parens_and_curly_braces
    blog = app(Blog) { item Post }

    assert_equal('Blog', blog.name)
    refute_empty(blog.items)
    assert_equal('Post', blog.items.first.name)
  end

  def test_cannot_create_app_with_item_with_curly_braces_without_parens
    assert_raises(ArgumentError) { app Blog { item Post } }
  end

  def test_cannot_create_standalone_item
    assert_raises(RuntimeError) { item Post }
  end

  def test_cannot_create_item_right_after_app
    app Blog
    assert_raises(RuntimeError) { item Post }
  end

  def test_can_create_app_with_item_and_field
    blog = app Blog do
      item Post do
        field Title
      end
    end

    assert_equal('Blog', blog.name)
    refute_empty(blog.items)
    assert_equal('Post', blog.items.first.name)
    refute_empty(blog.items.first.fields)
    assert_equal(:string, blog.items.first.fields.first.type)
    assert_equal('Title', blog.items.first.fields.first.name)
  end

  def test_app_cannot_contain_field
    assert_raises(RuntimeError) do
      app Blog do
        field Title
      end
    end
  end

  def test_app_can_contain_multiple_items
    blog = app Blog do
      item Post
      item Profile
    end

    assert_equal('Blog', blog.name)
    refute_empty(blog.items)
    assert_equal('Post', blog.items[0].name)
    assert_equal('Profile', blog.items[1].name)
  end

  def test_name_is_a_valid_name
    # the need for passing name as a string
    # is due to MiniTest hijacking name as a keyword
    # in other contexts, `app name` should work just fine
    name_app = app('name')
    assert_equal('name', name_app.name)
  end

  def test_item_can_contain_nested_item
    blog_app = app Blog do
      item Post do
        item Comment
      end
    end

    assert_equal('Blog', blog_app.name)
    refute_empty(blog_app.items)
    assert_equal('Post', blog_app.items[0].name)
    assert_equal('Comment', blog_app.items[0].children.first.name)
  end
end
