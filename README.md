<img alt="Logo Conecta" data-src="https://www.conectaai.com/wp-content/themes/conecta/assets/images/conecta.svg" class="img-fluid none-mobile lazyloaded" src="https://www.conectaai.com/wp-content/themes/conecta/assets/images/conecta.svg">

# Address BR

## Instalação

Adicione essa linha em seu Application Gemfile:

```ruby
gem 'conecta_address_br'
```

E então execute:

    $ bundle

Ou instale você mesmo com:

    $ gem install conecta_address_br

## Usabilidade
Versão 0.1.8

Foram implementadas oito funções nesta versão para estruturar melhor estados e cidades:

```ruby
require 'conecta_address_br'

# Retorna uma lista de nome e sigla de todos os estados
ConectaAddressBr::States.all

# Retorna as siglas de todos os estados
ConectaAddressBr::States.all_initials

# Retorna os nomes de todos os estados
ConectaAddressBr::States.all_full_names

# Retorna uma lista do nome da cidade e sigla do estado de todas as cidades
ConectaAddressBr::Cities.all

# Retorna o nome de todas as cidades
ConectaAddressBr::Cities.all_single

# Retorna todas os nomes de cidades e sigla do estado de um estado
sigla_do_estado = "RJ"
ConectaAddressBr::Cities.by_state(sigla_do_estado)

# Retorna todas os nomes de cidades de um estado
ConectaAddressBr::Cities.by_state_single(sigla_do_estado)

# Retorna o estado de uma cidade
cidade = "Rio de Janeiro"
ConectaAddressBr::Cities.get_state(cidade)
```