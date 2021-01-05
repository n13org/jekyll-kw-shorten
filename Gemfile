source "https://rubygems.org"

# Specify your gem's dependencies in jekyll-KargWare-Shorten.gemspec
gemspec

gem "rake", "~> 13.0"

group :test_legacy do
  gem "minitest", "~> 5.0"
  gem "minitest-debugger"
  gem "minitest-reporters"
  gem "minitest-profile"
  gem 'simplecov', '~> 0.21.1'
end

group :test do
  # gem "cucumber", RUBY_VERSION >= "2.5" ? "~> 5.1.2" : "~> 4.1"
  # gem "httpclient"
  # gem "jekyll_test_plugin"
  # gem "jekyll_test_plugin_malicious"
  # gem "memory_profiler"
  # gem "nokogiri", "~> 1.7"
  gem "rspec"
  gem "rspec-mocks"
  # gem "test-dependency-theme", :path => File.expand_path("test/fixtures/test-dependency-theme", __dir__)
  # gem "test-theme", :path => File.expand_path("test/fixtures/test-theme", __dir__)
  # gem "test-theme-skinny", :path => File.expand_path("test/fixtures/test-theme-skinny", __dir__)
  # gem "test-theme-symlink", :path => File.expand_path("test/fixtures/test-theme-symlink", __dir__)

  # gem "jruby-openssl" if RUBY_ENGINE == "jruby"
end

gem "rubocop", "~> 1.3"
gem "rubocop-minitest", "~> 0.10.1"
gem "rubocop-performance", "~> 1.9"

group :development do
  gem 'debase'
  gem 'ruby-debug-ide'
  # other development gems...
end