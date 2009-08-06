# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{toll_booth}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Dan Pickett"]
  s.date = %q{2009-08-06}
  s.description = %q{API Wrapper for Google Directions}
  s.email = %q{dpickett@enlightsolutions.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "features/get_directions.feature",
     "features/step_definitions/direction_steps.rb",
     "features/step_definitions/location_steps.rb",
     "features/step_definitions/toll_booth_steps.rb",
     "features/support/env.rb",
     "lib/toll_booth.rb",
     "lib/toll_booth/location.rb",
     "lib/toll_booth/route.rb",
     "lib/toll_booth/route_collection.rb",
     "lib/toll_booth/route_step.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/dpickett/toll_booth}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{API Wrapper for Google Directions}
  s.test_files = [
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jnunemaker-httparty>, [">= 0.4.4"])
      s.add_runtime_dependency(%q<hpoydar-chronic_duration>, [">= 0.7.4"])
    else
      s.add_dependency(%q<jnunemaker-httparty>, [">= 0.4.4"])
      s.add_dependency(%q<hpoydar-chronic_duration>, [">= 0.7.4"])
    end
  else
    s.add_dependency(%q<jnunemaker-httparty>, [">= 0.4.4"])
    s.add_dependency(%q<hpoydar-chronic_duration>, [">= 0.7.4"])
  end
end
