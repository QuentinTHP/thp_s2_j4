require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'pry'
PAGE_URL1 = "https://www.annuaire-des-mairies.com/95/avernes.html"

puts "\e[H\e[2J"    #clear le terminal


doc2 = Nokogiri::HTML(open("https://annuaire-des-mairies.com/val-d-oise.html"))


# Method de recherche d'email, avec l'adresse html de chaque ville
def get_townhall_email(townhall_url)
    email = townhall_url.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]')
    return email.text 
end

#get_townhall_email()



# Récupére toutes les URLs des villes du Val d'Oise
def get_townhall_urls(doc2)
    # Initialisation des arrays
    array_emails = []
    array_villes = []
    array_fin = []
    # Boucle array villes
    doc2.xpath('//td/p/a').each do |ville|
          ville = ville.text
          array_villes << ville
    end
    # Boucle array emails. Recupération des url
    doc2.xpath('//td/p/a/@href').each do |urls|  
        urls = urls.text 
        # Retrait du point devan les liens
        urls.slice!(0)
        # Ajout du début du lien
        urls = "https://annuaire-des-mairies.com" + urls
        # Appel de la fonction de recherche d'email avec le nouveau lien
        emails = get_townhall_email(Nokogiri::HTML(open(urls)))
        array_emails << emails
    end
    # Création hash joignant les viles et les emails
    hash = Hash[array_villes.zip(array_emails)]
    # Création d'un array de hash
    hash.each {|i| array_fin << {i[0] => i[1]}}
    puts array_fin
end

get_townhall_urls(doc2)


