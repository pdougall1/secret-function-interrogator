module Interrogator
  module ConsoleOutput
    def opening_prompt
%[


  So you've got a secret function hu?
  You can just type it out (or copy and paste) it right in here ;)
  To continue after writing your code just return 3 times :)
  Might look something like this:

    def secret(int)
      # some super secret code here
      return int
    end


]
    end

    def argument_prompt
%[
  So what integer do you want to use?
]
    end

    def success_response
%[
  Awesome!
  For all combinations x and y,
  where x and y are all prime numbers less than the number you passed in!

  ★░░░░░░░░░░░████░░░░░░░░░░░░░░░░░░░░★
  ★░░░░░░░░░███░██░░░░░░░░░░░░░░░░░░░░★
  ★░░░░░░░░░██░░░█░░░░░░░░░░░░░░░░░░░░★
  ★░░░░░░░░░██░░░██░░░░░░░░░░░░░░░░░░░★
  ★░░░░░░░░░░██░░░███░░░░░░░░░░░░░░░░░★
  ★░░░░░░░░░░░██░░░░██░░░░░░░░░░░░░░░░★
  ★░░░░░░░░░░░██░░░░░███░░░░░░░░░░░░░░★
  ★░░░░░░░░░░░░██░░░░░░██░░░░░░░░░░░░░★
  ★░░░░░░░███████░░░░░░░██░░░░░░░░░░░░★
  ★░░░░█████░░░░░░░░░░░░░░███░██░░░░░░★
  ★░░░██░░░░░████░░░░░░░░░░██████░░░░░★
  ★░░░██░░████░░███░░░░░░░░░░░░░██░░░░★
  ★░░░██░░░░░░░░███░░░░░░░░░░░░░██░░░░★
  ★░░░░██████████░███░░░░░░░░░░░██░░░░★
  ★░░░░██░░░░░░░░████░░░░░░░░░░░██░░░░★
  ★░░░░███████████░░██░░░░░░░░░░██░░░░★
  ★░░░░░░██░░░░░░░████░░░░░██████░░░░░★
  ★░░░░░░██████████░██░░░░███░██░░░░░░★
  ★░░░░░░░░░██░░░░░████░███░░░░░░░░░░░★
  ★░░░░░░░░░█████████████░░░░░░░░░░░░░★
  ★░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░★

]
    end

    def failed_response
%[
  Well, it looks like you didn't give me an additive function :(
  Don't worry, you can just try again!
]
    end

    def int_confirmation(int)
%[
  Great you gave us #{int}!
  That's a pretty good one!
]
    end

    def code_confirmation(function_string)
%[
  Ok, so we're working with this:

#{function_string}
]
    end
  end
end
