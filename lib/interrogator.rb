require_relative 'evaluator.rb'

module Interrogator
  OPENING_PROMPT = <<DOC


  So you've got a secret function hu?

  You can just type it out (or copy and paste) it right in here ;)

  To continue after writing your code just return 3 times :)
  Might look something like this:

  def secret(int)
    # some super secret code here
    return int
  end


DOC

  ARGUMENT_PROMPT = <<DOC

  Ok cool so we're interrogating this function:

  #{puts @function_string}

  So what integer do you want to use?


DOC

  class << self

    def begin_interrogation
      puts OPENING_PROMPT
      @function_string = gets_code
      puts "\n____________________________________\n"
      evaluator # creating here ensures the code is valid, may want to pull that validation out
      puts ARGUMENT_PROMPT
      @int = gets_int
      puts "\n\n  Great you gave us #{@int}!\n  That's a pretty good one!\n"
      puts "\n____________________________________\n"
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
  end
end
