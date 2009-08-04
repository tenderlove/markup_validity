module MarkupValidity
  class Validator # :nodoc:
    Dir.chdir(File.dirname(__FILE__)) do
      XHTML1_TRANSITIONAL = Nokogiri::XML::Schema(
        File.read('xhtml1-transitional.xsd')
      )
      XHTML1_STRICT = Nokogiri::XML::Schema(File.read('xhtml1-strict.xsd'))
      XHTML1_RDFA = Nokogiri::XML::Schema(File.read('xhtml-rdfa-1.xsd'))
    end

    DTD_REFS = {
      XHTML1_STRICT => [
        'http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd',
        'xhtml1-strict.dtd'
      ],
      XHTML1_TRANSITIONAL => [
        'http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd',
        'xhtml1-transitional.dtd'
      ],
      XHTML1_RDFA => [
        'http://www.w3.org/MarkUp/DTD/xhtml-rdfa-1.dtd',
        'xhtml-rdfa-1.dtd'
      ]
    }

    attr_reader :errors
    def initialize xml, reference = XHTML1_TRANSITIONAL
      if DTD_REFS[reference]
        fixed_dtd = xml.sub(DTD_REFS[reference].first, DTD_REFS[reference][1])
      else
        fixed_dtd = xml
      end

      doc = Dir.chdir(File.dirname(__FILE__)) do
        Nokogiri::XML(fixed_dtd) { |cfg|
          cfg.noent.dtdload.dtdvalid
        }
      end
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
