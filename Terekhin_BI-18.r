#Для начала, необходимо установить пакеты и подключить библиотеки
install.packages('ggplot2')
install.packages('tidyverse')

library(ggplot2)
library(tidyverse)

#Затем, подключить данные
table1 <- read.csv("RU_Electricity_Market_PZ_dayahead_price_volume.csv", header = TRUE, sep = ",")
data1 <- read.csv("112.csv", header = TRUE, sep = ",")

#Наименования
names(table1)

#Авторегрессия
set.seed(49)
y <- arima.sim(n = nrow(table1), table1)
plot(y)

#График
ggplot(data = table1)+
  geom_point(alpha = 1/2, mapping = aes(x= timestep, y = price_eur, color = consumption_eur))

ggplot(data = table1)+
  geom_point(alpha = 1/4, mapping = aes(x= consumption_eur, y = price_eur))