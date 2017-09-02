users = User.all

6.times do |count|
  list = List.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    user_id: users.sample.id
  )
  list.update_attributes(:created_at => Faker::Date.between(6.days.ago, Date.today), :updated_at => Date.today)
end

@lists = List.all

@lists.each do |list|
  rand(2..5).times do
    item = Item.create!(
    name: Faker::Lorem.sentence,
    description: Faker::Lorem.sentence,
    user_id: list[:user_id],
    create_by_id: list[:user_id],
    list_id: list[:id],
    priority: rand(1..5),
    duration: rand(1..8),
    repeat: Date::DAYNAMES.sample,
    due: Faker::Date,
    active: Faker::Date,
    start: Faker::Date,

    )
    item.update_attributes(:created_at => Faker::Date.between(6.days.ago, Date.today),  :updated_at => Date.today)


  end
end
