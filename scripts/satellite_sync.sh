#!/bin/bash

# Cores Táticas
RED='\033[1;31m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

clear
echo -e "${RED}[!] INICIANDO PROTOCOLO DE RECONHECIMENTO GLOBAL [!]${NC}"
echo -e "${CYAN}>> Estabelecendo conexão com a rede de satélites Eggman...${NC}"
sleep 1
echo -e "${CYAN}>> Localizando servidores de inteligência (Portage Mirrors)...${NC}"
sleep 1

# Sincronização de arquivos (Web-sync é mais rápido e parece 'download de dados')
# Rodamos o webrsync primeiro e depois o sync para garantir 100% de precisão
if sudo emerge-webrsync && sudo emerge --sync; then
    sleep 1
    echo -e "\n${CYAN}====================================================${NC}"
    echo -e "${CYAN}      SINCRONIZAÇÃO DE SATÉLITES CONCLUÍDA          ${NC}"
    echo -e "${CYAN}      NOVOS ALVOS IDENTIFICADOS NO REPOSITÓRIO      ${NC}"
    echo -e "${CYAN}====================================================${NC}"
    echo -e "${YELLOW}[i] Use 'upgrade-arsenal' para fabricar as melhorias.${NC}"
else
    echo -e "\n${RED}####################################################${NC}"
    echo -e "${RED}      !!! ERRO NA TRANSMISSÃO DE DADOS !!!          ${NC}"
    echo -e "${RED}      INTERFERÊNCIA DETECTADA (CHECK NETWORK)       ${NC}"
    echo -e "${RED}####################################################${NC}"
fi
