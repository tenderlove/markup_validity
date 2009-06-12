require 'nokogiri'

module MarkupValidity
  VERSION = '1.0.0'

  Dir.chdir(File.dirname(__FILE__)) do
    XHTML1_TRANSITIONAL = Nokogiri::XML::Schema(
      File.read('xhtml1-transitional.xsd')
    )
  end

  def assert_xhtml_transitional xhtml
    lines = xhtml.split("\n")
    doc  = Nokogiri::XML xhtml

    errors = XHTML1_TRANSITIONAL.validate(doc)

    strings = []
    errors.each do |error|
      strings << "Error on line: #{error.line - 1}:"
      strings << error.message.gsub(/\{[^\}]*\}/, '')
      Range.new(error.line - 2, error.line + 2).each { |number|
        strings << "#{number}: #{lines[number]}"
      }
      strings << ""
    end

    assert_equal 0, errors.length, strings.join("\n")
  end
end
