# frozen_string_literal: true

require 'jekyll/KargWare/Shorten/configuration'

module Jekyll
  module KargWare
    module Shorten
      # jekyll-kw-shorten parser class
      class Parser
        # https://stackoverflow.com/questions/33952093/how-to-allow-only-one-dot-in-regex
        DIGITS_AND_SINGLE_DOT_ESCAPE_REGEXP = /(-?\s?[0-9]+(\.[0-9]+)?)/.freeze

        attr_reader :configuration

        def initialize(options = {})
          @configuration = Jekyll::KargWare::Shorten::Configuration.new(options)
        end

        def parse(text)
          return text unless Parser.number?(text)

          # return text unless Parser.only_float_numbers(text) == text

          begin
            # num = text.to_f
            num = Parser.only_float_numbers(text)
            if num >= 1000000000000
              '∞ 🚀'
            elsif num >= 1000000000
              format(num / 1000000000.0) + @configuration.shorten_gt9_digit
            elsif num >= 1000000
              format(num / 1000000.0) + @configuration.shorten_gt6_digit
            elsif num >= 1000
              format(num / 1000.0) + @configuration.shorten_gt3_digit
            else
              num.round(0).truncate(0).to_s.rjust(5)
            end
          rescue StandardError => e
            puts e.message
            text
          end
        end

        # private

        def format(num)
          num.round(1).truncate(1).to_s
        end

        def self.number?(string)
          # true if Float(string)
          true if Float(Parser.only_float_numbers(string))
          # true if Parser.only_float_numbers(string) != string
        rescue StandardError
          false
        end

        def self.only_float_numbers(input)
          input.to_s.scan(DIGITS_AND_SINGLE_DOT_ESCAPE_REGEXP).first.first.to_f
        rescue StandardError
          input
        end
      end
    end
  end
end
