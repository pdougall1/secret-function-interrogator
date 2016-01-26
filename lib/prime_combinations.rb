require 'prime'

module Interrogator
  class PrimeCombinations
    include Enumerable

    def initialize(int)
      raise ArgumentError.new('Integer must not be negative.') unless int > 0
      @int = int
    end

    def each(&block)
      combos.each(&block)
    end

    def combos
      combos = []
      primes.each do |one|
        primes.each do |two|
          combos << [one, two].sort
        end
      end
      combos.uniq
    end

    def primes
      Prime.each(@int)
    end
  end
end
