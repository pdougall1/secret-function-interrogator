require 'prime'

module Interrogator
  class PrimeCombinationsLazy

    def initialize(int)
      raise ArgumentError.new('Integer must not be negative.') unless int > 0
      @int = int
    end

    def each(&block)
      primes.each do |one|
        primes.each do |two|
          combo = [one, two].sort
          block.call(combo)
        end
      end
    end

    def primes
      Prime.each(@int)
    end
  end
end
