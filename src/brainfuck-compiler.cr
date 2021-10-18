module Brainfuck
  VERSION = "0.1.0"
  extend self # Append functions to Brainfuck.self, so they can be called from outside the module.

  # Simple parsing of brainfuck. Output is done using comma-separated numeric values, differing from standard Brainfuck spec.
  def parse(input : String) : String
    position = 16384
    values = Array.new(32768, 0_u8)
    output = ""
    input.each_char do |char|
      case char
      when '.'
        output += values[position].to_s + ","
      when '+'
        values[position] += 1
      when '-'
        values[position] -= 1
      end
    end
    output
  end
end
