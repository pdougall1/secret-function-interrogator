module Interrogator
  class SecretIsAdditive
    SUCCESS_RESPONSE = <<DOC
      SUCCESS
DOC

    FAILED_RESPONSE = <<DOC
      FAILED
DOC

    def initialize(evaluator)
      @evaluator = evaluator
    end

    def for?(combo)
      if added_before(*combo) == added_after(*combo)
        [true, SUCCESS_RESPONSE]
      else
        [false, FAILED_RESPONSE]
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
