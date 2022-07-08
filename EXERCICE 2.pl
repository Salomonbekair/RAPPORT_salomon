 /*departement/2*/
departement(ventes,antoine).
departement(ventes,xavier).
departement(direction,boss).
departement(achats,lucie).
departement(achats,anne).
departement(achats,jerome).
departement(achats,etienne).

 /* directeur/2 */
directeur(ventes,xavier).
directeur(ventes,boss).
directeur(direction,boss).
directeur(achats,boss).
directeur(achats,lucie).
directeur(achats,lucie).
directeur(achats,anne).

 
relation(antoine,ventes,X):-directeur(ventes,X),X=xavier.
relation(xavier,ventes):-directeur(ventes,X),X=boss.
relation(boss,direction):-directeur(direction,X),X=boss.
relation(lucie,achats):-directeur(achats,X),X=boss.
relation(anne,achats):-directeur(achats,X),X=lucie.
relation(jerome,achats):-directeur(achats,X),X=lucie.
relation(etienne,achats):-directeur(achats,X),X=anne.

/* employe_valide/1 : la structure de l'entreprise étant hiérarchique, on doit pouvoir 
remonter depuis n'importe quel employé vers le boss.*/
employe_valide(antoine).
employe_valide(xavier).
employe_valide(boss).
employe_valide(lucie).
employe_valide(anne).
employe_valide(jerome).
employe_valide(etienne).

boss_valide(xavier).
boss_valide(boss).
boss_valide(boss).
boss_valide(boss).
boss_valide(lucie).
boss_valide(lucie).
boss_valide(anne).

relat(antoine,X):-boss_valide(X),X=xavier.
relat(xavier,X):-boss_valide(X),X=boss.
relat(boss,X):-boss_valide(X),X=boss.
relat(lucie,X):-boss_valide(X),X=boss.
relat(anne,X):-boss_valide(X),X=lucie.
relat(jerome,X):-boss_valide(X),X=lucie.
relat(etienne,X):-boss_valide(X),X=anne.


/* salaire/2 : donne le salaire d'un employé */
salaire(antoine,200000).
salaire(xavier,300000).
salaire(boss,600000).
salaire(lucie,280000).
salaire(anne,200000).
salaire(jerome,200000).
salaire(etienne,40000).

/*  salaire_reel/2 : donne le salaire d'un employé en ajoutant au salaire de base un 
bonus, en utilisant les règles suivantes : 1/ tous les employés présents depuis 5 ans ou 
plus ont un bonus de 50000FCFA. 2/ Aucune personne ne peut gagner plus que son chef 
(attention le cas du boss est évidemment spécial). */
salaire_reel(antoine,X):-salaire_base(antoine,X).
salaire_reel(boss,650000):-salaire_base(antoine,X).
salaire_reel(anne,250000):-salaire_base(antoine,X).
salaire_reel(jerome,250000):-salaire_base(antoine,X).





