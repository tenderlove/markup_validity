$LOAD_PATH << File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rubygems'
require 'markup_validity'

module Spec
  module Matchers
    describe "[actual.should] be_xhtml_transitional" do
      it "is valid xhtml" do
        xhtml = <<-eoxhtml
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>hello world</title>
  </head>
  <body>
  </body>
</html>
        eoxhtml
        xhtml.should be_xhtml_transitional
      end

      it "is not valid xhtml" do
        xhtml = <<-eoxhtml
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  </head>
  <body>
  </body>
</html>
        eoxhtml
        xhtml.should_not be_xhtml_transitional
      end
    end
  end
end
