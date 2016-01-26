require 'spec_helper'

describe Interrogator::PrimeCombinations do
  context 'with an int of 1' do
    let(:int) { 1 }
    subject(:combos) { described_class.new(int) }

    it 'does not include combos with the same values' do
      unique_combos = combos.map(&:sort).uniq.count
      expect(combos.to_a.count).to eq unique_combos
    end

    it 'only has prime numbers' do
      non_primes = combos.to_a.flatten.reject { |int| Prime.prime?(int) }
      expect(non_primes).to be_empty
    end
  end

  context 'with a kind of big int' do
    let(:int) { 1000 } # problems arise with n ? 1000 :(
    subject(:combos) { described_class.new(int) }

    it 'does not include combos with the same values' do
      unique_combos = combos.map(&:sort).uniq.count
      expect(combos.to_a.count).to eq unique_combos
    end

    it 'only has prime numbers' do
      non_primes = combos.to_a.flatten.reject { |int| Prime.prime?(int) }
      expect(non_primes).to be_empty
    end
  end

  context 'when the int is negative' do
    it 'throws an error' do
      expect{ described_class.new(-10) }.to raise_error(ArgumentError)
    end
  end
end
