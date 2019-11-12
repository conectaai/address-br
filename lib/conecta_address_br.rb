require "conecta_address_br"

module ConectaAddressBr
  class ConectaAddressBr::States
    def self.all()
      return [
        %w[Acre AC],
        %w[Alagoas AL],
        %w[Amapá AP],
        %w[Amazonas AM],
        %w[Bahia BA],
        %w[Ceará CE],
        ['Distrito Federal', 'DF'],
        ['Espírito Santo', 'ES'],
        %w[Goiás GO],
        %w[Maranhão MA],
        ['Mato Grosso', 'MT'],
        ['Mato Grosso do Sul', 'MS'],
        ['Minas Gerais', 'MG'],
        %w[Pará PA],
        %w[Paraíba PB],
        %w[Paraná PR],
        %w[Pernambuco PE],
        %w[Piauí PI],
        ['Rio de Janeiro', 'RJ'],
        ['Rio Grande do Norte', 'RN'],
        ['Rio Grande do Sul', 'RS'],
        %w[Rondônia RO],
        %w[Roraima RR],
        ['Santa Catarina', 'SC'],
        ['São Paulo', 'SP'],
        %w[Sergipe SE],
        %w[Tocantins TO]
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