# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

20.times do |n|
  FactoryGirl.create(:user)
end

200.times do |n|
  FactoryGirl.create(:citation)
end

Author.create name: "Doe, J."
Author.create name: "Smith, B."

3.times do |n|
  FactoryGirl.create :project
end

Citation.all.each do |citation|
  project_id = Random.rand(1..3)
  citation.projects << Project.find(project_id)
end

10.times do |n|
  FactoryGirl.create :category
end

Citation.all.each do |citation|
  number_categories = Random.rand(0..4)
  number_categories.times do
    category_id = Random.rand(1..10)
    begin
      citation.categories << Category.find(category_id)
    rescue Exception

    end
  end
end

100.times do |n|
  citation_id = Random.rand(1..150)
  user_id = Random.rand(1..15)
  citation = Citation.find(citation_id)
  user = User.find(user_id)
  FactoryGirl.create(:comment, user: user, citation: citation)
end

