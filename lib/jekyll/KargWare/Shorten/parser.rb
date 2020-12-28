# frozen_string_literal: true

require 'jekyll/KargWare/Shorten/configuration'

module Jekyll
  module KargWare
    module Shorten
      # jekyll-kw-shorten parser class
      class Parser
        attr_reader :configuration

        def initialize(options = {})
          @configuration = Jekyll::KargWare::Shorten::Configuration.new(options)
        end

        def parse(text)
          if Parser.is_number?(text) then
            num = text.to_f
            if num >= 1000000000000 then
              return "∞ 🚀"
            elsif num >= 1000000000 then
              return format(num / 1000000000.0) + @configuration.shorten_gt9_digit
            elsif num >= 1000000 then
              return format(num / 1000000.0) + @configuration.shorten_gt6_digit
            elsif num >= 1000 then
              return format(num / 1000.0) + @configuration.shorten_gt3_digit
            else
              return num.round(0).truncate(0).to_s.rjust(5)
            end
          else
            return text
          end
        end

        # private

        def format(num)
          num.round(1).truncate(1).to_s
        end

        def self.is_number? string
          true if Float(string) rescue false
        end

      end
    end
  end
end
