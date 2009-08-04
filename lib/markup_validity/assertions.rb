module MarkupValidity
  module Assertions
    ###
    # Assert that +xhtml+ is valid XHTML Transitional
    def assert_xhtml_transitional xhtml
      validator = Validator.new xhtml
      assert validator.valid?, validator.inspect
    end
    alias :assert_xhtml :assert_xhtml_transitional

    ###
    # Assert that +xhtml+ is valid XHTML Strict
    def assert_xhtml_strict xhtml
      validator = Validator.new xhtml, Validator::XHTML1_STRICT
      assert validator.valid?, validator.inspect
    end

    ###
    # Assert that +xhtml+ is valid XHTML+RDFa
    def assert_xhtml_rdfa xhtml
      validator = Validator.new xhtml, Validator::XHTML1_RDFA
      assert validator.valid?, validator.inspect
    end

    ###
    # Assert that +xml+ conforms to +schema+
    def assert_schema schema, xml
      validator = Validator.new xml, Nokogiri::XML::Schema(schema)
      assert validator.valid?, validator.inspect
    end
  end
end
