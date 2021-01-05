# frozen_string_literal: true

require 'bundler/gem_tasks'

task default: [:test]

def name
  Jekyll::KargWare::Shorten::RUBYGEM_NAME
end

def version
  Jekyll::KargWare::Shorten::VERSION
end

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*_test.rb'
  test.verbose = true
end

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "#{name} #{version}"
  rdoc.options << '--charset' << 'utf-8'
  # rdoc.template = ""
  rdoc.rdoc_files.include(
    'README*',
    'lib/**/*.rb'
  )
end
