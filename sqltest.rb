require 'sqlite3'

db = SQLite3::Database.new 'test.db'

# create table
sql = <<-SQL
  create table users (
    id integer primary key,
    name text
  );
SQL

db.execute(sql)

# insert
db.execute('insert into users (name) values (?)', 'hitoshi')
db.execute('insert into users (name) values (?)', 'masatoshi')

# select
db.execute('select * from users') do |row|
  p row
end

#=>
# [1, "hitoshi"]
# [2, "masatoshi"]