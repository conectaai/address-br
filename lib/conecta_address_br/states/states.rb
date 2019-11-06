module ConectaAddressBr::States
    def cidades(sigla)
        fetch("BR.#{sigla}")
    end
end