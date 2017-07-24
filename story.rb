require "./chapter"

class Story
  def initialize
    story01
    story02
    Chapter.new
  end
  
  def story01
    p "hello"
  end
  
  def story02
    p "ok"
  end
  
end

Story.new