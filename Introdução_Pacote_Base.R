################# Essencial do Pacote Base do R4.0 #################
# Pacotes disponíveis Automaticamente na Versão Base do R4.0

# 1) statts
# 2) graphics
# 3) grDevices
# 4) utils
# 5) dataset
# 6) methods
# 7) base
###################################################################


################# Divião dos Pacotes do R4.0 #######################

# 1) base         : funções básicas e preinstaladas e carregadas
# 2) recommended  : funções instaladas mas não carregadas, 
#                   Necessário usar o comando libray()
# 3) contributed  : pacotes que não são instalados automaticamente 
#                   usa o comando install.package()
####################################################################


# Instalar Pacotes contributed

# Instalar um Pacote
install.packages("tidyverse")

# Instalar vários PAcotes
install.packages(c("data.table","janitor","DescTools","devtools",
                   "rmarkdown","knitr","tidyvere"))


# Ativar Pacotes
library(tidyverse)

# Desativar Pacotes
detach("package:tidyverse", unload = TRUE)

############### Conjunto de Pacote tidyverse #####################
# 1) readr:   versão 1.4.0 => importação e leitura de arquivos de dados
# 2) dplyr:   versão 1.0.5 => manipulação de dataframes
# 3) tidyr:   versão 1.1.3 => organização de dataframe
# 4) ggplot2: versãp 3.3.3 => visualização de dados, produção de gráficos
# 5) tibble:  versão 3.1.0 => estruturação de dados  
# 6) purr:    versão 0.3.4 => manipulação de vetores e listas
# 7) forcats: versão 0.5.1 => manipulação de dados categóricos
# 8) stringr: versão 1.4.0 => manipulação de string
##################################################################


################ OPerações Matemáticas do pacote base #############
# Criação de Vetores
x <- c(1,2,2)
y <- c(0.5,1,1)
z <- c(0.5,1,1)


# Criação de Matrizes
# 1) por coluna
matriz1 <- cbind(x,y,z)

# 2) por linha
matriz2 <- rbind(x,y,z)

# tabelas de dados
tabela <- data.frame(x,y,z)
View(tabela)

# estrutura do objeto
str(matriz)


# Funções Estatística Básicas
# coeficiente de correlação
cor(x,y,) 

# Média simples
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

# variância
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


# A opção From Text(readr) permite ler arquivos do tipo csv (separado por virgula)
# 1) No próprio Computador 
# 2) Como estar hospedado em uma URL

# No R4.0 o separador decimal padrão é o ponto.
# Para saber qual é o separador, basta abrir o arquivo em um bloco de notas


#Primeiro Link
# http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv
# No primeiro link, os dados estão separados por ponto e vírgula + seprarador decimal:vírgula

#Segundo Link
# http://raw.githubusercontent.com/Lucianea/Alta/master/vendas1.csv
# No segundo link, os dados estão separados por vírgula + seprarador decimal:ponto.


# O comando read.csv ou read.cvs2 são funções nativas do R
# separador ponto e vírgula: read.csv2
# separador vírgula: read.csv


# Leitura de Banco de Dados via URL

# Leitura da Base de Dados
Vendas_A = read.csv2("http://raw.githubusercontent.com/Lucianea/Alta/master/vendas.csv")
Vendas_B = read.csv("http://raw.githubusercontent.com/Lucianea/Alta/master/vendas1.csv")


# Visualizar as 6 primeiras linhas
head(Vendas_A)
View(Vendas_A)
#########################################################################


####### Manipulação de Dados com o sistema tidyverse ##################
# Pacotes magrittr + dplyr

library(magrittr)
library(dplyr)

# Selecionar 3 colunas de variáveis
# comando select
Vendas_A %>%
  dplyr:: select(filial, quinzena, valor_compra) 


# Filtrar a filial A 
# comando filter
Vendas_A %>%
  dplyr:: filter(filial == "A")


# Filtrar a filial A OU n_iten igual a 1
Vendas_A %>%
  dplyr:: filter(filial == "A" | n_itens == 1)

# Filtrar a filial B E quinzena 2
Vendas_A %>%
  dplyr:: filter(filial == "B" & quinzena == 2)

# Organizar os dados de forma crescente
# comando arrange

# crescente
Vendas_A %>%
  dplyr:: arrange(n_itens)

# Decrescente
Vendas_A %>%
  dplyr:: arrange(desc(n_itens))


# Decrescente de n_itens E ordema alfabética de filial

Vendas_A %>%
  dplyr:: arrange(-n_itens) %>%
  dplyr:: arrange(filial)

# decrescente de n_itens e ao mesmo tempo ordem alfabetica de filial
Vendas_A %>%
  dplyr:: arrange(-n_itens, filial) 



