require 'nokogiri'
require 'open-uri'

def get_townhall_email(townhall_url)
    page = Nokogiri::HTML(URI.open(townhall_url))
    email = page.xpath('//tr[td="Adresse email]/following-sibling::td/a').text
    email
end

def get_townhall_urls
    page = Nokogiri::HTML(URI.open('https://annuaire-des-mairies.com/val-d-oise.html'))
    links = page.xpath('//a[contains(@href, "/95)]/@href')
    urls = links.map { |link| "https://annuaire-des-mairies.com#{link}" }
    urls
end

townhall_urls = get_townhall_urls
townhalls = []
townhall_urls.each do |townhall_url|
    town_name = townhall_url.match(/(\w+-?\w*)\.html$/)[1].upcase
    email = get_townhall_email(townhall_url)

    townhall = { town_name => email }
    townhalls << townhall

    puts "#{town_name} : #{email}"
end
puts townhalls 