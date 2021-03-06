# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{blobber}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brian Smith"]
  s.date = %q{2009-03-26}
  s.email = %q{bsmith@swig505.com}
  s.extra_rdoc_files = ["README.md", "LICENSE"]
  s.files = ["README.md", "VERSION.yml", "lib/blobber", "lib/blobber/resource.rb", "lib/blobber/utils.rb", "lib/blobber.rb", "test/benchmark", "test/benchmark/resource.rb", "test/integration", "test/test_helper.rb", "test/unit", "test/unit/resource_test.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/Lytol/blobber}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{An abstraction layer for CRUDing objects to any key/value storage supporting the memcached protocol (memcachedb, Tokyo Tyrant, etc)}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<json>, [">= 1.1.3"])
      s.add_runtime_dependency(%q<uuidtools>, [">= 1.0.7"])
    else
      s.add_dependency(%q<json>, [">= 1.1.3"])
      s.add_dependency(%q<uuidtools>, [">= 1.0.7"])
    end
  else
    s.add_dependency(%q<json>, [">= 1.1.3"])
    s.add_dependency(%q<uuidtools>, [">= 1.0.7"])
  end
end
