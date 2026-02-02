#notes cours
#read.csv()==Lit un fichier CSV et retourne un dataframe.
#subset() == Retourne un sous-ensemble d'un objet (par exemple, un dataframe) en fonction de certaines conditions.
#rbind()==Ajoute des lignes à un dataframe existant en les liant par les colonnes.
#########
###########

# Exercice sur les Fonctions en R
# 1.Afficher le jeu de données iris puis afficher la classe de l'objet iris.
data(iris)
class(iris)

View(iris)
nrow(iris)
ncol(iris)
colnames(iris)
summary(iris)
#filtre afficher que Sepal.Length et Species.
iris[ , c("Sepal.Length","Species")]

iris[c(100,103,105), ]

iris[c(50:100),]

mean(iris$Sepal.Length)
median(iris$Sepal.Length)
sd(iris$Petal.Length)
quantile(iris$Petal.Length, probs = seq(from = 0.1, to = 0.9, by =0.1))
#Exercice 2 - Import/Exporter un dataframe

anime= read.csv("C:/Users/msylvie/Downloads/anime.csv",header= TRUE, dec= ".",sep = ",")
View(anime)

manga= read.csv("C:/Users/msylvie/Downloads/manga.csv",header= TRUE, dec= ".",sep = ",")
View(manga)
#dim==Retourne les dimensions (nombre de lignes et de colonnes) d'un objet (par exemple, un dataframe ou une matrice).
dim(manga)
dim(anime)
#moyenne
mean(manga$Score)
mean(anime$Score)
#total
sum(manga$Vote)
sum(anime$Vote)

#ecart-type
sd(manga$Score)
sd(anime$Score)
#Décile
quantile(manga$Score, probs = seq(from = 0.1, to = 0.9, by =0.1))
quantile(anime$Score, probs = seq(from = 0.1, to = 0.9, by =0.1))

#Les fonctions subset(), table() et prop.table()
extraction1 = subset(manga, Score > 9)
nrow(extraction1)

extraction2= subset(manga, Vote>=200000)
nrow(extraction2)

extraction3= subset(manga, Vote>=200000 & Vote>=8)
nrow(extraction3)

extraction4 =subset(manga, Score >= 7 & Score <= 8)
nrow(extraction4)
#Filtre sur les Animes
effectifRating = table(anime$Rating)
print(effectifRating)
length(effectifRating)
prop.table(effectifRating)

extraction5 = subset(anime, Rating == "R - 17+ (violence & profanity)")
nrow(extraction5)

extraction6 = subset(anime, Rating == "R - 17+ (violence & profanity)" & Score>=8)
nrow(extraction6)

extraction7 = subset(anime, Rating != "R - 17+ (violence & profanity)")
nrow(extraction7)

extraction8 <- subset(anime, Rating %in% c("PG - Children","G - All Ages"))
nrow(extraction8)

extraction9 <- subset(anime,!Rating %in% c("PG - Children","G - All Ages"))
nrow(extraction9)


extraction10<- subset(anime,Score>= 10 | Vote > 400000)
nrow(extraction10)
