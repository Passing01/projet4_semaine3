require 'nokogiri'
require 'twitter'
require 'rspec'
require 'pry'
require 'dotenv'
require 'open-uri'
#Recupère la page HTML de CoinMarketCap
page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
#on initialise un array vide pour stocker les données
crytos = []
#parcours tout les elements de la table des cryptomonaies
page.xpath('//tbody/tr').each do |row|
    #recupère le nom et le cours des crypto
    name = row.xpath('.//td[3]/a').text
    price = row.xpath('.//th[5]/a').text.gsub(',', '').to_f
    #creer un hash pour la crypto et l'ajoute au tableau array
    cryto = { name.upcase => price }
    crytos << cryto 
    #affiche un message pour montrer que la crypto a été recupérer
    puts "#{name} : #{price}"
end
#affiche l'array des hashs contenant les cryptos et leur cours
puts crytos 


