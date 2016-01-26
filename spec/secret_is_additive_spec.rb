require 'spec_helper'

describe Interrogator::SecretIsAdditive do
  subject(:secret_is_additive) { described_class.new(evaluator) }
  describe '#for' do
    let(:combo)    { [1, 2] }
    subject { secret_is_additive.for?(combo).first }

    context 'when obviously true' do
      let(:evaluator) { -> (num) { num } }
      it { is_expected.to be true }
    end

    context 'when a integer is added' do
      let(:evaluator) { -> (num) { num + 5 } }
      it { is_expected.to be false }
    end

    context 'when a integer is multiplied' do
      let(:evaluator) { -> (num) { num * - 5.0 } }
      it { is_expected.to be true }
    end

    context 'when an integer is devided by an integer' do
      # ruby keeps the response an integer
      let(:evaluator) { -> (num) { num / 5 } }
      it { is_expected.to be true }
    end

    context 'when a integer is devided by a float' do
      let(:evaluator) { -> (num) { num / 5.0 } }
      it { is_expected.to be false }
    end
  end
end
