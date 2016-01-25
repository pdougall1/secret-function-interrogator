module Interrogator
  class Evaluator
    class Substrait
      def initialize(code_string = '')
        self.instance_eval(code_string)
      end
    end

    def initialize(code_string)
      @seeded_substrait = Substrait.new(code_string)
      validate
    end

    def call(int)
      @seeded_substrait.secret(int)
    end

    private

    def validate
      validate_secret_method
      validate_int_return
    end

    def validate_secret_method
      initial_methods = Substrait.new.methods
      has_method = (@seeded_substrait.methods - initial_methods).include? :secret
      raise ArgumentError.new("Your code must have a method named `secret`.") unless has_method
    end

    def validate_int_return
      returns_int = @seeded_substrait.secret(10).is_a? Integer
      raise ArgumentError.new("Your method named `secret` must return an integer.") unless returns_int
    end
  end
end
