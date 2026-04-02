df = read.csv(file = "velov.csv",
              header = TRUE,
              sep = ";", 
              dec = "," )
summary(df)
class(df$status)
class(df$CodePostal)
df$status=as.factor(df$status)
df$CodePostal= as.factor(df$CodePostal)

df$bornes= ifelse(df$capacity != (df$bikes +df$stands),"ko","ok")
table(df$bornes)

hist(x =df$capacity,main="Distribution de la capacité de velos")
hist(x =df$capacity,main="Distribution de la capacité de velos", breaks = 6 )
hist(x =df$capacity,main="Distribution de la capacité de velos", breaks = 6 , col= "red")
hist(x =df$capacity,main="Distribution de la capacité de velos", breaks = 6 , col= "red", xlab = "capacité")

abline(h = 100, col = "blue", lty = 1)

hist(x = df$capacity, 
     main = "Distribution de \n la capacité des stations",
     col = "red",
     probability = TRUE,
     xlab = "Capacity",
     ylim = c(0,0.08))

lines(density(df$capacity),
      lty = 2,
      col = "blue",
      lwd = 4)

#Exercice 3 - Le boxplot
boxplot(df$capacity,
        main = "Boxplot de \n la capacité des stations")
boxplot(df$capacity,
        main = "Boxplot de \n la capacité des stations",
        horizontal = TRUE,
        outline = FALSE)

moy = mean(df$capacity, na.rm = TRUE)
points(moy, col = "red", pch = 15, cex = 2)
#La fonction par()

par(mfrow=c(1,2)) #fenêtre sur 1 ligne et 2 colonnes
#7ème
df7 = subset(df, CodePostal == "69007")
boxplot(x = df7$bikes, 
        main = "Boxplot nb vélos \n 69007",
        ylim = c(0,40))
#8ème
df8 = subset(df, CodePostal == "69008")
boxplot(x = df8$bikes, 
        main = "Boxplot nb vélos \n 69008",
        ylim = c(0,40))
#C'est plus simple d'analyser les deux graphiques si la borne des ordonnées est la même.
# On remarque que la disponibilité des stations est plus homogènes sur le 8ème.




