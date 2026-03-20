#La commande function()
salaire_net_cadre = function(salaire_brut=2500, temps_travail= 1) {
  if (!is.numeric(salaire_brut)){return("Erreur: salaire brut doit être une valeur numeric")}
  if(!is.numeric(temps_travail)){return("le temps de travail doit doit être une valeur numérique")}
  
  salaire_net_avant_impot= salaire_brut *0.75
return(salaire_net_avant_impot)}

salaire_net_cadre(salaire_brut = 3000, temps_travail = 0.8)
#La commande if() {}
if (!is.numeric(salaire_brut)){return("Erreur: salaire brut doit être une valeur numeric")}
salaire_net_cadre(salaire_brut = "2000€")
salaire_net_cadre(salaire_brut = 2000)

