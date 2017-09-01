List.destroy_all
Item.destroy_all
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'lists'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'items'")
