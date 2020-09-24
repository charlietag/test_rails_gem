class ApplicationRecord < ActiveRecord::Base
  include TestRailsGem::ActsAsGem
  self.abstract_class = true
end
