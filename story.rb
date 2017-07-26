require "./chapter"

class Story
  def initialize
    story01
    story02
    story03
    story04
    Chapter.new
  end
  
  def story01
    p "hello"
  end
  
  def story02
    p "ok"
  end
  
  def story03
    puts system("sqlite3 sqltest2")
  end
  
  def story04
    puts system("create table test(id integer, name text);")
  end
end

Story.new