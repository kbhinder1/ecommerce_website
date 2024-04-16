# Clear existing data to avoid duplicates
Category.destroy_all
Product.destroy_all

# Create categories
kitchen_gadgets = Category.create!(name: "Kitchen Gadgets")
bathroom_fixtures = Category.create!(name: "Bathroom Fixtures")
lighting_solutions = Category.create!(name: "Lighting Solutions")
heating_cooling = Category.create!(name: "Heating and Cooling Systems")
smart_home_devices = Category.create!(name: "Smart Home Devices")


Product.create!(name: "High-Speed Blender", description: "Blend your foods to perfection with speed and efficiency.", price: 199.99, category: kitchen_gadgets)
Product.create!(name: "Smart Toaster", description: "A toaster that remembers your preferences for the perfect toast every time.", price: 99.99, category: kitchen_gadgets)

Product.create!(name: "Rain Showerhead", description: "Experience the soothing feel of rain every morning.", price: 249.99, category: bathroom_fixtures)
Product.create!(name: "Smart Mirror", description: "A mirror that not only shows your reflection but also the day's weather and news.", price: 499.99, category: bathroom_fixtures)

Product.create!(name: "LED Smart Bulb", description: "Control the lighting of your home with just your voice.", price: 29.99, category: lighting_solutions)
Product.create!(name: "Chandelier", description: "Add a touch of elegance to your dining room.", price: 1099.99, category: lighting_solutions)

Product.create!(name: "Portable Air Conditioner", description: "Keep cool anywhere in your home.", price: 349.99, category: heating_cooling)
Product.create!(name: "Smart Thermostat", description: "Optimize your home's temperature for comfort and savings.", price: 199.99, category: heating_cooling)

Product.create!(name: "Smart Speaker", description: "Play music, control your smart home, get information, and more, all with voice commands.", price: 129.99, category: smart_home_devices)
Product.create!(name: "Smart Security Camera", description: "Keep an eye on your home from anywhere with this smart camera.", price: 89.99, category: smart_home_devices)



StaticPage.find_or_create_by!(slug: 'about') do |page|
  page.title = 'About'
  page.content = 'Initial about page content.'
end

StaticPage.find_or_create_by!(slug: 'contact') do |page|
  page.title = 'Contact'
  page.content = 'Initial contact page content.'
end