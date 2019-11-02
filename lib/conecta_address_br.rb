require "conecta_address_br/version"

module ConectaAddressBr
  class Error < StandardError; end
  
  class State
    def all
      [
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

  class City
    def
    end
  end
end
