# Secret Function Interrogator

### Basics
This is a small command line program that answers the following critical question:

“You are given a function 'secret()' that accepts a single integer parameter and returns an integer. In your favorite programming language, write a command-line program that takes one command-line argument (a number) and determines if the secret() function is additive [secret(x+y) = secret(x) + secret(y)], for all combinations x and y, where x and y are all prime numbers less than the number passed via the command-line argument.  Describe how to run your examples.”


### Setup

  1.  clone the repo just like normal
  2.  cd into it `cd secret-function-interrogator`
  3.  run the program `./interrogator`; pass in `--benchmark` if you want to see the benchmark status outputted to the console.
    - To see the benchmarks the algarythm will be run three times, so it might take a little longer.
  4.  follow the prompts :)
    - You'll need to provide some code.  It will need to have a method named `secret` that takes an int and returns an int.  Just paste it right into the console when you're prompted to.
      - Something like this:
      ```
      def secret(int)
        # some code
        return int
      end
      ```
    - Next you'll need to provide an integer to pass to your method.
    _ You'll then be told whether or not the function is additive or not.

### Tests

  1.  First have to `bundle install` for rspec
  2.  Now just run `bundle exec rspec`

### Benchmarking

##### Using fast code
```
def secret(int)
  int
end
```

```
10,000 times
  ____________________________________
            user     system      total        real
basic     3.410000   0.040000   3.450000 (  3.458630)
lazy      1.670000   0.030000   1.700000 (  1.690820)
lazy_dup  3.730000   0.050000   3.780000 (  3.783893)



50,000 times
  ____________________________________
            user     system      total        real
basic    81.870000   0.760000  82.630000 ( 82.645411)
lazy     38.160000   0.930000  39.090000 ( 39.117303)
lazy_dup 77.890000   0.440000  78.330000 ( 78.413921)



100,000 times
  ____________________________________
             user     system      total        real
basic     481.790000  23.810000 505.600000 (513.663833)
lazy      263.100000  41.370000 304.470000 (311.173503)
lazy_dup  368.650000  16.940000 385.590000 (388.989741)

```

##### Using slow code
```
def secret(int)
  10000.times.reduce(&:+)
  int
end
```

```
500 times
  ____________________________________
           user      system      total        real
basic     7.790000   0.010000   7.800000 (  7.787995)
lazy     15.360000   0.000000  15.360000 ( 15.369411)
lazy_dup  7.750000   0.000000   7.750000 (  7.743275)



1000 times
  ____________________________________
           user       system      total        real
basic     25.580000   0.010000  25.590000 ( 25.595286)
lazy      48.720000   0.010000  48.730000 ( 48.736536)
lazy_dup  24.620000   0.010000  24.630000 ( 24.626944)



5000 times
  ____________________________________
           user        system      total        real
basic     395.750000   0.320000 396.070000 (396.214223)
lazy      760.430000   0.550000 760.980000 (761.234535)
lazy_dup  382.590000   0.290000 382.880000 (383.023550)
```
