require 'csv'

PASSWORD = "admin"

Event.delete_all
Article.delete_all
Tagging.delete_all
Tag.delete_all
Company.delete_all
User.delete_all

super_user = User.create(
    first_name: "Montgomery",
    last_name: "Burns",
    email: "monty@springfield.com",
    password: PASSWORD,
    admin: true
)

15.times do
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
        first_name: first_name,
        last_name: last_name,
        email: "#{first_name.downcase}.#{last_name.downcase}@example.com",
        password: PASSWORD
    )
end

users = User.all

20.times do 
    Tag.create(
        name: Faker::ProgrammingLanguage.name
    )
end

tags = Tag.all

csv_text = File.read(Rails.root.join('lib', 'seeds', 'company_data.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    c = Company.new
    c.name = row['name']
    c.address = row['address']
    c.postal_code = row['postal_code']
    c.overview = row['overview']
    c.employees = row['employees']
    c.tech_team = row['tech_team']
    c.website = row['website']
    c.tags = tags.shuffle.slice(0, rand(2..5))
    c.twitter = row['twitter']
    c.logo = row['logo']
    c.published = row['published']
    c.user = users.sample
    c.save
    puts "#{c.name} saved"
end

companies = Company.all

puts Cowsay.say("Created #{users.count} users", :ghostbusters)
puts Cowsay.say("Created #{tags.count} tags", :cow)
puts Cowsay.say("Uploaded #{companies.count} companies!", :tux)

puts "Login with #{super_user.email} and password of #{PASSWORD}"
