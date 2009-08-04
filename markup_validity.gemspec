(in /home/jason/code/git/markup_validity)
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{markup_validity}
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Aaron Patterson"]
  s.date = %q{2009-08-04}
  s.description = %q{MarkupValidity provides test/unit and rspec helpers for checking the validity of your documents.  Shortcuts for verifying xhtml-transitional and xhtml-strict documents are provided as well.  MarkupValidity will not only tell you when your document is invalid, but it will tell you what it *should* be.}
  s.email = ["aaronp@rubyforge.org"]
  s.extra_rdoc_files = ["Manifest.txt", "README.rdoc", "CHANGELOG.rdoc"]
  s.files = [".autotest", "CHANGELOG.rdoc", "Manifest.txt", "README.rdoc", "Rakefile", "lib/markup_validity.rb", "lib/markup_validity/MarkUp.html", "lib/markup_validity/SCHEMA.html", "lib/markup_validity/assertions.rb", "lib/markup_validity/examples.html", "lib/markup_validity/rspec.rb", "lib/markup_validity/templates.html", "lib/markup_validity/validator.rb", "lib/markup_validity/xframes-1.xsd", "lib/markup_validity/xhtml-access-1.xsd", "lib/markup_validity/xhtml-applet-1.xsd", "lib/markup_validity/xhtml-attribs-1.xsd", "lib/markup_validity/xhtml-base-1.xsd", "lib/markup_validity/xhtml-basic-form-1.xsd", "lib/markup_validity/xhtml-basic-table-1.xsd", "lib/markup_validity/xhtml-basic10-model-1.xsd", "lib/markup_validity/xhtml-basic10-module-redefines-1.xsd", "lib/markup_validity/xhtml-basic10-modules-1.xsd", "lib/markup_validity/xhtml-basic10.xsd", "lib/markup_validity/xhtml-basic11-model-1.xsd", "lib/markup_validity/xhtml-basic11-modules-1.xsd", "lib/markup_validity/xhtml-basic11.xsd", "lib/markup_validity/xhtml-bdo-1.xsd", "lib/markup_validity/xhtml-blkphras-1.xsd", "lib/markup_validity/xhtml-blkpres-1.xsd", "lib/markup_validity/xhtml-blkstruct-1.xsd", "lib/markup_validity/xhtml-charent-1.xsd", "lib/markup_validity/xhtml-copyright-1.xsd", "lib/markup_validity/xhtml-csismap-1.xsd", "lib/markup_validity/xhtml-datatypes-1.xsd", "lib/markup_validity/xhtml-edit-1.xsd", "lib/markup_validity/xhtml-events-1.xsd", "lib/markup_validity/xhtml-form-1.xsd", "lib/markup_validity/xhtml-frames-1.xsd", "lib/markup_validity/xhtml-framework-1.xsd", "lib/markup_validity/xhtml-hypertext-1.xsd", "lib/markup_validity/xhtml-iframe-1.xsd", "lib/markup_validity/xhtml-image-1.xsd", "lib/markup_validity/xhtml-inlphras-1.xsd", "lib/markup_validity/xhtml-inlpres-1.xsd", "lib/markup_validity/xhtml-inlstruct-1.xsd", "lib/markup_validity/xhtml-inlstyle-1.xsd", "lib/markup_validity/xhtml-inputmode-1.xsd", "lib/markup_validity/xhtml-lat1.ent", "lib/markup_validity/xhtml-legacy-1.xsd", "lib/markup_validity/xhtml-link-1.xsd", "lib/markup_validity/xhtml-list-1.xsd", "lib/markup_validity/xhtml-meta-1.xsd", "lib/markup_validity/xhtml-metaAttributes-1.xsd", "lib/markup_validity/xhtml-misc-1.xsd", "lib/markup_validity/xhtml-nameident-1.xsd", "lib/markup_validity/xhtml-notations-1.xsd", "lib/markup_validity/xhtml-object-1.xsd", "lib/markup_validity/xhtml-param-1.xsd", "lib/markup_validity/xhtml-pres-1.xsd", "lib/markup_validity/xhtml-print-1.xsd", "lib/markup_validity/xhtml-print-model-1.xsd", "lib/markup_validity/xhtml-print-modules-1.xsd", "lib/markup_validity/xhtml-rdfa-1.dtd", "lib/markup_validity/xhtml-rdfa-1.xsd", "lib/markup_validity/xhtml-rdfa-model-1.xsd", "lib/markup_validity/xhtml-rdfa-modules-1.xsd", "lib/markup_validity/xhtml-ruby-1.xsd", "lib/markup_validity/xhtml-ruby-basic-1.xsd", "lib/markup_validity/xhtml-script-1.xsd", "lib/markup_validity/xhtml-special.ent", "lib/markup_validity/xhtml-ssismap-1.xsd", "lib/markup_validity/xhtml-struct-1.xsd", "lib/markup_validity/xhtml-style-1.xsd", "lib/markup_validity/xhtml-symbol.ent", "lib/markup_validity/xhtml-table-1.xsd", "lib/markup_validity/xhtml-target-1.xsd", "lib/markup_validity/xhtml-text-1.xsd", "lib/markup_validity/xhtml1-strict.dtd", "lib/markup_validity/xhtml1-strict.xsd", "lib/markup_validity/xhtml1-transitional.dtd", "lib/markup_validity/xhtml1-transitional.xsd", "lib/markup_validity/xhtml11-model-1.xsd", "lib/markup_validity/xhtml11-module-redefines-1.xsd", "lib/markup_validity/xhtml11-modules-1.xsd", "lib/markup_validity/xhtml11.xsd", "lib/markup_validity/xhtml2.xsd", "lib/markup_validity/xml-events-1.xsd", "lib/markup_validity/xml-events-2.xsd", "lib/markup_validity/xml-events-attribs-1.xsd", "lib/markup_validity/xml-events-attribs-2.xsd", "lib/markup_validity/xml-events-copyright-1.xsd", "lib/markup_validity/xml-events-copyright-2.xsd", "lib/markup_validity/xml-handlers-1.xsd", "lib/markup_validity/xml-handlers-2.xsd", "lib/markup_validity/xml-script-1.xsd", "lib/markup_validity/xml.xsd", "spec/matcher_spec.rb", "test/assets/invalid_entity.xhtml", "test/assets/invalid_entity_transitional.xhtml", "test/assets/order.xml", "test/assets/shipment.xsd", "test/helper.rb", "test/test_markup_validity.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/tenderlove/markup_validity}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{seattlerb}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{MarkupValidity provides test/unit and rspec helpers for checking the validity of your documents}
  s.test_files = ["test/test_markup_validity.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.3.1"])
      s.add_development_dependency(%q<hoe>, [">= 1.12.2"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.3.1"])
      s.add_dependency(%q<hoe>, [">= 1.12.2"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.3.1"])
    s.add_dependency(%q<hoe>, [">= 1.12.2"])
  end
end
