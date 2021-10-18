module Brainfuck
  VERSION = "0.1.0"
  extend self # Append functions to Brainfuck.self, so they can be called from outside the module.

  # Simple parsing of brainfuck. Output is done using comma-separated numeric values, differing from standard Brainfuck spec.
  def parse(input : String) : String
    position = 16384
    values = Array.new(32768, 0_i16)
    output = ""
    input.each_char do |char|
      case char
      when '.'
        output += values[position].to_s + ","
      when '+'
        values[position] = (values[position] + 1) % 256
      when '-'
        values[position] = (values[position] - 1) % 256
      when '>'
        position += 1
        position = position % 32768
      when '<'
        position -= 1
        position = position % 32768
        # when ''
      end
    end
    output
  end
end
