# Finish program to meet specs...

=begin
1) Listen for something. If anything said, record
2) If nothing said, do not record
3) Retrieve what was said through block
4) Output most recent recording with `Device#play`
=end

class Device
  def initialize
    @recordings = []
  end

  def record(recording)
    @recordings << recording
  end

  def listen(&block)
    record(block) if block_given?
  end

  def play
    puts @recordings.last.call
  end
end

listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
