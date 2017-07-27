require "sqlite3"
class Story
  def initialize
    story_start
    story01
    story02
    story_end
  end
  
  # なんかデータベースの作成と読み込み
  def story_start
    @db = SQLite3::Database.new "SQL_Drill.db"
  end
  
  # .exit的なやつ
  def story_end
    @db.close
  end

  # テーブルを作成するメソッド
  # 二度目の実行でエラーでてしまう
  def story01
      # create table
      @sql = <<-SQL
      create table Customers (
        CustomerID integer,
        CustomerCode integer,
        CustomerName text,
        Address text,
        CustomerClassID integer,
        PrefectualID integer
      );
    SQL
    @db.execute(@sql)
  end
  
  def story02
    @db.transaction do
      sql = "insert into Customers values (?, ?, ?, ?, ?, ?)"
      @db.execute(sql, "1", "2001", "タマ", "江戸川区下小岩", "2", "13")
    end
  end
  
end

Story.new
