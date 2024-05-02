require 'json'

# Seed Verticals
verticals_json = File.read(Rails.root.join('json', 'verticals.json'))
verticals = JSON.parse(verticals_json)
verticals.each do |vertical_data|
  Vertical.create!(name: vertical_data['Name'])
end

# Seed Categories
categories_json = File.read(Rails.root.join('json', 'categories.json'))
categories = JSON.parse(categories_json)
categories.each do |category_data|
  vertical = Vertical.find(category_data['Verticals'])
  Category.create!(name: category_data['Name'], vertical: vertical)
end

# Seed Courses
courses_json = File.read(Rails.root.join('json', 'courses.json'))
courses = JSON.parse(courses_json)
courses.each do |course_data|
  category = Category.find(course_data['Categories'])
  Course.create!(name: course_data['Name'], author: course_data['Author'], category: category)
end
