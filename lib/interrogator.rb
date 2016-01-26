require_relative 'evaluator.rb'
require_relative 'prime_combinations.rb'
require_relative 'secret_is_additive.rb'
require_relative 'console_output.rb'

module Interrogator
  class << self
    include Interrogator::ConsoleOutput

    def begin_interrogation
      puts opening_prompt
      @function_string = gets_code
      evaluator # creating here ensures the code is valid, may want to pull that validation out
      puts code_confirmation(@function_string)
      puts "\n  ____________________________________\n"
      puts argument_prompt
      @int = gets_int
      puts int_confirmation(@int)
      puts "\n  ____________________________________\n"
      check_secret_for_prime_combos
    end

    def gets_code(code = "")
      while code << STDIN.gets
        return code if code["\n\n\n"]
      end
    end

    def gets_int
      begin
        return Integer(gets.chomp)
      rescue ArgumentError
        puts "The argument to secret must be an integer.\n\n"
        gets_int
      end
    end

    def evaluator
      @evaluator ||= Interrogator::Evaluator.new(@function_string)
    end

    def check_secret_for_prime_combos
      secret_is_additive = Interrogator::SecretIsAdditive.new(evaluator)
      response = nil
      Interrogator::PrimeCombinations.new(@int).each do |combo|
        success, response = secret_is_additive.for?(combo)
        break unless success
      end

      puts response
    end
  end
end
