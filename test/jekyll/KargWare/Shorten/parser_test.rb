# frozen_string_literal: true

require 'test_helper'
require 'jekyll/KargWare/Shorten/parser'

module Jekyll
  module KargWare
    module Shorten
      class ParserTest < Minitest::Test
        def test_parse_strings
          parser = Jekyll::KargWare::Shorten::Parser.new

          assert_equal 'Hallo', parser.shorten('Hallo')
          assert_equal '1', parser.shorten('1')
          assert_equal '1000', parser.shorten('1000')
        end

        def test_default_parser
          parser = Jekyll::KargWare::Shorten::Parser.new

          assert_equal '1', parser.shorten(1)
          assert_equal '1.0 K', parser.shorten(1000)
          assert_equal '1.0 M', parser.shorten(1000000)
          assert_equal '1.0 B', parser.shorten(1000000000)
          assert_equal '∞ 🚀', parser.shorten(1000000000000)
        end

        def test_parser_config_shorten_gt3_digit
          parser = Jekyll::KargWare::Shorten::Parser.new('shorten_gt3_digit' => 'T')

          assert_equal '1', parser.shorten(1)
          assert_equal '1.0T', parser.shorten(1000)
          assert_equal '1.0 M', parser.shorten(1000000)
          assert_equal '1.0 B', parser.shorten(1000000000)
          assert_equal '∞ 🚀', parser.shorten(1000000000000)
        end
      end
    end
  end
end
