module DeloreanTestBed
  def self.cache
    Cache
  end

  class Cache
    # Set our own cache or read the setup one
    def self.cache
      ActiveSupport::Cache.lookup_store(Rails.application.config.cache_store)
    end
    #
    def self.write(k,v)
      cache.write([:delorean,:key],v)
    end

    def self.read(k)
      cache.read([:delorean,:key])
    end
  end
end
