require 'nokogiri'
require 'markup_validity/validator'
require 'markup_validity/assertions'
require 'markup_validity/rspec'

module MarkupValidity
  VERSION = '1.1.0'
end

if defined? Test::Unit::TestCase
  class Test::Unit::TestCase; include MarkupValidity::Assertions; end
end
