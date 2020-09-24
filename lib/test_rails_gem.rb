require "test_rails_gem/railtie"
require "test_rails_gem/core_ext"
require "test_rails_gem/acts_as_gem"

module TestRailsGem
  # --- Your code goes here... ---
  # Remember to comment out this above:
  #     # require "test_rails_gem/acts_as_gem"
  # --- Your code goes here... ---
  #
  # module ActsAsGem
  #   extend ActiveSupport::Concern
  #
  #
  #   included do
  #     def squawk(string)
  #       write_attribute(self.class.gem_text_field, string.to_squawk)
  #       #also equals to
  #       #send("#{self.class.gem_text_field}=", string.to_squawk)
  #
  #     end
  #   end
  #
  #
  #   class_methods do
  #     def acts_as_gem(options = {})
  #       # https://api.rubyonrails.org/classes/Module.html#method-i-mattr_accessor
  #       cattr_accessor :gem_text_field, default: (options[:gem_text_field] || :last_squawk).to_s
  #     end
  #   end
  # end
end
