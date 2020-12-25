# frozen_string_literal: true

require 'test_helper'
require 'jekyll/KargWare/Shorten/configuration'

module Jekyll
  module KargWare
    module Shorten
      # Test the Shorten configuration
      class ConfigurationTest < Minitest::Test
        def test_default_configuration
          configuration = Jekyll::KargWare::Shorten::Configuration.new({})

          assert_equal 1, configuration.my_integer
          assert_equal 2.4, configuration.my_float
          assert_equal true, configuration.my_boolean
          assert_equal 'foo bar', configuration.my_string
        end

        def test_type_error_in_configuration
          configuration = Jekyll::KargWare::Shorten::Configuration.new('TypeError!')

          assert_equal 1, configuration.my_integer
          assert_equal 2.4, configuration.my_float
          assert_equal true, configuration.my_boolean
          assert_equal 'foo bar', configuration.my_string
        end

        def test_configuration_change_integer
          configuration = Jekyll::KargWare::Shorten::Configuration.new('my_integer' => 5)

          assert_equal 5, configuration.my_integer
          assert_equal 2.4, configuration.my_float
          assert_equal true, configuration.my_boolean
          assert_equal 'foo bar', configuration.my_string
        end

        def test_configuration_change_float
          configuration = Jekyll::KargWare::Shorten::Configuration.new({ 'my_float' => 6.66 })

          assert_equal 1, configuration.my_integer
          assert_equal 6.66, configuration.my_float
          assert_equal true, configuration.my_boolean
          assert_equal 'foo bar', configuration.my_string
        end

        def test_configuration_change_boolean
          configuration = Jekyll::KargWare::Shorten::Configuration.new({ 'my_boolean' => false })

          assert_equal 1, configuration.my_integer
          assert_equal 2.4, configuration.my_float
          assert_equal false, configuration.my_boolean
          assert_equal 'foo bar', configuration.my_string
        end

        def test_configuration_change_string
          configuration = Jekyll::KargWare::Shorten::Configuration.new({ 'my_string' => 'bar foo' })

          assert_equal 1, configuration.my_integer
          assert_equal 2.4, configuration.my_float
          assert_equal true, configuration.my_boolean
          assert_equal 'bar foo', configuration.my_string
        end

        def test_configuration_change_all
          configuration = Jekyll::KargWare::Shorten::Configuration.new({ 'my_integer' => 42, 'my_float' => 1.23, 'my_boolean' => false, 'my_string' => 'testing ...' })

          assert_equal 42, configuration.my_integer
          assert_equal 1.23, configuration.my_float
          assert_equal false, configuration.my_boolean
          assert_equal 'testing ...', configuration.my_string
        end
      end
    end
  end
end
