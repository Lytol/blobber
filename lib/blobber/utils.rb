# Create a utility class so we can avoid having to use ActiveSupport
#
module Blobber
  module Utils
    extend self
    
    def symbolize_keys(hash)
      hash.inject({}) do |options, (key, value)|
        options[(key.to_sym rescue key) || key] = value
        options
      end
    end

  end
end