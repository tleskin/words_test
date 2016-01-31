class Parser
  def parse(file)
    File.open(file).read.split(" ")
  end
end
