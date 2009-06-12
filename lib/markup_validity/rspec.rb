module Spec
  module Matchers
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
  end
end
