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
          if text.is_a? String then
            return text
          else
            num = text.to_i
            if num >= 1000000000000 then
              return "∞ 🚀"
            elsif num >= 1000000000 then
              return (num / 1000000000.0).truncate(1).to_s + @configuration.shorten_gt9_digit
            elsif num >= 1000000 then
              return (num / 1000000.0).truncate(1).to_s + @configuration.shorten_gt6_digit
            elsif num >= 1000 then
              return (num / 1000.0).truncate(1).to_s + @configuration.shorten_gt3_digit
            else
              return (num).truncate(1).to_s
            end
          end
        end

      end
    end
  end
end
