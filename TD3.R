install.packages("readxl")
setwd("C:/Users/msylvie/Downloads")
library(readxl)
pokemon <- read_excel(path = "C:/Users/msylvie/Downloads/pokemon.xlsx",sheet = "pokemon")
#cours ifelse(),cut(),is.na()
summary(pokemon)
nrow(pokemon)
ncol(pokemon)
dim(pokemon)
#as.factor()=> transfromation de type pour les variable qualitative
pokemon$is_legendary <-as.factor(pokemon$is_legendary)
pokemon$generation <-as.factor(pokemon$generation)
pokemon$type <-as.factor(pokemon$type)
#Exercice 2 - Création de colonne
#1.
med = median(pokemon$attack)
pokemon$attack_group = ifelse(pokemon$attack >= med, "attack+","attack-")
pokemon$attack_group <-as.factor(pokemon$attack_group)
summary(pokemon$attack_group)
View(pokemon)
#2.
pokemon$water_fire = ifelse(pokemon$type %in% c("water","fire"),"yes","no" )
pokemon$water_fire =as.factor(pokemon$water_fire)
summary(pokemon$water_fire)
#3.
quan_attack= quantile(pokemon$attack,0.75)
quan_def= quantile(pokemon$defense, 0.75)
quan_speed= quantile(pokemon$speed,0.75)
pokemon$best = ifelse(pokemon$attack > quan_attack &
                        pokemon$defense > quan_def &
                        pokemon$speed > quan_speed , "yes","no")
pokemon$best <-as.factor(pokemon$best)
summary(pokemon$best)

requete= subset(pokemon,is.na(pokemon$weight_kg))
View(requete)
# pour avoir l'inverse = "!" different de et pas "-"                
requete= subset(pokemon,!is.na(pokemon$weight_kg))
View(requete)

med_w = median(pokemon$weight_kg,na.rm=TRUE)
med_h= median(pokemon$height_m,na.rm=TRUE)
pokemon$weight_kgNa = ifelse(is.na(pokemon$weight_kg) , 
                             med_w ,
                             pokemon$weight_kg)
pokemon$height_mNA = ifelse(is.na(pokemon$height_m) , 
                            med_h,
                            pokemon$height_m)
#exam!
pokemon$weight_group = cut(pokemon$weight_kg,
                           breaks = 3,
                           labels = c("léger","moyen","lourd"))
height_m_group =cut(pokemon$height_m)
#exam une question sur agrégation
# "~"= en fonction de 
aggregate(x = attack ~ type, 
          data = pokemon,
          FUN = function(x) mean(x))
#regroupement par type