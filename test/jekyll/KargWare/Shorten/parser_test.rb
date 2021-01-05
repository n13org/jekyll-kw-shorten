# frozen_string_literal: true

require 'liquid/utils'

require 'test_helper'
require 'jekyll/KargWare/Shorten/parser'

module Jekyll
  module KargWare
    module Shorten
      class ParserTest < Minitest::Test
        def test_liquid_utils_is_number
          assert_equal 123, Liquid::Utils.to_number('123')
          assert_equal 123.45, Liquid::Utils.to_number('123.45')
          assert_equal 0, Liquid::Utils.to_number('FooBar')
          assert_equal 0, Liquid::Utils.to_number('Foo42Bar')
        end
        def test_is_number_positive
          assert_equal true, Parser.number?(1.23)
          assert_equal true, Parser.number?(123)
          assert_equal true, Parser.number?('123')
          assert_equal true, Parser.number?('123.45')
          assert_equal true, Parser.number?(2 + 4)
          assert_equal true, Parser.number?(123123123123123123123123123)
          assert_equal true, Parser.number?(123762987.45)
        end

        def test_is_number_negative
          assert_equal false, Parser.number?('NoNumber')
          assert_equal false, Parser.number?('FooBar')
        end

        def test_parse_plain_strings
          parser = Jekyll::KargWare::Shorten::Parser.new

          assert_equal 'Hallo', parser.parse('Hallo')
          assert_equal 'Foo Bar', parser.parse('Foo Bar')
          assert_equal 'Foo 42 Bar', parser.parse('Foo 42 Bar')
        end

        def test_parse_number_strings
          parser = Jekyll::KargWare::Shorten::Parser.new

          # assert_equal '0.0', parser.parse('0')
          # assert_equal '0.1', parser.parse('0.1')
          # assert_equal '0.1', parser.parse('0.149')
          # assert_equal '0.2', parser.parse('0.15')
          # assert_equal '0.2', parser.parse('0.151')

          # assert_equal '0.5', parser.parse('0.49')
          # assert_equal '0.5', parser.parse('0.50')
          # assert_equal '0.5', parser.parse('0.51')
          # assert_equal '0.6', parser.parse('0.55')

          assert_equal '    1', parser.parse('1')

          assert_equal '1.0 K', parser.parse('1000')

          assert_equal '1.3 K', parser.parse('1300')
          assert_equal '1.3 K', parser.parse('1301')
          assert_equal '1.3 K', parser.parse('1349')
          assert_equal '1.4 K', parser.parse('1350')
          assert_equal '1.4 K', parser.parse('1351')
          assert_equal '1.4 K', parser.parse('1399')
          assert_equal '1.4 K', parser.parse('1400')

          assert_equal '1.4 M', parser.parse('1400000')
          assert_equal '1.5 M', parser.parse('1450000')
          assert_equal '1.5 M', parser.parse('1500000')
          assert_equal '1.5 M', parser.parse('1549999')
          assert_equal '1.6 M', parser.parse('1550000')
        end

        def test_parse_numbers_0_upto_3_digits
          parser = Jekyll::KargWare::Shorten::Parser.new

          # assert_equal '  0.1', parser.parse(0.1)
          # assert_equal ' 0.22', parser.parse(0.22)
          # assert_equal '0.333', parser.parse(0.333)
          # assert_equal '0.444', parser.parse(0.4444)

          # assert_equal '5.556', parser.parse(5.5555)
          # assert_equal '10.89', parser.parse(10.8888)

          assert_equal '    1', parser.parse(1)
          assert_equal '   15', parser.parse(15)
          assert_equal '  500', parser.parse(500)
          assert_equal '  999', parser.parse(999)

          assert_equal '1.0 K', parser.parse(1000)
          assert_equal '1.5 K', parser.parse(1500)
        end

        def test_default_parser
          parser = Jekyll::KargWare::Shorten::Parser.new

          assert_equal '    1', parser.parse(1)
          # assert_equal '1.234', parser.parse(1.234)
          assert_equal '    1', parser.parse(1.234)
          assert_equal '1.0 K', parser.parse(1000)
          assert_equal '1.0 M', parser.parse(1000000)
          assert_equal '1.0 B', parser.parse(1000000000)
          assert_equal '∞ 🚀', parser.parse(1000000000000)
        end

        def test_parser_config_shorten_gt3_digit
          parser = Jekyll::KargWare::Shorten::Parser.new('shorten_gt3_digit' => 'T')

          assert_equal '    1', parser.parse(1)
          assert_equal '1.0T', parser.parse(1000)
          assert_equal '1.0 M', parser.parse(1000000)
          assert_equal '1.0 B', parser.parse(1000000000)
          assert_equal '∞ 🚀', parser.parse(1000000000000)
        end
      end
    end
  end
end
