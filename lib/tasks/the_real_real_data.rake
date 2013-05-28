desc "Fetch Name, Size, and Price of items"
task :fetch_data => :environment do

	require 'nokogiri'
	require 'open-uri'

	url = "http://www.therealreal.com/Event.aspx?l=00012145065700000000"
	doc = Nokogiri::HTML(open(url))

	## This should iterate over every clothing item on 
	## page and print out item name, size, and price
	doc.css(".SEvntGridBoxR").each do |item|
		name = item.at_css(".SEvntTitle").text
		size = item.at_css(".SEvntSizeValue").text
		price = item.at_css(".SEvntPriceValue").text
		puts "Name: #{name}"
		puts "Size: #{size}"
		puts "Price: #{price}"
		puts ""

		rake_data = Product.new(name: name, size: size, price: price)
		rake_data.save
	end
end