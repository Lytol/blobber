require 'uuidtools'
require 'json'

module Blobber
  
=begin rdoc



=end
  module Resource
    
    def self.included(base)
      base.extend(ClassMethods)
      base.class_eval do
        attr_accessor :key
      end
    end
    
    
    def initialize(attrs = {})
      @new_record = true
      @key = UUID.random_create.to_s
      self.attributes = attrs
    end
    
    def attributes
      @attributes ||= {}
    end
    
    def attributes=(attrs)
      @attributes = attrs
    end
    
    def save
      if Blobber.connection.set(key, attributes.to_json)
        not_new!
        return true
      end
      false
    end
    
    def destroy
      return false if new_record?
      Blobber.connection.delete(key)
    end
    
    def new_record?
      @new_record
    end
        
    def method_missing(sym, *args, &block)
      if attributes.has_key?(sym)
        attributes[sym]
      elsif sym.to_s =~ /^(.+)=$/
        raise(ArgumentError, "wrong number of arguments (#{args.size} for 1)") unless args.size == 1
        attributes[$1.to_sym] = args.first
      else
        super
      end
    end
    
    protected
    
      def not_new!
        @new_record = false
      end
    
    module ClassMethods
    
      def find(key)
        return nil if key.nil? || key == ''
        blob = Blobber.connection.get(key)
        if blob
          load_from_store(key,blob)
        else
          nil
        end
      end
      
      private
      
        def load_from_store(key,blob)
          doc = new(Blobber::Utils.symbolize_keys(JSON::parse(blob)))
          doc.send(:not_new!) # FIXME: Garrr! Breaks encapsulation... what's a better way?
          doc.key = key
          return doc
        end
      
    end
  end
end