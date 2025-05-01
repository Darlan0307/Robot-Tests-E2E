#!/bin/bash

GREEN='\033[0;32m'

# Cria a estrutura de diretórios se não existir
mkdir -p results/screenshots
mkdir -p results/logs

# Executa os testes com Robot Framework
robot --outputdir results/logs --timestampoutputs --loglevel DEBUG:INFO tests

echo -e "${GREEN} Testes concluídos! Os resultados estão na pasta 'results'."