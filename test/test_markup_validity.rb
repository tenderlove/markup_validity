require "test/unit"
require 'helper'
require "markup_validity"

class TestMarkupValidity < Test::Unit::TestCase
  include MarkupValidity::TestHelper

  class FakeUnit
    include MarkupValidity::Assertions

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

  def test_strict_invalid_entity_error
    assert_xhtml_strict invalid_entity_document
  end

  def test_transitional_invalid_entity_error
    assert_xhtml_transitional invalid_entity_document_transitional
  end

  def test_line_numbers_do_not_roll_over
    validator = MarkupValidity::Validator.new('foo')
    assert !validator.valid?
    assert_no_match(/-1/, validator.inspect)
  end

  def test_line_numbers_do_not_roll_over_line_1
    validator = MarkupValidity::Validator.new("\nfoo")
    assert !validator.valid?
    assert_no_match(/-1/, validator.inspect)
  end

  def test_valid_xhtml_transitional
    @fu.assert_xhtml_transitional valid_document
    assert_equal [true, ''], @fu.assertions.first
    assert_xhtml_transitional valid_document
  end

  def test_valid_xhtml
    @fu.assert_xhtml valid_document
    assert_equal [true, ''], @fu.assertions.first
  end

  def test_valid_xhtml_strict
    @fu.assert_xhtml_strict valid_document
    assert_equal [true, ''], @fu.assertions.first
  end

  def test_valid_xhtml_rdfa
    @fu.assert_xhtml_rdfa valid_document_xhtml_rdfa
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

  def test_invalid_xhtml_rdfa
    @fu.assert_xhtml_rdfa invalid_document
    assert_equal false, @fu.assertions.first.first
    assert_match('Missing child element', @fu.assertions.first.last)
  end

  def test_valid_schema
    xsd = File.join(File.dirname(__FILE__), 'assets', 'shipment.xsd')
    xml = File.join(File.dirname(__FILE__), 'assets', 'order.xml')
    @fu.assert_schema File.read(xsd), File.read(xml)
    assert_equal [true, ''], @fu.assertions.first
  end

  def test_invalid_schema
    xsd = File.join(File.dirname(__FILE__), 'assets', 'shipment.xsd')
    xml = File.read File.join(File.dirname(__FILE__), 'assets', 'order.xml')
    xml.gsub!(/<name>[^<]*<\/name>/, '')
    @fu.assert_schema File.read(xsd), xml
    assert_equal false, @fu.assertions.first.first
    assert_match('This element is not', @fu.assertions.first.last)
  end
end
