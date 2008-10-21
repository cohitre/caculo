Gem::Specification.new do |s|
  s.name = %q{caculo}
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["carlos rodriguez"]
  s.date = %q{2008-10-20}
  s.description = %q{Caculo lets you simulate interaction with a browser via Ruby. It has the option to load a Javascript Library and call Javascript functions on the document. This allows for simple code that takes advantage of exisiting libraries.}
  s.email = ["carlosrr@gmail.com"]
  s.extra_rdoc_files = ["History.txt", "License.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "License.txt", "Manifest.txt", "README.txt", "lib/caculo.rb", "lib/caculo/version.rb", "lib/caculo/firefox.rb", "lib/caculo/internet_explorer.rb", "lib/caculo/javascript.rb", "lib/caculo/jquery.rb", "lib/caculo/safari.rb", "lib/caculo/unit.rb", "test/test_caculo.rb", "test/test_helper.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://caculo.cohitre.com}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{caculo}
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Caculo lets you simulate interaction with a browser via Ruby. It has the option to load a Javascript Library and call Javascript functions on the document. This allows for simple code that takes advantage of exisiting libraries.}
  s.test_files = ["test/test_caculo.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
