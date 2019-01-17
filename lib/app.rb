require 'rubygems'
require 'nokogiri'
require 'open-uri'
PAGE_URL = "http://www.google.com/search?q=doughnuts"



page = Nokogiri::HTML(open(PAGE_URL))


doc = Nokogiri::HTML(open(PAGE_URL))
	doc.xpath('//h3/a').each do |node|
	  puts node.text
	end
