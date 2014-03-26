require "service_injector/version"

module ServiceInjector

  require 'active_support/inflector'

  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods

    def uses(service, &block)
      block ||= -> { service.to_s.camelize.constantize.new }
      define_method service do
        instance_variable_set("@#{service}", block.call) unless instance_variable_get("@#{service}")
        instance_variable_get("@#{service}")
      end
      protected service
    end

  end

end
