bodies= read.csv("C:/Examens/bodies_karts.csv",header =TRUE,dec=",",sep =";")
tires=read.csv("C:/Users/msylvie/Downloads/tires.csv",header =TRUE,dec=",",sep ="\t")
gliders=read.csv("C:/Users/msylvie/Downloads/gliders.csv",header =TRUE,dec=".",sep ="|")
drivers=read.csv("C:/Users/msylvie/Downloads/drivers.csv",header =TRUE,dec=",",sep =";")
#getwd()==Retourne le répertoire de travail actuel.
#setwd()== Change le répertoire de travail actuel.

#Changer le répertoire courant 
setwd(dir = "C:/Users/msylvie/Desktop")
getwd()
#afficher la dimension (ligne/colonne)
dim(bodies)
dim(tires)
dim(gliders)
dim(drivers)
#un résumé des données
summary(bodies)
summary(tires)
summary(gliders)
summary(drivers)
#utiliser $ pour récupérer la colonne
plot(x = drivers$Weight,
     y = drivers$Acceleration, 
     main = "Drivers : Weight / Acceleration")
covariance= cor(x =drivers$Weight , y = drivers$Acceleration)

covXY = cov(x = drivers$Weight,
            y = drivers$Acceleration)
sX = sd(drivers$Weight)
sY = sd(drivers$Acceleration)
print(covXY / (sX*sY))
#le coéfficient de corrélation = echelle de 0 à 1 si les données sont proche mais peut être négatif

#coefficient de détermination
coefCorr = cor(x = drivers$Weight,
               y = drivers$Acceleration)
coefDeter = coefCorr^2
print(coefDeter)
#ici entre 0 et 1 . plus près de 1 = corrélation. ici c'est au carré donc positif

matriceCor = cor(drivers[ , - 1])
matriceCor = round(matriceCor , 2)
View(matriceCor)

install.packages("corrplot")

library(corrplot)
corrplot(matriceCor,method="circle")

matriceCor = round(cor(tires[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)
matriceCor = round(cor(bodies[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)
matriceCor = round(cor(gliders[ , - 1]),1)
corrplot(matriceCor, method="color",  
         type="upper", order="hclust", 
         addCoef.col = "black", # Ajout du coefficient de corrélation
         tl.col="black", tl.srt=45, #Rotation des étiquettes de textes
         # Cacher les coefficients de corrélation sur la diagonale
         diag=FALSE 
)

#Exercice 3 - Manipulation de data frame

resultat = drivers[ , c("Driver" , "Weight")]
View(resultat)

resultat1= drivers[1:10,c("Driver" , "Weight")]
View(resultat1)
#3.Créer un object resultatsans les colonnes 5, 7 et 9.
resultat3= drivers[,-c(5,7,9)]
View(resultat3)
