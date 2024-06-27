require 'nokogiri'
require 'open-uri'

#methode pour recuperer l'adresse e-mail d'une mairie
def get_townhall_email(townhall_url)
    #recupère la page html de la mairie
    page = Nokogiri::HTML(URI.open(townhall_url))
    #recupère l'adresse e-mail de la mairie
    email = page.xpath('//tr[td="Adresse email]/following-sibling::td/a').text
    email
end

#methode pour recupérer les URLs des mairies de Val d'Oise
def get_townhall_urls
    # Récupère la page HTML de l'annuaire des mairies du Val d'Oise
    page = Nokogiri::HTML(URI.open('https://annuaire-des-mairies.com/val-d-oise.html'))
    # Récupère tous les liens vers les mairies du Val d'Oise
    links = page.xpath('//a[contains(@href, "/95)]/@href')
    # Supprime le premier élément de l'array (qui est vide)
    link.shift 
    # Construit les URLs complètes des mairies à partir des liens relatifs
    urls = links.map { |link| "https://annuaire-des-mairies.com#{link}" }
    urls
end

# Récupère les URLs des mairies du Val d'Oise
townhall_urls = get_townhall_urls
# Initialise un array vide pour stocker les adresses e-mail
townhalls = []

# Parcourt les URLs des mairies
townhall_urls.each do |townhall_url|
    # Récupère le nom de la ville à partir de l'URL
    town_name = townhall_url.match(/(\w+-?\w*)\.html$/)[1].upcase
    # Récupère l'adresse e-mail de la mairie
    email = get_townhall_email(townhall_url)
    # Crée un hash pour la mairie et l'ajoute à l'array
    townhall = { town_name => email }
    townhalls << townhall
    # Affiche un message pour montrer que l'adresse e-mail a été récupérée
    puts "#{town_name} : #{email}"
end

puts townhalls 