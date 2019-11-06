module ConectaAddressBr
    class States
        def cidades(sigla)
            fetch("BR.#{sigla}")
        end
    end
end