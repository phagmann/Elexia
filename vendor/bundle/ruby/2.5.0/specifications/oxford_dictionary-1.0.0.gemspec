# -*- encoding: utf-8 -*-
# stub: oxford_dictionary 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "oxford_dictionary".freeze
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["swcraig".freeze]
  s.bindir = "exe".freeze
  s.date = "2017-09-20"
  s.description = "https://developer.oxforddictionaries.com/documentation".freeze
  s.email = ["coverless.info@gmail.com".freeze]
  s.homepage = "https://github.com/swcraig/oxford-dictionary".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "A wrapper for the Oxford Dictionary API".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.13"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_development_dependency(%q<webmock>.freeze, ["~> 2.1.0"])
      s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.45.0"])
      s.add_runtime_dependency(%q<virtus>.freeze, ["~> 1.0.5"])
      s.add_runtime_dependency(%q<plissken>.freeze, ["~> 0.1.0"])
    else
      s.add_dependency(%q<bundler>.freeze, ["~> 1.13"])
      s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
      s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
      s.add_dependency(%q<webmock>.freeze, ["~> 2.1.0"])
      s.add_dependency(%q<rubocop>.freeze, ["~> 0.45.0"])
      s.add_dependency(%q<virtus>.freeze, ["~> 1.0.5"])
      s.add_dependency(%q<plissken>.freeze, ["~> 0.1.0"])
    end
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.13"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<webmock>.freeze, ["~> 2.1.0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.45.0"])
    s.add_dependency(%q<virtus>.freeze, ["~> 1.0.5"])
    s.add_dependency(%q<plissken>.freeze, ["~> 0.1.0"])
  end
end
