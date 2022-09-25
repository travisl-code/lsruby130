class TextAnalyzer
  def process
    # your implementation
    # arr = text.split("\n\n")
    # counter = 0
    # accumulator = 0
    # while counter < arr.size do
    #   p yield arr[counter]
    #   accumulator += yield arr[counter] if block_given?
    #   counter += 1
    # end
    # accumulator
    file = File.open('sample_text.txt', 'r')
    yield (text.read) if block_given?
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size} lines" }
analyzer.process { |text| puts "#{text.split(' ').size} words" }