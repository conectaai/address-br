<img alt="Logo Conecta" data-src="https://www.conectaai.com/wp-content/themes/conecta/assets/images/conecta.svg" class="img-fluid none-mobile lazyloaded" src="https://www.conectaai.com/wp-content/themes/conecta/assets/images/conecta.svg">

# Address BR

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'conecta_address_br'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install conecta_address_br

## Usage
Versão 0.1.7

Foram implementadas cinco funções nesta versão para estruturar melhor estados e cidades:

```ruby
require 'conecta_address_br'

ConectaAddressBr::States.all # Retorna todos os estados do Brasil

ConectaAddressBr::Cities.all # Retorna todas as cidades do Brasil

sigla_do_estado = "RJ"
ConectaAddressBr::Cities.by_state(sigla_do_estado) # Retorna todas as cidades/estados de um estado

ConectaAddressBr::Cities.by_state_single(sigla_do_estado) # Retorna todas as cidades de um estado

cidade = "Rio de Janeiro"
ConectaAddressBr::Cities.get_state(cidade) # Retorna o estado de uma cidade
```