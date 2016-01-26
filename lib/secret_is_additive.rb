require_relative 'console_output.rb'

module Interrogator
  class SecretIsAdditive
    include Interrogator::ConsoleOutput

    def initialize(evaluator)
      @evaluator = evaluator
    end

    def for?(combo)
      if added_before(*combo) == added_after(*combo)
        [true, success_response]
      else
        [false, failed_response]
      end
    end

    private

    def added_before(first, last)
      @evaluator.call(first + last)
    end

    def added_after(first, last)
      @evaluator.call(first) + @evaluator.call(last)
    end
  end
end
