# frozen_string_literal: true

require 'test_helper'

require 'jekyll'
require 'jekyll-kw-shorten'

module Jekyll
  module KargWare
    module Shorten
      class ShortenFilterTest < Minitest::Test
        include Jekyll::KargWare::Shorten::ShortenFilter

        def test_default_filter
          @context = get_context

          assert_equal "FooBar", shorten("FooBar")

          assert_equal "    1", shorten(1)
          assert_equal "1.0 K", shorten(1000)
          assert_equal "1.0 M", shorten(1000000)
          assert_equal "1.0 B", shorten(1000000000)
        end

        private

        def get_context
          Struct.new(:registers).new(
            site: Struct.new(:config).new(
              {Jekyll::KargWare::Shorten::RUBYGEM_NAME => Array({
                :shorten_gt3_digit => "a",
                :shorten_gt6_digit => "b",
                :shorten_gt9_digit => "c",
              })}
            )
          )

          # Struct.new(:registers).new(
          #   site: Struct.new(:config)
          # )
        end
      end
    end
  end
end
