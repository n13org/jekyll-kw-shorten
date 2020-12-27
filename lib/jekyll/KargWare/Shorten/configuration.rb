# frozen_string_literal: true

module Jekyll
  module KargWare
    module Shorten
      # Shorten configuration class
      class Configuration
        attr_reader :shorten_gt3_digit, :shorten_gt6_digit, :shorten_gt9_digit

        DEFAULT_CONFIG = {
          'shorten_gt3_digit' => ' K',
          'shorten_gt6_digit' => ' M',
          'shorten_gt9_digit' => ' B'
        }.freeze

        def initialize(options)
          options = generate_option_hash(options)

          @shorten_gt3_digit = options['shorten_gt3_digit']
          @shorten_gt6_digit = options['shorten_gt6_digit']
          @shorten_gt9_digit = options['shorten_gt9_digit']
        end

        private

        def generate_option_hash(options)
          DEFAULT_CONFIG.merge(options)
        rescue TypeError
          DEFAULT_CONFIG
        end
      end
    end
  end
end
