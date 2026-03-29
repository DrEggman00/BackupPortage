#!/bin/bash
# Cores para o teor militar
RED='\033[1;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # Sem cor

# Limpa a tela antes de começar
clear

# O watch vai rodar o cabeçalho e o genlop
watch -cn 1 "
    echo -e '${RED}=========================================================='
    echo -e '      SISTEMA DE MONITORAMENTO DE IMPACTO DO DR. EGGMAN   '
    echo -e '==========================================================${NC}'
    echo -e '${YELLOW}STATUS DA MISSÃO:${NC} EM EXECUÇÃO'
    echo -e '${YELLOW}ALVO ATUAL:${NC}'
    
    # Executa o genlop filtrando as linhas mais importantes
    genlop -ci | tail -n 10
    
    echo -e '${RED}----------------------------------------------------'
    echo -e '      AGUARDANDO CONCLUSÃO DA MANOBRA...            '
    echo -e '----------------------------------------------------${NC}'
"
