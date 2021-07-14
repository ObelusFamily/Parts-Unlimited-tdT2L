# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
  # Favorite.destroy_all
  # tags = Favorite.create( [{
  #   user_id: 001,
  #   item_id: 0002, 
  #   created_at: DateTime.parse("09/01/2009 17:00"), 
  #   updated_at: DateTime.parse("09/01/2009 18:00"), 
  #   item_id: 1,
  #   user_id: 1
  #   }])
  # Character.create(name: 'Luke', movie: movies.first)
  # 
  # movies = Movie.create([{ name: 'Star Wars 2' }, { name: 'Lord of the Rings 2' }])
  # Character.create(name: 'Luke 2', movie: movies.first)
  # movies = Movie.create([{ name: 'Star Wars 3' }, { name: 'Lord of the Rings 3' }])
  # Character.create(name: 'Luke 3', movie: movies.first)
  # movies = Movie.create([{ name: 'Star Wars 4' }, { name: 'Lord of the Rings 4' }])
  # Character.create(name: 'Luke 4', movie: movies.first)
  
  # p "Created #{Favorite.count} favorites"
  p "========>>> we started to create a new elements"

  user_list = [{
    "email" => "leira1192@gmail.com",
    "username" => "leira1192",
    "password" => "leira1192",
    "bio" => "leira1192 is a player of leage of legends, he is in silver 2 rank",
    "items" => [{
      "title" => "Testing 1",
      "description" => "this is the first item for testing",
      "tag_list" => ["League of Legends"]
    }]
  }]
  p "========>>> llegamos aqui 3"
  counter = 0
  user_list.each do |user|
    p "========>>> this is the user #{counter} #{user}"
    created_user = User.create!(
      email: user["email"],
      username: user["username"],
      password: user["password"],
      image: user["image"],
      bio: user["bio"],
    )
    counter2 = 0
    p "=======>>>>> let see 0"
    p "=======>>>>> let see 1 #{user["bio"]}"
    p "=======>>>>> let see 2 #{user["items"]}"
    user["items"].each do |item|
      p "========>>> this is the item #{counter2} #{item}"
      Item.create!(
            title: item["title"],
            description: item["description"],
            user_id: created_user.id,
            image: item["image"],
            tag_list: item["tag_list"].map { |name| ActsAsTaggableOn::Tag.find_or_create_by!(name: name)}
        )
      counter2 = counter2 + 1
    end
    counter = counter + 1
  end