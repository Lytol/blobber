module Blobber
  
=begin rdoc



=end
  module Resource
    
    def self.included(base)
      base.extend(ClassMethods)
    end
    
    
    def initialize(attrs = {})
      self.attributes = attrs
    end
    
    def save
      
    end
    
    def attributes
      @attributes ||= []
    end
    
    def attributes=(attrs)
      @attributes = attrs
    end
        
    def method_missing(sym, *args, &block)
      if attributes.has_key?(sym)
        attributes[sym]
      else
        super
      end
    end
    
    module ClassMethods
      
      def find(uuid)
        
      end
      
    end
  end
end