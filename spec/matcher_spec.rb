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

      it "is xhtml" do
        Matchers.valid_document.should be_xhtml
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

      it "is xhtml+rdfa" do
        Matchers.valid_document.should be_xhtml_rdfa
      end

      it "is no xhtml+rdfa" do
        Matchers.invalid_document.should_not be_xhtml_rdfa
      end

      XSD = File.read(
        File.expand_path(
          File.join(File.dirname(__FILE__),'..','test','assets','shipment.xsd')
        )
      )
      XML = File.read(
        File.join(File.dirname(__FILE__), '..','test', 'assets', 'order.xml')
      )

      it "is valid given spec" do
        XML.should be_valid_with_schema XSD
      end

      it "is not valid given spec" do
        XML.gsub(/<name>[^<]*<\/name>/, '').should_not be_valid_with_schema XSD
      end
    end
  end
end
