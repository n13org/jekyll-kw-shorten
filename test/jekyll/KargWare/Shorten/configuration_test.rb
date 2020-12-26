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

          assert_equal ' K', configuration.shorten_gt3_digit
          assert_equal ' M', configuration.shorten_gt6_digit
          assert_equal ' B', configuration.shorten_gt9_digit
        end

        def test_type_error_in_configuration
          configuration = Jekyll::KargWare::Shorten::Configuration.new('TypeError!')

          assert_equal ' K', configuration.shorten_gt3_digit
          assert_equal ' M', configuration.shorten_gt6_digit
          assert_equal ' B', configuration.shorten_gt9_digit
        end

        def test_configuration_change_gt3
          configuration = Jekyll::KargWare::Shorten::Configuration.new('shorten_gt3_digit' => ' X')

          assert_equal ' X', configuration.shorten_gt3_digit
          assert_equal ' M', configuration.shorten_gt6_digit
          assert_equal ' B', configuration.shorten_gt9_digit
        end

        def test_configuration_change_gt6
          configuration = Jekyll::KargWare::Shorten::Configuration.new('shorten_gt6_digit' => ' X')

          assert_equal ' K', configuration.shorten_gt3_digit
          assert_equal ' X', configuration.shorten_gt6_digit
          assert_equal ' B', configuration.shorten_gt9_digit
        end

        def test_configuration_change_gt9
          configuration = Jekyll::KargWare::Shorten::Configuration.new('shorten_gt9_digit' => ' X')

          assert_equal ' K', configuration.shorten_gt3_digit
          assert_equal ' M', configuration.shorten_gt6_digit
          assert_equal ' X', configuration.shorten_gt9_digit
        end

        def test_configuration_change_all
          configuration = Jekyll::KargWare::Shorten::Configuration.new('shorten_gt3_digit' => ' x', 'shorten_gt6_digit' => ' XX', 'shorten_gt9_digit' => ' xXx')

          assert_equal ' x', configuration.shorten_gt3_digit
          assert_equal ' XX', configuration.shorten_gt6_digit
          assert_equal ' xXx', configuration.shorten_gt9_digit
        end
      end
    end
  end
end
