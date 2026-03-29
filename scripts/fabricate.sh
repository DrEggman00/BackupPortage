#!/bin/bash
TARGET=$1

# Verifica se o alvo foi definido
if [ -z "$TARGET" ]; then
    echo -e "\e[1;31m[!] ERRO: Nenhuma unidade especificada para fabricação.\e[0m"
    exit 1
fi

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${RED}--- PROTOCOLO DE FABRICAÇÃO EGG-OS ---${NC}"
echo -e "Unidade solicitada: ${YELLOW}${TARGET}${NC}"
echo -ne "${YELLOW}AUTORIZAR ALOCAÇÃO DE RECURSOS? (s/n): ${NC}"
read -r choice

if [[ "$choice" =~ ^[Ss]$ ]]; then
    echo -e "\e[1;33mIniciando linha de montagem... Isso pode demorar.\e[0m"
    
    # Executa o emerge com verbose para você ver a 'construção'
    # Usamos --ask=n para ele não parar no meio se você já disse SIM
    if sudo emerge --verbose --ask=n "$TARGET"; then
        sleep 1
        echo -e "\n${GREEN}########################################"
        echo -e "[*] UNIDADE ${TARGET} CONSTRUIDA E ARMADA."
        echo -e "########################################${NC}"
    else
        sleep 1
        echo -e "\n${RED}########################################"
        echo -e "[!] FALHA CRÍTICA NA LINHA DE MONTAGEM."
        echo -e "########################################${NC}"
    fi
else
    echo -e "\n\e[1;34m[I] Fabricação cancelada pelo General.\e[0m"
fi
