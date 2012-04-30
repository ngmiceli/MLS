namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:first_name => "Example",
                 :last_name => "User", 
                 :email => "example@mls.com",
                 :username => "the-boss",
                 :password => "foobar",
                 :password_confirmation => "foobar",
                 :birthday => Date.new(1990,6,16),
                 :sex => "Male",
                 :description => "I am the coolest guy you will ever meet. Nuff said.")
    admin.toggle!(:admin)
    99.times do |n|
      email = "example-#{n+1}@mls.com"
      password  = "password"
      lastName = Faker::Name.last_name
      userName = "user-" + n.to_s
      User.create!(:first_name => Faker::Name.first_name,
                   :last_name => lastName,
                   :email => email,
                   :username => userName,
                   :password => password,
                   :password_confirmation => password,
                   :birthday => Date.new(1989,1,31),
                   :sex => (rand(2) + 1),
                   :description => Faker::Lorem.sentence(30))
    end
  end
end