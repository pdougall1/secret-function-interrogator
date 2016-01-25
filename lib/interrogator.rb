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
  class << self

    def begin_interrogation
      puts OPENING_PROMPT
      @function_string = gets_code
      puts "\n____________________________________\n"
      puts "OK THEN, this is what I've got : \n\n#{@function_string}"
    end

    def gets_code(code = "")
      while code << STDIN.gets
        return code if code["\n\n\n"]
      end
    end
  end
end
