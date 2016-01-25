require 'spec_helper'

describe Interrogator::Evaluator do
  let(:int) { 10 }
  let(:code_string) { %[
    def secret(int)
      return int
    end
  ] }

  subject(:evaluator) { described_class.new(code_string) }

  describe '#call' do
    it 'returns an integer' do
      expect(evaluator.call(int)).to eq int
    end
  end

  context 'when first method name is not secret' do
    let(:code_string) { %[
      def not_secret(int)
        return int
      end
    ] }

    it 'throws an error' do
      expect{ evaluator }.to raise_error(ArgumentError, 'Your code must have a method named `secret`.')
    end

    context 'but second method name is secret' do
      let(:code_string) { %[
        def not_secret(int)
          return int
        end

        def secret(int)
          return int
        end
      ] }

      it 'does not throw an error' do
        expect{ evaluator }.not_to raise_error
      end
    end
  end

  context 'when not returning an integer' do
    let(:code_string) { %[
      def secret(int)
        return '10'
      end
    ] }

    it 'throws an error' do
      expect{ evaluator }.to raise_error(ArgumentError, "Your method named `secret` must return an integer.")
    end
  end
end
