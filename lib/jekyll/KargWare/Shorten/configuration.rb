# frozen_string_literal: true

module Jekyll
  module KargWare
    module Shorten
      # Shorten configuration class
      class Configuration
        attr_accessor :my_integer, :my_float, :my_boolean, :my_string

        DEFAULT_CONFIG = {
          'my_integer' => 1,
          'my_float' => 2.4,
          'my_boolean' => true,
          'my_string' => 'foo bar'
        }.freeze

        def initialize(options)
          options = generate_option_hash(options)

          @my_integer = options['my_integer']
          @my_float = options['my_float']
          @my_boolean = options['my_boolean']
          @my_string = options['my_string']
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
