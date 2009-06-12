module MarkupValidity
  class Validator # :nodoc:
    Dir.chdir(File.dirname(__FILE__)) do
      XHTML1_TRANSITIONAL = Nokogiri::XML::Schema(
        File.read('xhtml1-transitional.xsd')
      )
      XHTML1_STRICT = Nokogiri::XML::Schema(File.read('xhtml1-strict.xsd'))
    end

    attr_reader :errors
    def initialize xml, reference = XHTML1_TRANSITIONAL
      doc         = Nokogiri::XML xml
      @reference  = reference
      @xml        = xml
      @errors     = reference.validate(doc)
    end

    def valid?; @errors.length == 0; end

    def inspect
      lines = @xml.split("\n")
      strings = []
      errors.each do |error|

        start = error.line - [2, error.line].min

        error_line = error.line == 0 ? 1 : error.line

        strings << "Error on line: #{error_line}:"
        strings << error.message.gsub(/\{[^\}]*\}/, '')
        Range.new(start, error.line + 2).each { |number|
          strings << "#{number + 1}: #{lines[number]}"
        }
        strings << ""
      end
      strings.join("\n")
    end
  end
end
