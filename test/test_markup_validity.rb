require "test/unit"
require "markup_validity"

class TestMarkupValidity < Test::Unit::TestCase
  class FakeUnit
    include MarkupValidity

    attr_reader :assertions

    def initialize
      @assertions = []
    end

    def assert_equal *args
      @assertions << args
    end
  end

  def test_valid_xhtml
    fu = FakeUnit.new
    fu.assert_xhtml_transitional <<-eoxhtml
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>hello world</title>
  </head>
  <body>
  </body>
</html>
    eoxhtml

    assert_equal [0, 0, ''], fu.assertions.first
  end

  def test_invalid_xhtml
    fu = FakeUnit.new
    fu.assert_xhtml_transitional <<-eoxhtml
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  </head>
  <body>
  </body>
</html>
    eoxhtml

    assert_equal [0, 1], fu.assertions.first[0..1]
    assert_match('Missing child element', fu.assertions.first.last)
  end
end
