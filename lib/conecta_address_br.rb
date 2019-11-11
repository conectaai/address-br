require "conecta_address_br"

module ConectaAddressBr
  class ConectaAddressBr::States
    def self.all()
      return [
        "Acre",
        "Alagoas",
        "Amapá",
        "Amazonas",
        "Bahia",
        "Ceará",
        "Distrito Federal",
        "Espírito Santo",
        "Goiás",
        "Maranhão",
        "Mato Grosso",
        "Mato Grosso do Sul",
        "Minas Gerais",
        "Paraíba",
        "Paraná",
        "Pará",
        "Pernambuco",
        "Piauí",
        "Rio de Janeiro",
        "Rio Grande do Norte",
        "Rio Grande do Sul",
        "Rondônia",
        "Roraima",
        "Santa Catarina",
        "São Paulo",
        "Sergipe",
        "Tocantins"
        ]
    end
  end

  class ConectaAddressBr::Cities
    def self.by_state(state_initial)
      list = []
      File.open("lib/cities.txt").each do |line|
        tmp = line.split()
        state = tmp.first
        if state == state_initial
          tmp.delete(state_initial)
          list.push(tmp.join(" "))
        end
      end
      return list
    end

    def self.all()
      list = []
      File.open("lib/cities.txt").each do |line|
        tmp = line.split()
        tmp.delete(tmp.first)
        list.push(tmp.join(" "))
      end
      return list
    end
  end

  def fetch(keys)
    fetched = translate("addressList.#{key}")
    fetched = fetched.last if fetched.size <= 1
    if !fetched.respond_to?(:sample) && fetched.match(%r{^\/}) && fetched.match(%r{\/$}) # A regex
      regexify(fetched)
    else
      fetched
    end
  end
end