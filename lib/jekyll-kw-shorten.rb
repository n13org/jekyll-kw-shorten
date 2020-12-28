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

        class << self
          def tag_name
            name.split("::").last.downcase
          end
        end

        def initialize(tag_name, input, tokens)
          super
          @input = input.to_s.strip

          # raise ArgumentError, <<~MSG
          #   Could not use '#{input}' in tag '#{self.class.tag_name}'.
          #   Make sure it is a string or a number.
          # MSG
        end

        def render(context)
          parser = Jekyll::KargWare::Shorten::Parser.new(get_plugin_config(context))
          # parser = Jekyll::KargWare::Shorten::Parser.new({})
          parser.parse(@input)
        end

        private

        def get_plugin_config(context)
          if defined? context.registers[:site].config
            context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME] || {}
          else
            {}
          end
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
          if defined? @context.registers[:site].config
            @context.registers[:site].config[Jekyll::KargWare::Shorten::RUBYGEM_NAME] || {}
          else
            {}
          end
        end
      end

    end
  end
end

Liquid::Template.register_tag('shorten', Jekyll::KargWare::Shorten::ShortenTag)
Liquid::Template.register_filter(Jekyll::KargWare::Shorten::ShortenFilter)