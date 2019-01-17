require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
PAGE_URL = "https://coinmarketcap.com/all/views/all/"

puts "\e[H\e[2J"    #clear le terminal


$doc = Nokogiri::HTML(open(PAGE_URL))

def crypto_name()
  array_name = []
  $doc.xpath('//td[3]').each do |symbol|
    symbol.text 
    array_name << symbol.text 
    end
  return array_name
end


def crypto_values()
    array_values = []
    $doc.xpath('//td[5]/a').each do |values|
      values.text 
      array_values << values.text
      end
  return array_values
end


def crypto_names_and_values()
  puts hash_names_values = Hash[crypto_name().zip crypto_values()]
end

crypto_names_and_values()




# Ensemble des crypto : 
 #   //*[@id="currencies-all"]/tbody

# Ligne du BTC :
  #  //*[@id="id-bitcoin"]

# Contient le symbol BTC :
 #   //*[@id="id-bitcoin"]/td[3]

# Prix du BTC :
 #   //*[@id="id-bitcoin"]/td[5]