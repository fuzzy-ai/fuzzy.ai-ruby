require "fuzzy_io/version"

module FuzzyIo

  class Account

    attr_reader :key

    def initialize(key)
      @key = key
    end

  end

end
