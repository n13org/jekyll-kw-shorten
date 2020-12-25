require_relative 'lib/jekyll/KargWare/Shorten/version'

Gem::Specification.new do |spec|
  spec.name          = Jekyll::KargWare::Shorten::RUBYGEM_NAME
  spec.version       = Jekyll::KargWare::Shorten::VERSION
  spec.authors       = ['Nicolas Karg', 'n13.org - Open-Source by KargWare']
  spec.email         = ["rubygems.org@n13.org"]
  spec.homepage      = "https://notes.n13.org/rubygems"

  spec.summary       = %q{A template project for jekyll plugins.}
  spec.description   = <<-LONGDESCRIPTION
    A template project for jekyll plugins with some additional content
  LONGDESCRIPTION

  spec.metadata      = {
    'homepage_uri'    => spec.homepage,
    'bug_tracker_uri' => 'https://github.com/n13org/jekyll-plugin-template/issues',
    'source_code_uri' => 'https://github.com/n13org/jekyll-plugin-template'
  }

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.add_dependency 'jekyll', '>= 3.8'

  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.files         = Dir[
                         'README.md', 'LICENSE', 'CHANGELOG.md',
                         'lib/**/*.rb'
                       ]
  spec.require_paths = ["lib"]
end
