begin
  require 'memcache'
rescue LoadError
  puts "You must install a Ruby memcached client library (ex: sudo gem install memcache-client)"
  exit
end

require 'blobber/utils'
require 'blobber/resource'


module Blobber
  
  
  def self.connection
    @@connection ||= MemCache.new('localhost:21201')
  end
  
end