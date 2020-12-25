# frozen_string_literal: true

require 'test_helper'

module Jekyll
  module KargWare
    module Shorten
      class GeneralTest < Minitest::Test
        def test_that_it_has_a_rubygem_name
          refute_nil Jekyll::KargWare::Shorten::RUBYGEM_NAME
        end

        def test_that_it_has_a_version_number
          refute_nil Jekyll::KargWare::Shorten::VERSION
        end

        def test_fail_always_please_remove
          assert true
        end
      end
    end
  end
end
