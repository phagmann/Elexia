# -*- encoding: utf-8 -*-
# stub: yarn 0.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "yarn".freeze
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jesper Kjeldgaard".freeze]
  s.date = "2011-10-12"
  s.description = "A multi-process web-server written in Ruby 1.9.".freeze
  s.email = ["thejspr@gmail.com".freeze]
  s.executables = ["yarn".freeze]
  s.files = ["bin/yarn".freeze]
  s.homepage = "https://github.com/thejspr/yarn".freeze
  s.rubyforge_project = "yarn".freeze
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Multi-process webserver for static, dynamic (*.rb) files and Rack applications.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<parslet>.freeze, [">= 1.2"])
      s.add_runtime_dependency(%q<trollop>.freeze, [">= 1.16"])
      s.add_runtime_dependency(%q<rack>.freeze, [">= 1.3"])
      s.add_development_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_development_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_development_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_development_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_development_dependency(%q<simplecov>.freeze, [">= 0"])
    else
      s.add_dependency(%q<parslet>.freeze, [">= 1.2"])
      s.add_dependency(%q<trollop>.freeze, [">= 1.16"])
      s.add_dependency(%q<rack>.freeze, [">= 1.3"])
      s.add_dependency(%q<cucumber>.freeze, [">= 0"])
      s.add_dependency(%q<faraday>.freeze, [">= 0"])
      s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
      s.add_dependency(%q<rspec>.freeze, [">= 0"])
      s.add_dependency(%q<simplecov>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<parslet>.freeze, [">= 1.2"])
    s.add_dependency(%q<trollop>.freeze, [">= 1.16"])
    s.add_dependency(%q<rack>.freeze, [">= 1.3"])
    s.add_dependency(%q<cucumber>.freeze, [">= 0"])
    s.add_dependency(%q<faraday>.freeze, [">= 0"])
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<rspec>.freeze, [">= 0"])
    s.add_dependency(%q<simplecov>.freeze, [">= 0"])
  end
end
