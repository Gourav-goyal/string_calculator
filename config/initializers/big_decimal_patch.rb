# Patch for BigDecimal compatibility with Rails 4.2.8 on newer Ruby versions
if RUBY_VERSION >= '2.6.0'
  module ActiveSupport
    module CoreExtensions
      module BigDecimal
        module Conversions
          def to_s(arg = nil)
            if arg.nil?
              super()
            else
              super(arg)
            end
          end
        end
      end
    end
  end

  BigDecimal.prepend(ActiveSupport::CoreExtensions::BigDecimal::Conversions)

  # Fix for BigDecimal#new deprecation
  if BigDecimal.respond_to?(:new) == false && BigDecimal.respond_to?(:_new)
    BigDecimal.singleton_class.class_eval do
      alias_method :new, :_new
    end
  end

  # Alternative fix if the above doesn't work
  if BigDecimal.respond_to?(:new) == false
    BigDecimal.singleton_class.class_eval do
      def new(*args)
        BigDecimal(*args)
      end
    end
  end
end