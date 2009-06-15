module MarkupValidity
  module TestHelper
    def valid_document
      <<-eoxhtml
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
    <title>hello world</title>
  </head>
  <body>
  </body>
</html>
      eoxhtml
    end

    def invalid_document
      <<-eoxhtml
<html xmlns="http://www.w3.org/1999/xhtml">
  <head>
  </head>
  <body>
    <p>
      <p>
        Hello
      </p>
    </p>
  </body>
</html>
      eoxhtml
    end

    def invalid_entity_document
      File.read(File.join(File.dirname(__FILE__), 'assets', 'invalid_entity.xhtml'))
    end

    def invalid_entity_document_transitional
      File.read(File.join(File.dirname(__FILE__), 'assets', 'invalid_entity_transitional.xhtml'))
    end
  end
end
