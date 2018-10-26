# -*- encoding: utf-8 -*-
# stub: caracal-rails 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "caracal-rails".freeze
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Trade Informatics".freeze, "John Dugan".freeze]
  s.date = "2015-07-29"
  s.description = " Caracal::Rails takes care of registering Microsoft Word output with Rails. Essentially, this involves registering the mime type, establishing a template handler for .docx formats, and establishing sane defaults for generating professional quality Word documents. ".freeze
  s.email = ["jpdugan@gmail.com".freeze]
  s.homepage = "https://github.com/ibpinc/caracal-rails".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.7.7".freeze
  s.summary = "Caracal::Rails makes using Caracal in Rails a no-brainer.".freeze

  s.installed_by_version = "2.7.7" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<caracal>.freeze, ["~> 1.0"])
      s.add_runtime_dependency(%q<rails>.freeze, [">= 3.2"])
      s.add_development_dependency(%q<appraisal>.freeze, ["~> 1.0"])
      s.add_development_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
    else
      s.add_dependency(%q<caracal>.freeze, ["~> 1.0"])
      s.add_dependency(%q<rails>.freeze, [">= 3.2"])
      s.add_dependency(%q<appraisal>.freeze, ["~> 1.0"])
      s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
      s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
    end
  else
    s.add_dependency(%q<caracal>.freeze, ["~> 1.0"])
    s.add_dependency(%q<rails>.freeze, [">= 3.2"])
    s.add_dependency(%q<appraisal>.freeze, ["~> 1.0"])
    s.add_dependency(%q<bundler>.freeze, ["~> 1.6"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.0"])
  end
end
