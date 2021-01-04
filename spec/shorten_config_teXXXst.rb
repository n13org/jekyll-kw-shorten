class TestConfiguration < JekyllUnitTest
  context '#validate' do
    setup do
      @config = Configuration[{
        'auto' => true,
        'watch' => true,
        'server' => true,
        'pygments' => true,
        'layouts' => true,
        'data_source' => true,
        'gems' => []
      }]
    end

    should 'raise an error if `exclude` key is a string' do
      config = Configuration[{ 'exclude' => 'READ-ME.md, Gemfile,CONTRIBUTING.hello.markdown' }]
      assert_raises(Jekyll::Errors::InvalidConfigurationError) { config.validate }
    end

    should 'raise an error if `include` key is a string' do
      config = Configuration[{ 'include' => 'STOP_THE_PRESSES.txt,.heloses, .git' }]
      assert_raises(Jekyll::Errors::InvalidConfigurationError) { config.validate }
    end

    should 'raise an error if `plugins` key is a string' do
      config = Configuration[{ 'plugins' => '_plugin' }]
      assert_raises(Jekyll::Errors::InvalidConfigurationError) { config.validate }
    end

    should 'not rename configuration keys' do
      assert @config.key?('layouts')
      assert @config.validate.key?('layouts')
      refute @config.validate.key?('layouts_dir')

      assert @config.key?('data_source')
      assert @config.validate.key?('data_source')
      refute @config.validate.key?('data_dir')

      assert @config.key?('gems')
      assert @config.validate.key?('gems')
      refute @config.validate.key?('plugins')
    end
  end
end
