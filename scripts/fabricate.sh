#!/bin/bash

TARGETS=("$@")

if [ ${#TARGETS[@]} -eq 0 ]; then
    echo -e "\e[1;31m[!] ERRO: Nenhuma unidade especificada para fabricação.\e[0m"
    exit 1
fi

RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
NC='\033[0m'

echo -e "${RED}--- PROTOCOLO DE FABRICAÇÃO EGG-OS ---${NC}"
echo -e "Analizando banco de dados de armas..."

FULL_NAMES=""

for pkg in "${TARGETS[@]}"; do
    # 1. Usamos emerge -pO (oneshot/pretend) para pegar a linha do ebuild
    # 2. qatom separa Categoria, Nome e Versão perfeitamente
    # 3. awk '{print $1"/"$2}' reconstrói apenas Categoria/Nome
    
    RAW_EBUILD=$(emerge -pOq "$pkg" 2>/dev/null | grep "\[ebuild" | head -n1)
    
    if [ -z "$RAW_EBUILD" ]; then
        echo -e "  - ${RED}${pkg}${NC} (Alvo não localizado)"
        continue
    fi

    # Extrai o nome completo do pacote (Ex: app-editors/neovim-0.9.5 -> app-editors/neovim)
    # Pegamos a parte que contém o nome (geralmente a 4ª ou 5ª coluna dependendo do status)
    PKG_WITH_VER=$(echo "$RAW_EBUILD" | awk '{for(i=1;i<=NF;i++) if($i ~ /\//) {print $i; break}}')
    CPN=$(qatom --format "%{CATEGORY}/%{PN}" "$PKG_WITH_VER")

    if [ -n "$CPN" ]; then
        echo -e "  - ${GREEN}${CPN}${NC}"
        FULL_NAMES="$FULL_NAMES $CPN"
    else
        echo -e "  - ${RED}${pkg}${NC} (Erro ao processar CPN)"
    fi
done

# Se após o loop não houver nomes válidos, aborta
if [ -z "$FULL_NAMES" ]; then
    echo -e "${RED}[!] Nenhuma unidade válida encontrada. Abortando.${NC}"
    exit 1
fi

echo -ne "\n${YELLOW}AUTORIZAR ALOCAÇÃO DE RECURSOS? (s/n): ${NC}"
read -r choice

if [[ "$choice" =~ ^[Ss]$ ]]; then
    echo -e "${YELLOW}Iniciando linha de montagem...${NC}"
    
    # Rodamos o emerge final com os nomes limpos
    if sudo emerge --verbose --ask=n $FULL_NAMES; then
        echo -e "\n${GREEN}########################################"
        echo -e "[*] UNIDADES PRONTAS PARA COMBATE:"
        echo -e "${FULL_NAMES}"
        echo -e "########################################${NC}"
    else
        echo -e "\n${RED}########################################"
        echo -e "[!] FALHA CRÍTICA NA FABRICAÇÃO."
        echo -e "########################################${NC}"
    fi
else
    echo -e "\n${BLUE}[I] Operação abortada pelo General.${NC}"
fi