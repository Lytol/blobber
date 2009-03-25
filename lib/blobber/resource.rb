require 'uuidtools'

module Blobber
  
=begin rdoc



=end
  module Resource
    
    def self.included(base)
      base.extend(ClassMethods)
      base.class_eval do
        attr_reader :uuid
      end
    end
    
    
    def initialize(attrs = {})
      @new_record = true
      @uuid = UUID.random_create.to_s
      self.attributes = attrs
    end
    
    def attributes
      @attributes ||= {}
    end
    
    def attributes=(attrs)
      @attributes = attrs
    end
    
    def save
      if Blobber.connection.set(uuid, attributes.to_json)
        @new_record = false
        return true
      end
      false
    end
    
    def new_record?
      @new_record
    end
        
    def method_missing(sym, *args, &block)
      if attributes.has_key?(sym)
        attributes[sym]
      else
        super
      end
    end
    
    module ClassMethods; end
  end
end