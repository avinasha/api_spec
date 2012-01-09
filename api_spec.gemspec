# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "api_spec/version"

Gem::Specification.new do |s|
  s.name        = "api_spec"
  s.version     = ApiSpec::VERSION
  s.authors     = ["Avinasha Shastry"]
  s.email       = ["avinasha1987@gmail.com"]
  s.homepage    = "http://gihub.com/avinasha/api-spec"
  s.summary     = %q{Rspec matchers for json API}
  s.description = %q{This gem provides a set of Rspec matchers for testing JSON APIs}

  s.rubyforge_project = "api_spec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"

  s.add_runtime_dependency "rspec"
end
