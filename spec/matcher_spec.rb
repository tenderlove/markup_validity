require 'rubygems'
require 'markup_validity'
require 'test/helper'

module Spec
  module Matchers
    extend MarkupValidity::TestHelper
    describe "[actual.should] be_xhtml_transitional" do
      it "is transitional xhtml" do
        Matchers.valid_document.should be_xhtml_transitional
      end

      it "is strict xhtml" do
        Matchers.valid_document.should be_xhtml_strict
      end

      it "is not transitional xhtml" do
        Matchers.invalid_document.should_not be_xhtml_transitional
      end

      it "is not strict xhtml" do
        Matchers.invalid_document.should_not be_xhtml_strict
      end
    end
  end
end
