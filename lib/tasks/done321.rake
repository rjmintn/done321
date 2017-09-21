namespace :done321 do
  desc "Delete items over 7 days old"
  task delete_items: :environment do
    # Ruby code here
    Item.where("created_at <= ?", Time.now - 7.days).destroy_all
  end

  desc "Clear and reset dev db"
  task clear: :environment do
    List.destroy_all
    Item.destroy_all
    ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'lists'")
    ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'items'")
  end

end
