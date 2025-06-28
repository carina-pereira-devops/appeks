# valores nomeados que podem ser reutilizados em TODOS os módulos
locals {
    tags = {
        Equipe   = "SRE"
        Squad    = "PIX"
        Ambiente = "Dev"
    }
}

# Validar se os recursos vão ser criados com essas Tags