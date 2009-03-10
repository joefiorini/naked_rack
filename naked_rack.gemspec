# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{naked_rack}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["faithfulgeek"]
  s.date = %q{2009-03-09}
  s.email = %q{joe@faithfulgeek.org}
  s.extra_rdoc_files = ["README.textile", "LICENSE"]
  s.files = ["README.textile", "VERSION.yml", "lib/naked_rack.rb", "LICENSE"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/faithfulgeek/naked_rack}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Gem to allow you to run your Rack-supported web app naked for CSS Naked Day on April 9th.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
