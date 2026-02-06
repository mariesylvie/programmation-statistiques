setwd("C:/Users/msylvie/Downloads")
df= read.csv("fao.csv", header=TRUE, dec = ",", sep=";")
#Attention Bien lire le dictionnaire des données 
summary(df)
nrow(df)
# na.rm=TRUE gestion des valeurs manquantes pour les calculs
mean(df$Dispo_alim, na.rm=TRUE)
sum(df$Population,na.rm=TRUE)
sd(df$Export_viande, na.rm = TRUE)
sd(df$Import_viande,na.rm=TRUE)
median(df$Prod_viande, na.rm = TRUE)
quantile(df$Dispo_alim,na.rm=TRUE)
#centiles 
quantile(df$Import_viande, seq(0,1,0.01))
#df$Population : on prend la colonne Population du data frame df
#order() : renvoie les indices qui permettent de trier cette colonne par ordre croissant
#f[rang, ] :on réordonne les lignes du data frame df selon rang
#la virgule , signifie “toutes les colonnes”
#head(..., n = 5) :on garde les 5 premières lignes après le tri
rang = order(df$Population)
resultat = head(df[ rang , ], n = 5)
View(resultat) #Les 5 lignes de df avec les plus petites populations

rang = order(df$Population, decreasing = TRUE)
resultat = head(df[ rang , ], n = 5)
View(resultat)

rang = order(df$Prod_viande, decreasing = TRUE)
resultat = head(df[ rang , ], n = 5)
View(resultat)
# rang= order nous donne les indice et (df[ rang , ] nous récup les données réels 
rang = order(df$Import_viande, decreasing = TRUE)
resultat = head(df[ rang , ], n = 5)
View(resultat)
#subset() sert à sélectionner une partie d’un data frame :
#certaines lignes (avec une condition)
#et/ou certaines colonnes
resultat = subset(df, Dispo_alim>=2300)
View(resultat)
nrow(resultat)
# & pour ajouter des flitre et | c'est un or si plusieurs flitre ()
#à l'examen
resultat = subset(df, Dispo_alim > 3500  & Import_viande > 1000)
View(resultat)

resultat = subset(df, Nom %in% c("France","Belgique"))
View(resultat)

df$Part_export<-df$Export_viande/df$Prod_viande
