# frozen_string_literal: true

require 'test_helper'

require 'jekyll'
require 'jekyll-kw-shorten'

module Jekyll
  module KargWare
    module Shorten
      class ShortenTagTest < Minitest::Test
        include Liquid

        def setup
          @stubbed_context  = Struct.new(:registers)
          @stubbed_context_site = Struct.new(:config)
          @stubbed_context_page = Struct.new(:content)
        end

        def test_page_content
          context = @stubbed_context.new(
            page: @stubbed_context_page.new('foo bar')
          )
          assert_equal('foo bar', context.registers[:page].content)
        end

        def test_config_plugin
          context = @stubbed_context.new(
            site: @stubbed_context_site.new(Jekyll::KargWare::Shorten::RUBYGEM_NAME => 'foo')
          )
          assert_equal "foo", context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME]
        end

        def test_config_plugin_hashtable
          @stubbed_context_config = Struct.new(:gt3, :gt6, :gt9)
          config_struct = @stubbed_context_config.new("x", "XX", "xXx")

          context = @stubbed_context.new(
            site: @stubbed_context_site.new(
              "MyConfig" => config_struct
            )
          )
          assert_equal "x", context.registers[:site].config["MyConfig"]["gt3"]
          assert_equal "XX", context.registers[:site].config["MyConfig"]["gt6"]
          assert_equal "xXx", context.registers[:site].config["MyConfig"]["gt9"]
        end

        # def test_config_plugin_array
        #   context = @stubbed_context.new(
        #     site: @stubbed_context_site.new(Jekyll::KargWare::Shorten::RUBYGEM_NAME => [ 'Foo' => 3, 'Bar' => 2 ])
        #   )
        #   assert_equal 3, context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME]
        # end

        def test_config_boolean_nil
          context = @stubbed_context.new(
            site: @stubbed_context_site.new('MyBoolean' => nil)
          )
          assert_nil context.registers[:site].config['MyBoolean']
        end

        def test_config_boolean_true
          context = @stubbed_context.new(
            site: @stubbed_context_site.new('MyBoolean' => true)
          )
          assert_equal true, context.registers[:site].config['MyBoolean']
        end

        def test_config_boolean_false
          context = @stubbed_context.new(
            site: @stubbed_context_site.new('MyBoolean' => false)
          )
          assert_equal false, context.registers[:site].config['MyBoolean']
        end

        def test_shorten_tag_no_config
          context = @stubbed_context.new(
            site: @stubbed_context_site,
            page: @stubbed_context_page
          )
          tag = Jekyll::KargWare::Shorten::ShortenTag.parse(
            'shorten',
            1000,
            Liquid::Tokenizer.new(''),
            Liquid::ParseContext.new
          )
          assert_equal('1.0 K', tag.render(context))
        end

        def test_shorten_tag
          context = @stubbed_context.new(
            site: @stubbed_context_site.new('some-config' => ''),
            page: @stubbed_context_page
          )
          tag = Jekyll::KargWare::Shorten::ShortenTag.parse(
            'shorten',
            1000,
            Liquid::Tokenizer.new(''),
            Liquid::ParseContext.new
          )
          assert_equal('1.0 K', tag.render(context))

          # parser = Jekyll::KargWare::Shorten::Parser.new({})
          # assert_equal('1.0 K', parser.parse(1000))
        end

        def test_shorten_tag_change_shorten_gt3_digit
          context = @stubbed_context.new(
            site: @stubbed_context_site.new(Jekyll::KargWare::Shorten::RUBYGEM_NAME => ''),
            page: @stubbed_context_page
          )
          tag = Jekyll::KargWare::Shorten::ShortenTag.parse(
            'shorten',
            1000,
            Liquid::Tokenizer.new(''),
            Liquid::ParseContext.new
          )
          assert_equal('1.0 K', tag.render(context))

          # parser = Jekyll::KargWare::Shorten::Parser.new({})
          # assert_equal('1.0 K', parser.parse(1000))
        end

        def test_config_MyPlugin_hashtable
          @stubbed_context_config = Struct.new(:shorten_gt3_digit, :shorten_gt6_digit, :shorten_gt9_digit)
          config_struct = @stubbed_context_config.new(" A", " B", " C")

          context = @stubbed_context.new(
            site: @stubbed_context_site.new(
              Jekyll::KargWare::Shorten::RUBYGEM_NAME => config_struct
            )
          )
          assert_equal " A", context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME]["shorten_gt3_digit"]
          assert_equal " B", context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME]["shorten_gt6_digit"]
          assert_equal " C", context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME]["shorten_gt9_digit"]

          tag = Jekyll::KargWare::Shorten::ShortenTag.parse(
            'shorten',
            1000,
            Liquid::Tokenizer.new(''),
            Liquid::ParseContext.new
          )
          assert_equal('1.0 K', tag.render(context))
        end

      end
    end
  end
end