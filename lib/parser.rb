require 'pry'
class Parser
  attr_accessor :words
  def initialize
    @words = []
  end

  def parse(file)
    @words = File.open(file).read.split(" ")
  end
end
#
# binding.pry
#
# p = Parser.new
