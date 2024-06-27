require 'minitest/autorun'
require_relative 'get_email_corp' # supposant que le code est dans un fichier mairies.rb

class TestMairies < Minitest::Test
  def test_get_townhall_email
    # Test pour une mairie dont on connaît l'adresse e-mail
    email = get_townhall_email('http://annuaire-des-mairies.com/95/avernes.html')
    assert_equal 'mairie.avernes@wanadoo.fr', email
  end

  def test_get_townhall_urls
    # Test pour vérifier que le nombre d'URLs correspond au nombre de mairies dans le Val d'Oise
    urls = get_townhall_urls
    assert_equal 185, urls.size
  end

  def test_get_emails
    # Test pour vérifier que l'array de hashs a le bon format et contient les bonnes données
    emails = get_emails
    assert_equal Array, emails.class
    assert_equal 185, emails.size
    assert_equal Hash, emails[0].class
    assert_equal 'Ableiges', emails[0].keys[0]
    assert_equal 'mairie.ableiges@wanadoo.fr', emails[0].values[0]
    assert_equal 'Aincourt', emails[1].keys[0]
    assert_equal 'mairie.aincourt@wanadoo.fr', emails[1].values[0]
  end
end
