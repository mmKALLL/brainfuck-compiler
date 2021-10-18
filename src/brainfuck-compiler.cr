# TODO: Write documentation for `Brainfuck`
module Brainfuck
  VERSION = "0.1.0"
  extend self # Append functions to Brainfuck.self, so they can be called from outside the module.

  # Simple parsing of brainfuck. Output is done using comma-separated numeric values, differing from standard Brainfuck spec.
  def parse(input)
    input + ' '
  end
end
