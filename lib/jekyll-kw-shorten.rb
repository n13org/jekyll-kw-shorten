# frozen_string_literal: true

require 'jekyll/KargWare/Shorten/parser'
require 'jekyll/KargWare/Shorten/version'

module Jekyll
  module KargWare
    # jekyll-kw-shorten jekyll (tag and filter) class
    module Shorten
      class Error < StandardError; end
      class Exception < Gem::Exception; end

      module_function def get_plugin_config(context)
        if defined? context.registers[:site].config
          context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME] || {}
        else
          {}
        end
      end

      # shorten tag {% shorten input %} for Jekyll
      class ShortenTag < Liquid::Tag
        def initialize(tag_name, input, tokens)
          super
          @input = input.to_s.strip
        end

        def render(context)
          parser = Jekyll::KargWare::Shorten::Parser.new(
            Jekyll::KargWare::Shorten.get_plugin_config(context)
          )
          parser.parse(@input)
        end
      end

      # shorten filter {{ number | shorten }} for Jekyll
      module ShortenFilter
        def shorten(number)
          parser = Jekyll::KargWare::Shorten::Parser.new(
            Jekyll::KargWare::Shorten.get_plugin_config(@context)
          )
          parser.parse(number)
        end
      end
    end
  end
end

Liquid::Template.register_tag('shorten', Jekyll::KargWare::Shorten::ShortenTag)
Liquid::Template.register_filter(Jekyll::KargWare::Shorten::ShortenFilter)
