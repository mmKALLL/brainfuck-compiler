require "./spec_helper"

describe Brainfuck do
  it "can output the current value" do
    Brainfuck.parse(".").should eq "0"
  end
  it "can increment the current value" do
    Brainfuck.parse("+.").should eq "1"
  end
  it "can decrement the current value" do
    Brainfuck.parse("++.-.").should eq "2,1"
  end
  it "can handle overflow of values" do
    Brainfuck.parse(".-.-.+.+.").should eq "0,255,254,255,0"
  end
  it "ignores unknown characters" do
    Brainfuck.parse(".   +  \n . ").should eq "0,1"
  end
  it "can output and increment the current value multiple times" do
    Brainfuck.parse(".+.+.+.").should eq "0,1,2,3"
  end
  it "can read a value" do
    Brainfuck.parse(",a.").should eq "97"
    Brainfuck.parse(",b.").should eq "98"
    Brainfuck.parse(",C.").should eq "67"
    Brainfuck.parse(", .").should eq "32"
  end
  it "can move the cursor" do
    Brainfuck.parse("+.>.++.<.").should eq "1,0,2,1"
  end
  it "can create a simple loop" do
    Brainfuck.parse("++[.-].").should eq "2,1,0,0"
  end
  it "can create a loop that uses multiple values" do
    Brainfuck.parse("++[->+++.<].").should eq "3,6,0"
  end
  it "can create a nested loop" do
    Brainfuck.parse("++[->+++.[->+.<]<].").should eq "3,1,2,3,3,4,5,6,0"
  end
  it "can compute a multiplication" do
    Brainfuck.parse("
    ++++>++><<
    [-
      >[->>+<<]
      >>[-<+<+>>]
      <<<
    ]>>
    .").should eq "8"
  end
end
