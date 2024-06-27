# projet4_semaine3
                            Description des exercices
                dark_trader.rb
    
Dans ce programme, nous utilisons la gem Nokogiri pour parser la page HTML et extraire les informations dont nous avons besoin à l'aide de XPath. Nous parcourons tous les éléments de la table des cryptomonnaies (<tbody>/<tr>) et récupérons le nom et le cours de chaque cryptomonnaie à l'aide de XPath. Nous créons ensuite un hash pour chaque cryptomonnaie et l'ajoutons à l'array cryptos. Enfin, nous affichons un message pour montrer que la cryptomonnaie a été récupérée et affichons l'array final contenant toutes les cryptomonnaies et leurs cours.
Notons que nous utilisons la méthode gsub pour supprimer les virgules du cours de la cryptomonnaie et la méthode to_f pour convertir le résultat en nombre flottant.

               get_email_corp.rb
    
Dans ce programme, nous définissons deux méthodes : get_townhall_email et get_townhall_urls. La première méthode prend en entrée l'URL d'une mairie et récupère son adresse e-mail en utilisant XPath. La deuxième méthode récupère les URLs de toutes les mairies du Val d'Oise à partir de l'annuaire des mairies.

Nous utilisons ensuite ces deux méthodes pour parcourir les URLs des mairies du Val d'Oise, récupérer le nom de la ville et son adresse e-mail, et stocker ces informations dans un hash que nous ajoutons à l'array townhalls. Enfin, nous affichons un message pour montrer que la mairie a été récupérée et affichons l'array final contenant toutes les mairies et leurs adresses e-mail.

Notez que nous utilisons la méthode match pour extraire le nom de la ville à partir de l'URL de la mairie.