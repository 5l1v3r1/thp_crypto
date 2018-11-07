require 'nokogiri'
require 'open-uri'

class StartScrap
  def prices(page) #Récupère le cours des cryptomonnaies
    @prices = []
    page.css("a.price").each do |price| #Pour chaque prix dans ce sélecteur css
      @prices << price.text #On les range dans un array
    end
    return @prices #On retourne l'array des prix
  end

  def cryptos(page) #Récupère les noms des cryptomonnaies
    @cryptos = []
    page.css("a.currency-name-container").each do |crypto| #Pour chaque cryptomonnaie dans ce sélecteur css
      @cryptos << crypto.text #On les range dans un array
    end
    return @cryptos #On retourne l'array des noms des cryptomonnaies
  end

  def perform
    page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all"))
    hash = Hash[cryptos(page).zip(prices(page))] #On récupère les cryptomonnaies avec leur cours (prix)
    return hash
  end
end
