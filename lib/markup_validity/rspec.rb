module Spec
  module Matchers
    ###
    # Assert that something is XHTML transitional
    def be_xhtml_transitional
      Matcher.new :be_xhtml_transitional do
        validator = nil
        match do |xhtml|
          validator = MarkupValidity::Validator.new xhtml
          validator.valid?
        end

        failure_message_for_should do |actual|
          validator.inspect
        end
      end
    end
    alias :be_xhtml :be_xhtml_transitional

    ###
    # Assert that something is XHTML strict
    def be_xhtml_strict
      Matcher.new :be_xhtml_strict do
        validator = nil
        match do |xhtml|
          validator = MarkupValidity::Validator.new(
            xhtml,
            MarkupValidity::Validator::XHTML1_STRICT
          )
          validator.valid?
        end

        failure_message_for_should do |actual|
          validator.inspect
        end
      end
    end

    ###
    # Assert that something is XHTML+RDFa
    def be_xhtml_rdfa
      Matcher.new :be_xhtml_rdfa do
        validator = nil
        match do |xhtml|
          validator = MarkupValidity::Validator.new(
            xhtml,
            MarkupValidity::Validator::XHTML1_RDFA
          )
          validator.valid?
        end

        failure_message_for_should do |actual|
          validator.inspect
        end
      end
    end

    ###
    # Assert that something validates given +schema+
    def be_valid_with_schema schema
      Matcher.new :be_valid_with_schema, schema do |_schema_|
        validator = nil
        match do |xhtml|
          validator = MarkupValidity::Validator.new(
            xhtml,
            Nokogiri::XML::Schema(_schema_)
          )
          validator.valid?
        end

        failure_message_for_should do |actual|
          validator.inspect
        end
      end
    end
  end
end
