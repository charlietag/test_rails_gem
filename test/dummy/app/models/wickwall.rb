class Wickwall < ApplicationRecord
  acts_as_gem gem_text_field: :last_tweet
end
