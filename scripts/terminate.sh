#!/bin/bash
TARGET=$1

if [ -z "$TARGET" ]; then
    echo -e "\e[1;31m[!] ERRO: Nenhum alvo especificado para execução.\e[0m"
    exit 1
fi

RED='\033[1;31m'
NC='\033[0m'

echo -e "${RED}--- PROTOCOLO DE EXECUÇÃO ATIVADO ---${NC}"
echo -e "Alvo detectado: ${RED}${TARGET}${NC}"
echo -ne "${RED}CONFIRMAR ELIMINAÇÃO DEFINITIVA? (s/n): ${NC}"
read -r choice

if [[ "$choice" =~ ^[Ss]$ ]]; then
    echo -e "\e[1;33mIniciando desintegração molecular...\e[0m"
    
    # Usamos --ask=n para ele não perguntar de novo e rodar direto
    # O --quiet esconde a lista de arquivos mas mantém o progresso
    sudo emerge -C --quiet "$TARGET"
    
    # O segredo: uma pequena pausa para o Portage terminar de escrever no terminal
    sleep 1
    # Exemplo de melhoria no seu script:
    if [ $? -eq 0 ]; then
        echo -e "\n${RED}[*] ALVO NEUTRALIZADO: ${TARGET}${NC}"
    else
        echo -e "\n\e[1;31m[!] ERRO: O alvo não pôde ser neutralizado (ou não existe).\e[0m"
    fi

else
    echo -e "\n\e[1;34m[I] Operação abortada. Alvo poupado.\e[0m"
fi
