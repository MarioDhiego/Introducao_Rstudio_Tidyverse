
################# Essencial do Pacote Base do R4.0 #####################################
# Pacotes disponiveis Automaticamente na Versao Base do R4.0

# 1) statts
# 2) graphics
# 3) grDevices
# 4) utils
# 5) dataset
# 6) methods
# 7) base
########################################################################################


################# Divisao dos Pacotes do software R4.0 #######################

# 1) base         : funcoes basicas e preinstaladas e carregadas
# 2) recommended  : funcoes instaladas mas nao carregadas, 
#                   Necessario usar o comando libray()
# 3) contributed  : pacotes que nao sao instalados automaticamente 
#                   usa o comando install.package()
##############################################################################


###############################################################################
###### Instalar Pacotes contributed

# Instalar um Pacote
install.packages("tidyverse")

# Instalar varios PAcotes
install.packages(c("data.table","janitor","DescTools","devtools",
                   "rmarkdown","knitr","tidyvere"))

# Ativar Pacotes
library(tidyverse)

# Desativar Pacotes
detach("package:tidyverse", unload = TRUE)
##################################################################################



############### Conjunto de Pacote tidyverse ######################################
# 1) readr:   versao 1.4.0 => importacao e leitura de arquivos de dados
# 2) dplyr:   versao 1.0.5 => manipulacao de dataframes
# 3) tidyr:   versao 1.1.3 => organizacao de dataframe
# 4) ggplot2: versap 3.3.3 => visualizacao de dados, producao de graficos
# 5) tibble:  versao 3.1.0 => estruturacao de dados  
# 6) purr:    versao 0.3.4 => manipulacao de vetores e listas
# 7) forcats: versao 0.5.1 => manipulacao de dados categoricos
# 8) stringr: versao 1.4.0 => manipulacao de string
# 9) magrittr: versao 1.4.0 => operador pipe
#######################################################################################


################ OPeracoes Matematicas do pacote base ##################################
# Criação de Vetores
x <- c(1,2,2)
y <- c(0.5,1,1)
z <- c(0.5,1,1)

soma <- x+y+z

# Criacao de Matrizes
# 1) por coluna
matriz1 <- cbind(x,y,z)

# 2) por linha
matriz2 <- rbind(x,y,z)

# tabelas de dados
tabela <- data.frame(x,y,z)
View(tabela)

# estrutura do objeto
str(matriz1)


# Funcoes Estatistica Basicas
# coeficiente de correlacao
cor(x,y) 
cor(x,z)
cor(y,z)

# Media simples
mean(x)
mean(y)
mean(z)

# Mediana
median(x)
median(y)
median(z)

# amplitude
min(x)
max(x)

# soma
sum(x)
sum(y)
sum(z)

# variancia
var(x)
var(y)
var(z)
var(x,y)

################################################################################################
################# Leitura de banco de Dados ##################################################

# O Rstudio inclui recursos para importar dados de arquivos do tipo:
# 1) .csv  => ler arquivo do tipo separado por virgula
# 2) .xls  => ler arquivo do tipo excel
# 3) .xlsx => ler arquivo do tipo excel 2
# 4) sav   => ler arquivo do tipo SPSS
# 5) dta   => ler arquivo do tipo
# 5) por   => ler arquivo do tipo 
# 6) sas   => ler arquivo do tipo SAS
# 7) stata => ler arquivo do tipo STATA


# A op??oo From Text(readr) permite ler arquivos do tipo csv (separado por virgula)
# 1) No proprio Computador 
# 2) Como estar hospedado em uma URL

# No R4.0 o separador decimal padr?o ? o ponto.
# Para saber qual ? o separador, basta abrir o arquivo em um bloco de notas


#Primeiro Link
# http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv
# No primeiro link, os dados est?o separados por ponto e v?rgula + seprarador decimal:v?rgula

#Segundo Link
# http://raw.githubusercontent.com/Lucianea/Alta/master/vendas1.csv
# No segundo link, os dados est?o separados por v?rgula + seprarador decimal:ponto.


# O comando read.csv ou read.cvs2 sao fun?oes nativas do R, n?o precisam de nenhum pacote.
# separador ponto e virgula: read.csv2
# separador virrgula: read.csv


# Leitura de Banco de Dados via URL

# Leitura da Base de Dados
Vendas_A = read.csv2("http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")
Vendas_B = read.csv("http://raw.githubusercontent.com/Lucianea/Alta/master/vendas1.csv")


# Visualizar as 6 primeiras linhas
head(Vendas_A)
View(Vendas_A)
################################################################################################




####### Manipulacao de Dados com a Familia de Pacotes tidyverse #######################################
####### Pacote magrittr
library(magrittr)

# O operador Pipe foi criado por Stefan Miltron Bache no pacote magrittr.
# Funciona como uma fun??o composta, tornando a leitura da linha de comando mais l?gica e natural.

# Trata-se de um operador cuja nota??o e dada por: %>%
# Tecla de atalho ? ctrl+shift+M
##################################################################################


##################################################################################
###### Pacote dplyr ##############################################################
library(dplyr)

# Neste pacote temos dispon?vel as seguintes fun??es:
# 1) select()     : extrai colunas de uma tabela na forma de tabela
# 2) pull()       : extrai uma coluna de uma tabela na forma de vetor
# 3) filter()     : filtra linhas
# 4) distinct()   : remove as linhas com valores repetidos
# 5) arrange()    : reordena ou combina linhas
# 6) mutate()     : cria novas colunas no banco original
# 7) summarize()  : sumariza valores
# 8) group_by()   : opera??es por grupos
# 9) add_column() : adiciona novas colunas
# 10) add_row()   : adiciona novas linhas
# 11) rename()    : renomeia uma coluna
##################################################################################


####### Comando select ############################################################
# Selecionar 3 colunas de variAveis

Vendas_A %>%
  dplyr:: select(filial, quinzena, valor_compra) 

Vendas_B %>%
  dplyr:: select(quinzena, filial, n_itens) 
################################################################################


####### Comando pull ############################################################
# extrair uma coluna de uma tabela de dados na forma de vetor

vetor = Vendas_A %>%
  dplyr:: pull(filial)
##################################################################################

   

####### Comando filter ############################################################
## Filtrar a filial A 

Vendas_A %>%
  dplyr:: filter(filial == "A")


## Filtrar a filial A OU n_iten igual a 1
Vendas_A %>%
  dplyr:: filter(filial == "A" | n_itens == 1)


## Filtrar a filial B E quinzena 2
Vendas_A %>%
  dplyr:: filter(filial == "B" & quinzena == 2)
###################################################################################


####### Comando arrange ############################################################
## Organizar os dados de forma crescente

Vendas_A %>%
  dplyr:: arrange(n_itens)

## Decrescente
Vendas_A %>%
  dplyr:: arrange(desc(n_itens))


## Decrescente de n_itens E ordema alfabetica de filial

Vendas_A %>%
  dplyr:: arrange(-n_itens) %>%
  dplyr:: arrange(filial)

## decrescente de n_itens e ao mesmo tempo ordem alfabetica de filial
Vendas_A %>%
  dplyr:: arrange(-n_itens, filial) 

####### Comando distinct ############################################################
## Extrair as linhas distintas para filial

Vendas_A %>%
  dplyr:: distinct(filial)

Vendas_B %>%
  dplyr:: distinct(filial, desconto_perc)
####################################################################################



####### Comando mutate  ############################################################
## Calcular o valor m?dio (VM), criando uma nova coluna
Vendas_A %>%
  dplyr:: mutate(VM = valor_compra/n_itens) 


## Arredondamento
Vendas_A %>%
  dplyr:: mutate(VM = round(valor_compra/n_itens, 2)) %>%
  dplyr:: select(filial, valor_compra, n_itens, VM) %>%
  dplyr:: arrange(VM)

# o mutate acrescenta novas colunas aos dados originais, ja o transmute cria novas colunas apartir dos dados
#################################################################################################



####### Comando summarise  ############################################################
#numero de observacoes da base de dados 
Vendas_A %>%
  dplyr:: summarise(contagem=n())

# numero de filiais distintas
Vendas_A %>%
  dplyr:: select(filial) %>%
  dplyr:: summarise(filial_distintas = n_distinct(filial)) 
  
# numero de cupons distinto da filial B
Vendas_A %>%
  dplyr:: select(filial, cupom) %>%
  dplyr:: filter(filial == "B") %>%
  dplyr:: summarise(cupons_distintos = n_distinct(cupom))
#####################################################################################


####### Comando group_by  ############################################################
#numero de cupons distintos p/ filial 

Vendas_A %>%
group_by(filial) %>%
  summarise(cupons_distintos = n_distinct(cupom))

# total de compras p/ filial
Vendas_A %>%
  group_by(filial) %>%
  summarise(compra_total = sum(valor_compra))


# total de itens p/ filial
Vendas_A %>%
  group_by(filial) %>%
  summarize(item_total = sum(n_itens))


# sumarizar informa??es em + de um grupo em + colunas
Vendas_A %>%
  group_by(filial) %>%
  summarize(
    cupons_distintos = n_distinct(cupom),
    item_total = sum(n_itens),
    compra_total = sum(valor_compra))

# Media, Desvio-padrao, Minimo e Maximo

Vendas_A %>%
  group_by(filial) %>%
  summarize(Media = mean(valor_compra) %>%
            round(2),
            Desvio = sd(valor_compra) %>%
            round(2), 
            Minimo = min(valor_compra) %>%
            round(2),
            Maximo = max(valor_compra) %>%
            round(2))


Vendas_A %>%
  group_by(quinzena) %>%
  summarize(Media = mean(valor_compra) %>%
              round(2),
            Mediana = median(valor_compra) %>%
              round(2),
            Desvio = sd(valor_compra) %>%
              round(2), 
            Minimo = min(valor_compra) %>%
              round(2),
            Maximo = max(valor_compra) %>%
              round(2))
#################################################################################################


####### Exercicio Pratico Geral  ################################################################

# Utilizar o banco Vendas_A
# 1) ordenar os dados pelo n_itens e valor_compra
# 2) filtrar valor_compra maior q 150
# 3) exibe a selecao com filial no inicio
# 4) cria a variavel valor Medio VM: valor_compra/n_itens)
# 5) arrendamanento pra uma casa decimal de VM
# 6) selecionar filial, n_itens, valor_compra e VM no final
# 7) agrupar por filial
# 8) calcular media, mediana, desvio, minimo e maximo

################################################################################################

###### Script ##################################################################################
Vendas_A %>%
  dplyr:: arrange(n_itens, valor_compra) %>%
  dplyr:: filter(valor_compra > 150) %>%
  dplyr:: select(filial, n_itens,valor_compra) %>%
  dplyr:: mutate(VM = valor_compra/n_itens) %>%
  dplyr:: mutate(VM = round(valor_compra/n_itens, 1)) %>%
  dplyr:: select(filial, n_itens, valor_compra, VM) 

Vendas_A %>%
  dplyr:: group_by(filial) %>%
  dplyr:: summarize(Media = mean(valor_compra) %>%
              round(2),
            Mediana = median(valor_compra) %>%
              round(2),
            Desvio = sd(valor_compra) %>%
              round(2), 
            Minimo = min(valor_compra) %>%
              round(2),
            Maximo = max(valor_compra) %>%
              round(2))
##########################################################################################







