# frozen_string_literal: true

require 'jekyll/KargWare/Shorten/parser'
require 'jekyll/KargWare/Shorten/version'

module Jekyll
  module KargWare
    module Shorten
      class Error < StandardError; end
      class Exception < Gem::Exception; end

      # shorten tag {% shorten input %} for Jekyll
      class ShortenTag < Liquid::Tag
        def initialize(tag_name, input, tokens)
          super
          @input = input
        end

        def render(context)
          parser = Jekyll::KargWare::Shorten::Parser.new(get_plugin_config(context))
          parser.parse(@input)
        end

        private

        def get_plugin_config(context)
          context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME] || {}
        end
      end

      # shorten filter {{ number | shorten }} for Jekyll
      module ShortenFilter
        def shorten(number)
          parser = Jekyll::KargWare::Shorten::Parser.new(get_plugin_config)
          parser.parse(number)
        end

        private

        def get_plugin_config
          @context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME] || {}
        end
      end

    end
  end
end

Liquid::Template.register_tag('shorten', Jekyll::KargWare::Shorten::ShortenTag)
Liquid::Template.register_filter(Jekyll::KargWare::Shorten::ShortenFilter)