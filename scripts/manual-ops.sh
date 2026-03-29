#!/bin/bash

# Cores do Império
RED='\033[1;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m'

clear
echo -e "${RED}======================================================"
echo -e "       MANUAL DE OPERAÇÕES TÁTICAS - EGG-OS           "
echo -e "======================================================${NC}"

echo -e "\n${YELLOW}[ PROJETOS DE CONSTRUÇÃO & ELIMINAÇÃO ]${NC}"
echo -e "${WHITE}fabricate <alvo>${NC} : Inicia fabricação de unidades (emerge)."
echo -e "${WHITE}terminate <alvo>${NC} : Execução de prisioneiro (unmerge)."

echo -e "\n${YELLOW}[ LOGÍSTICA & RECONHECIMENTO ]${NC}"
echo -e "${WHITE}recon${NC}           : Sincronização de satélites (sync)."
echo -e "${WHITE}upgrade-arsenal${NC} : Modernização total do armamento."
echo -e "${WHITE}sweep-debris${NC}    : Limpeza rápida de destroços."
echo -e "${WHITE}purge-weakness${NC}  : Incineração total de dados inúteis."

echo -e "\n${YELLOW}[ MONITORAMENTO DE CAMPO ]${NC}"
echo -e "${WHITE}status-mecha${NC}    : Diagnóstico de hardware (Fastfetch)."
echo -e "${WHITE}scan-hardware${NC}   : Painel de comando de processos (btop)."
echo -e "${WHITE}eta-impact${NC}      : Monitor de impacto em tempo real (genlop)."
echo -e "${WHITE}check-intruders${NC} : Escaneamento de perímetro (rede)."

echo -e "\n${YELLOW}[ ACESSO AO NÚCLEO (PORTAGE) ]${NC}"
echo -e "${WHITE}portage / usedir${NC} : Acesso aos diretórios de inteligência."
echo -e "${WHITE}makee${NC}           : Edita leis de fabricação (make.conf)."
echo -e "${WHITE}unmask / mask${NC}   : Gerencia travas de armamento."

echo -e "\n${YELLOW}[ PROTOCOLOS DE ENERGIA ]${NC}"
echo -e "${WHITE}reboot-core${NC}     : Reinicializa o núcleo do sistema."
echo -e "${WHITE}blackout${NC}        : Desativação total da base (poweroff)."

echo -e "\n${RED}======================================================"
echo -e "       RANK: GENERAL | AGUARDANDO ORDENS...           "
echo -e "======================================================${NC}"
