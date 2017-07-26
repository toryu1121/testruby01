require "sqlite3"
require "./chapter"

# rubyでsqlite3を直接練習
class Story < Chapter
  def initialize
    story_start
    
    story03
    
    story_end
  end
  
  # なんかデータベースの作成とか開いたりとか
  def story_start
    @db = SQLite3::Database.new "test.db"
  end
  
  # .exit的なやつ
  def story_end
    @db.close
  end

  # テーブルを作成するメソッド
  def story01
      # create table
    @sql = <<-SQL
      create table users (
        id integer primary key,
        name text
      );
    SQL
    @db.execute(@sql)
  end
  
  #テーブルの確認(なんかごちゃごちゃ)
  def story02
   @db.execute("SELECT * FROM sqlite_master") do |low|
     p low
   end
  end
  
  #テーブルの確認（テーブル名のみ）
  def story03
    @tables = @db.execute(
      "SELECT tbl_name FROM sqlite_master WHERE type == 'table'"
      ) do |low|
      p low
    end
  end
end

Story.new