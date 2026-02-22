# -*- encoding: utf-8 -*-
# stub: vimeo_ruby 0.5.0 ruby lib

Gem::Specification.new do |s|
  s.name = "vimeo_ruby".freeze
  s.version = "0.5.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "changelog_uri" => "https://github.com/cjilbert504/vimeo_ruby/blob/main/CHANGELOG.md", "homepage_uri" => "https://github.com/cjilbert504/vimeo_ruby", "source_code_uri" => "https://github.com/cjilbert504/vimeo_ruby" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Collin Jilbert".freeze]
  s.bindir = "exe".freeze
  s.date = "2022-12-29"
  s.description = "A Ruby gem for interacting with the Vimeo API".freeze
  s.email = ["cjilbert504@gmail.com".freeze]
  s.homepage = "https://github.com/cjilbert504/vimeo_ruby".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.0".freeze)
  s.rubygems_version = "3.4.20".freeze
  s.summary = "A Ruby gem for interacting with the Vimeo API".freeze

  s.installed_by_version = "3.4.20" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_development_dependency(%q<webmock>.freeze, ["~> 3.18", ">= 3.18.1"])
  s.add_development_dependency(%q<vcr>.freeze, ["~> 6.1"])
end
