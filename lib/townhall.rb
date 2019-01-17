require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
PAGE_URL1 = "https://www.annuaire-des-mairies.com/95/avernes.html"
PAGE_URL2 = "https://annuaire-des-mairies.com/val-d-oise.html"

puts "\e[H\e[2J"    #clear le terminal


$doc1 = Nokogiri::HTML(open(PAGE_URL1))
$doc2 = Nokogiri::HTML(open(PAGE_URL2))


# Récupère l'email d'une mairie à partir de l'URL de cette dernière
def get_townhall_email()
    array_mails = []
    $doc1.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mails|
      array_mails << mails.text 
    end
print array_mails
end

#get_townhall_email()



# Récupére toutes les URLs des villes du Val d'Oise
def get_townhall_urls
    array_urls = []
    $doc2.xpath('//td/p/a/@href').each do |urls|  
        urls = urls.text 
        urls.slice!(0)
        urls = "https://annuaire-des-mairies.com" + urls
        array_urls << urls
    end
    puts array_urls
end

get_townhall_urls


# Récupére tout les nom des villes !
#$doc2.xpath('//td/p/a').each do |urls|  


#$doc2.css("a[@class=lientxt]/@href").each do |urls|  

#//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr

    # Xpath mails de la 1ere mairie 
   # /html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]

# Xpath de l'url de la mairie du ABLEIGES
 #  //*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[1]


 #argenteil 
 #//*[@id="voyance-par-telephone"]/table/tbody/tr[2]/td/table/tbody/tr/td[1]/p/a[6]