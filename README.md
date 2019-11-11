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
Versão 0.1.3

Três funções foram implementadas nesta versão, organizadas em umm único arquivo

ConectaAddressBr::States.all() << Retorna todos os estados do Brasil
ConectaAddressBr::Cities.all() << Retorna todas as cidades do Brasil
ConectaAddressBr::Cities.by_state(sigla_do_estado) << Retorna todas as cidades de um estado