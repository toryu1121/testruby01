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
      @db.execute(sql, "2", "2002", "ハナ", "江戸川区北小岩", "2", "13")
      @db.execute(sql, "3", "2003", "ミケ", "館林市緑町", "2", "10")
      @db.execute(sql, "4", "2004", "キク", "江戸川区西小岩", "2", "13")
      @db.execute(sql, "5", "2005", "ウメ", "江戸川区南小岩", "2", "13")
      @db.execute(sql, "6", "2006", "トラネコ商会", "札幌市南区", "1", "1")
      @db.execute(sql, "7", "", "クロ", "台東区浅草橋", "2", "13")
      @db.execute(sql, "8", "", "トラ", "川崎市多摩区", "2", "14")
      @db.execute(sql, "9", "", "スーパーニャンコ", "江戸川区南小岩", "1", "13")
      @db.execute(sql, "10", "", "ぶち雑貨屋", "江戸川区南小岩", "1", "13")
    end
  end
  
end

Story.new
