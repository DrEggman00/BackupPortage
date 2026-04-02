#!/bin/bash

TARGET=$1

# Cores do EGG-OS
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

echo -e "${RED}--- DEPARTAMENTO DE INTELIGÊNCIA EGG-OS ---${NC}"

if [ -z "$TARGET" ]; then
    echo -e "${YELLOW}[!] USO: intel-unit <nome_da_unidade>${NC}"
    exit 1
fi

echo -e "Acessando especificações técnicas de: ${BLUE}${TARGET}${NC}..."
echo -e "${YELLOW}------------------------------------------------------${NC}"

# Verifica se o equery (app-portage/gentoolkit) está instalado
if ! command -v equery &> /dev/null; then
    echo -e "${RED}[!] ERRO: Ferramenta 'equery' não encontrada.${NC}"
    echo -e "Instale com: sudo emerge gentoolkit"
    exit 1
fi

# Executa o equery com formatação personalizada
# Mostra as USE flags: (+) ativas, (-) desativadas
RESULT=$(equery -q uses "$TARGET")

if [ -z "$RESULT" ]; then
    echo -e "${RED}[!] FALHA: Unidade não localizada nos registros do Portage.${NC}"
else
    echo -e "${GREEN}[MUNIÇÃO E MÓDULOS DISPONÍVEIS]:${NC}"
    # Formata a saída para parecer um relatório militar
    echo "$RESULT" | sed 's/^+/  [INSTALADO]  /' | sed 's/^-/  [BLOQUEADO]  /'
    
    echo -e "${YELLOW}------------------------------------------------------${NC}"
    echo -e "${BLUE}[I] DICA:${NC} Edite '/etc/portage/package.use' para alterar o armamento."
fi
