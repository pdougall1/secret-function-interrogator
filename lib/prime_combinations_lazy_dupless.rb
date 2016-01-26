require 'prime'

module Interrogator
  class PrimeCombinationsLazyDupless

    def initialize(int)
      raise ArgumentError.new('Integer must not be negative.') unless int > 0
      @processed_combos = ProcessedCombos.new
      @int = int
      @primes_master = Prime.each(@int)
    end

    def primes
      @primes_master.dup
    end

    def each(&block)
      primes.each do |one|
        primes.each do |two|
          combo = [one, two].sort
          block.call(combo) if @processed_combos.processed?(combo)
        end
      end
    end

    class ProcessedCombos

      def initialize
        @processed = {}
      end

      def processed?(val)
        if @processed[val]
          return false
        else
          @processed[val] = true
          return true
        end
      end
    end
  end
end
