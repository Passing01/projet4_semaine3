require 'minitest/autorun'
require 'nokogiri'
require 'open-uri'

class TestCryptos < Minitest::Test
  def setup
    # Récupère la page HTML de CoinMarketCap
    @page = Nokogiri::HTML(URI.open('https://coinmarketcap.com/all/views/all/'))
  end

  def test_cryptos_size
    # Test pour vérifier que le nombre de cryptomonnaies correspond au nombre de lignes dans la table
    cryptos = []
    @page.xpath('//tbody/tr').each do |row|
      name = row.xpath('.//td[3]/a').text
      price = row.xpath('.//td[5]/a').text.gsub(',', '').to_f
      crypto = { name.upcase => price }
      cryptos << crypto
    end
    assert_equal 200, cryptos.size
  end

  def test_cryptos_format
    # Test pour vérifier que l'array de hashs a le bon format et contient les bonnes données
    cryptos = []
    @page.xpath('//tbody/tr').each do |row|
      name = row.xpath('.//td[3]/a').text
      price = row.xpath('.//td[5]/a').text.gsub(',', '').to_f
      crypto = { name.upcase => price }
      cryptos << crypto
    end
    assert_equal Array, cryptos.class
    assert_equal 200, cryptos.size
    assert_equal Hash, cryptos[0].class
    assert_equal 'BITCOIN', cryptos[0].keys[0]
    assert_equal 47918.8, cryptos[0].values[0]
    assert_equal 'ETH', cryptos[1].keys[0]
    assert_equal 3312.8, cryptos[1].values[0]
  end
end
