# frozen_string_literal: true

require 'jekyll/KargWare/Shorten/parser'

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
          filter = Jekyll::KargWare::Shorten::ShortenFilter.new
          filter.shorten(@input)
        end
      end

      # shorten filter {{ number | shorten }} for Jekyll
      module ShortenFilter
        def shorten(number)
          parser = Jekyll::KargWare::Shorten::Parser.new(get_site_config)
          parser.shorten(number)
        end

        private

        def get_site_config
          @context.registers[:site].config['jekyll-kw-shorten'] || {}
        end
      end

    end
  end
end

Liquid::Template.register_tag('shorten', Jekyll::KargWare::Shorten::ShortenTag)
Liquid::Template.register_filter(Jekyll::KargWare::Shorten::ShortenFilter)