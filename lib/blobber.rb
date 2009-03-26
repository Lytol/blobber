require 'memcache'
require 'json'

require 'blobber/utils'
require 'blobber/resource'


module Blobber
  
  
  def self.connection
    @@connection ||= MemCache.new('localhost:21201')
  end
  
end