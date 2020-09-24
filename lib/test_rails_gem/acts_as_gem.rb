module TestRailsGem
  module ActsAsGem
    extend ActiveSupport::Concern

    # Rails (ActiveSupport::Concern):
    #   included in module ===> when this module is included, DO things in 'included' first !
    included do
      #puts "when this module is included, DO things in 'included' first !"
      def squawk(string)
        write_attribute(self.class.gem_text_field, string.to_squawk)
        #also equals to
        #send("#{self.class.gem_text_field}=", string.to_squawk)

      end
    end

    # Rails (ActiveSupport::Concern):
    # class_methods in module ===> Can be class method when a class include this module
    # Ref. https://api.rubyonrails.org/classes/ActiveSupport/Concern.html#method-i-class_methods
    #   (Define class methods from given block. You can define private class methods as well.)
    class_methods do
      def acts_as_gem(options = {})
        # https://api.rubyonrails.org/classes/Module.html#method-i-mattr_accessor
        cattr_accessor :gem_text_field, default: (options[:gem_text_field] || :last_squawk).to_s
      end
    end
  end
end
