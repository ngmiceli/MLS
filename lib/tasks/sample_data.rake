namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                 :email => "example@mls.com",
                 :password => "foobar",
                 :password_confirmation => "foobar",
                 :birthday => Date.new(1990,6,16),
                 :sex => "Male")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@mls.com"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password,
                   :birthday => Date.new(1989,1,31),
                   :sex => (rand(3) + 1))
    end
  end
end