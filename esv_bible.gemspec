Gem::Specification.new do |s|
  s.name = %q{EsvBible}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Geoffrey Dagley"]
  s.date = %q{2008-08-05}
  s.default_executable = %q{esv_bible}
  s.description = %q{FIX (describe your package)}
  s.email = ["gdagley@gmail.com"]
  s.executables = ["esv_bible"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.txt"]
  s.files = ["History.txt", "Manifest.txt", "README.txt", "Rakefile", "bin/esv_bible", "lib/esv_bible.rb", "spec/esv_bible_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{Wrapper for English Standard Version (ESV) Bible Web Service}
  s.rdoc_options = ["--main", "README.txt"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{EsvBible}
  s.rubygems_version = %q{1.2.0}
  s.summary = %q{FIX (describe your package)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if current_version >= 3 then
      s.add_development_dependency(%q<hoe>, [">= 1.7.0"])
    else
      s.add_dependency(%q<hoe>, [">= 1.7.0"])
    end
  else
    s.add_dependency(%q<hoe>, [">= 1.7.0"])
  end
end
