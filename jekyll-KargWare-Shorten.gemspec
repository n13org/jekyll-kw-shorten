require_relative 'lib/jekyll/KargWare/Shorten/version'

Gem::Specification.new do |spec|
  spec.name          = Jekyll::KargWare::Shorten::RUBYGEM_NAME
  spec.version       = Jekyll::KargWare::Shorten::VERSION
  spec.authors       = ['Nicolas Karg', 'n13.org - Open-Source by KargWare']
  spec.email         = ["rubygems.org@n13.org"]
  spec.homepage      = "https://n13.org/rubygems"

  spec.summary       = %q{A jekyll plugin to shorten long numbers}
  spec.description   = <<-LONGDESCRIPTION
    A jekyll plugin which can shorten long numbers, e.g. 1000 ➜ 1K or 1000000 ➜ 1M.

    It can be used as filter `{{ 1234 | shorten }}` and as tag `{% shorten 1234 %}`, the result will be **1.2 K**
  LONGDESCRIPTION

  spec.metadata      = {
    'homepage_uri'    => spec.homepage,
    'bug_tracker_uri' => 'https://github.com/n13org/jekyll-kw-shorten/issues',
    'source_code_uri' => 'https://github.com/n13org/jekyll-kw-shorten'
  }

  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")
  spec.add_dependency 'jekyll', '>= 3.8'

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.files         = Dir[
                         'README.md', 'LICENSE', 'CHANGELOG.md',
                         'lib/**/*.rb'
                       ]
  spec.require_paths = ["lib"]
end
