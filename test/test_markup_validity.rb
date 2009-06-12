require "test/unit"
require 'helper'
require "markup_validity"

class TestMarkupValidity < Test::Unit::TestCase
  include MarkupValidity::TestHelper

  class FakeUnit
    include MarkupValidity

    attr_reader :assertions

    def initialize
      @assertions = []
    end

    def assert *args
      @assertions << args
    end
  end

  def setup
    @fu = FakeUnit.new
  end

  def test_valid_xhtml_transitional
    @fu.assert_xhtml_transitional valid_document
    assert_equal [true, ''], @fu.assertions.first
  end

  def test_valid_xhtml
    @fu.assert_xhtml valid_document
    assert_equal [true, ''], @fu.assertions.first
  end

  def test_valid_xhtml_strict
    @fu.assert_xhtml_strict valid_document
    assert_equal [true, ''], @fu.assertions.first
  end

  def test_invalid_xhtml
    @fu.assert_xhtml_transitional invalid_document
    assert_equal false, @fu.assertions.first.first
    assert_match('Missing child element', @fu.assertions.first.last)
  end

  def test_invalid_xhtml_strict
    @fu.assert_xhtml_strict invalid_document
    assert_equal false, @fu.assertions.first.first
    assert_match('Missing child element', @fu.assertions.first.last)
  end
end
