puts "Creating tags"
50.times do
  Tag.create(name: Faker::Commerce.department)
end

puts "Creating clients"
10_000.times do
  client = Client.create(name: Faker::Artist.name, email: Faker::Internet.email)
  puts client.inspect
  [2, 5, 10].sample.times do
    Enrollment.create(client: client, tag: Tag.all.sample, name: SecureRandom.base64.delete('=='))
  end
end
