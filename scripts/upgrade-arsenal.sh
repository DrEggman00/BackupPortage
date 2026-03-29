#!/bin/bash

echo -e "\e]11;#200000\a"
# Cores do Império
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

echo -e "${RED}[!] INICIANDO PROTOCOLO DE MODERNIZAÇÃO DO ARSENAL [!]${NC}"
echo -e "${YELLOW}>> Analisando fraquezas nos sistemas atuais...${NC}"
sleep 1

# Executa o emerge
# O comando usa as flags que você já tinha no seu alias
sudo emerge --verbose --ask --newuse --changed-use --deep --update --autounmask-write=y @world

# Captura o código de saída (0 = sucesso, qualquer outro = erro)
RESULT=$?

if [ $RESULT -eq 0 ]; then
    echo -e "\n${GREEN}====================================================${NC}"
    echo -e "${GREEN}      MISSÃO CUMPRIDA: ARSENAL ATUALIZADO           ${NC}"
    echo -e "${GREEN}      TODAS AS UNIDADES ESTÃO EM NÍVEL MÁXIMO       ${NC}"
    echo -e "${GREEN}====================================================${NC}"
    # Opcional: tocar som de sucesso se tiver mpv/sox
    # mpv /caminho/para/victory_theme.mp3 &> /dev/null &
else
    echo -e "\n${RED}####################################################${NC}"
    echo -e "${RED}      !!! ALERTA DE FALHA CRÍTICA NO SISTEMA !!!     ${NC}"
    echo -e "${RED}####################################################${NC}"
    echo -e "${YELLOW}RELATÓRIO DE DANOS:${NC}"
    echo -e " > Causa: Erro na forja de pacotes (Emerge Error Code: $RESULT)"
    echo -e " > Status: Expansão do Império interrompida."
    echo -e " > Ação sugerida: Verifique os logs de impacto (/var/log/emerge.log)"
    echo -e "${RED}####################################################${NC}"
    # Opcional: tocar som de alarme
    # mpv /caminho/para/alarm_siren.mp3 &> /dev/null &
fi
echo -e "\e]11;#000000\a"
exit $RESULT
