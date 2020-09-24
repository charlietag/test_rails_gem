require "test_helper"

class ActsAsGemTest < ActiveSupport::TestCase
  def test_a_hickwalls_gem_text_field_should_be_last_squawk
    assert_equal "last_squawk", Hickwall.gem_text_field
  end

  def test_a_wickwalls_gem_text_field_should_be_last_tweet
    assert_equal "last_tweet", Wickwall.gem_text_field
  end
end
