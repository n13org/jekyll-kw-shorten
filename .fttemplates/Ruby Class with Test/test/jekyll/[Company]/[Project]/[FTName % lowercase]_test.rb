# frozen_string_literal: true

require 'test_helper'
require 'jekyll/<Company>/<Project>/<FTName | lowercase>'

module Jekyll
  module <Company>
    module <Project>
      class <FTName | pascalcase>Test < Minitest::Test
        def test_fail_always
          assert false
        end
      end
    end
  end
end
