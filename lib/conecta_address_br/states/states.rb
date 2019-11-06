module ConectaAddressBr
    class States
        def all
            fetch("BR.estados")
        end

        def cities(sigla)
            fetch("BR.#{sigla}")
        end
    end
end