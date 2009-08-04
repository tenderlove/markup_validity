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

    # snippets taken from http://www.w3.org/TR/rdfa-syntax/
    def valid_document_xhtml_rdfa
      <<-eoxhtml
   <html
    xmlns="http://www.w3.org/1999/xhtml"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:cal="http://www.w3.org/2002/12/cal/ical#"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema"
    >
    <head>
        <title>My home-page</title>
        <meta property="dc:creator" content="Mark Birbeck" />
        <link rel="foaf:topic" href="http://www.formsPlayer.com/#us" />
    </head>
    <body>
        <div>
            <p>
                I'm holding
                <span property="cal:summary">
                    one last summer Barbecue
                </span>,
                on
                <span property="cal:dtstart" content="2007-09-16T16:00:00-05:00"
                      datatype="xsd:dateTime">
                    September 16th at 4pm
                </span>.
            </p>

            <a xmlns:cc="http://creativecommons.org/ns#"
               rel="cc:license"
               href="http://creativecommons.org/licenses/by-nc-nd/3.0/">
                Creative Commons License
            </a>.
        </div>
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
