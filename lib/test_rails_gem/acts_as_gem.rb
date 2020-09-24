module TestRailsGem
  module ActsAsGem
    extend ActiveSupport::Concern

    class_methods do
      def acts_as_gem(options = {})
        # https://api.rubyonrails.org/classes/Module.html#method-i-mattr_accessor
        cattr_accessor :gem_text_field, default: (options[:gem_text_field] || :last_squawk).to_s
      end
    end
  end
end
