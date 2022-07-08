/*prédicats hommes*/
homme(pierre). 
homme(jean).
homme(simon).
homme(thierry).
homme(bruno).
homme(auguste).
homme(eric).
homme(chritian).
homme(marcel).
homme(gerard).
homme(franck).
homme(charles).

/*prédicats femmes*/
femme(anne). 
femme(marie).
femme(martine).
femme(brigitte).
femme(noemie).
femme(denise).
femme(rolande).
femme(augustine).
femme(solange).
femme(christine).
femme(corinne).
femme(gisele).
femme(monique).
femme(sonya).
femme(amandine).

/*pierre est le parents de y*/
parent(pierre,jean).
parent(pierre,marie).
parent(pierre,martine).
parent(pierre,simon).
parent(pierre,thierry).
parent(pierre,brigitte).

/*anne est le parents de y*/
parent(anne,jean).
parent(anne,marie).
parent(anne,martine).
parent(anne,simon).
parent(anne,thierry).
parent(anne,brigitte).

/*jean est le parents de denise*/
parent(jean,denise).

/*marie est le parents de y*/
parent(marie,denise).
parent(marie,bruno).
parent(marie,noemie).
parent(marie,rolande).
parent(marie,auguste).
parent(marie,augustine).
parent(marie,eric).

/*simon est le parents de y*/
parent(simon,bruno).
parent(simon,noemie).
parent(simon,rolande).
parent(simon,auguste).
parent(simon,augustine).
parent(simon,eric).

/*bruno est le parents de y*/
parent(bruno,chritian).
parent(bruno,solange).
parent(bruno,marcel).

/*noemie est le parents de y*/
parent(noemie,chritian).
parent(noemie,solange).
parent(noemie,marcel).

/*rolande est le parents de y*/
parent(rolande ,christine).
parent(rolande ,franck).
parent(rolande ,gerard).

/*auguste est le parents de y*/
parent(auguste ,christine).
parent(auguste ,franck).
parent(auguste ,gerard).

/*christian et solange sont les parents de gisele*/
parent(christian ,gisele).
parent(solange,gisele).

/*franck et corinne sont les parents de charles*/
parent(franck ,charles).
parent(corinne,charles).

/*gerard est le parents de y*/
parent(gerard ,monique).
parent(gerard ,sonya).
parent(gerard ,amandine).

/*christine est le parents de y*/
parent(christine ,monique).
parent(christine ,sonya).
parent(christine ,amandine).

/*pierre est le parents de y*/
pere(pierre,jean).
pere(pierre,marie).
pere(pierre,martine).
pere(pierre,simon).
pere(pierre,thierry).
pere(pierre,brigitte).

/*anne est le parents de y*/
mere(anne,jean).
mere(anne,marie).
mere(anne,martine).
mere(anne,simon).
mere(anne,thierry).
mere(anne,brigitte).

/*jean est le parents de denise*/
pere(jean,denise).

/*marie est le parents de y*/
mere(marie,denise).
mere(marie,bruno).
mere(marie,noemie).
mere(marie,rolande).
mere(marie,auguste).
mere(marie,augustine).
mere(marie,eric).

/*simon est le parents de y*/
pere(simon,bruno).
pere(simon,noemie).
pere(simon,rolande).
pere(simon,auguste).
pere(simon,augustine).
pere(simon,eric).

/*bruno est le parents de y*/
pere(bruno,chritian).
pere(bruno,solange).
pere(bruno,marcel).

/*noemie est le parents de y*/
mere(noemie,chritian).
mere(noemie,solange).
mere(noemie,marcel).

/*rolande est le parents de y*/
mere(rolande ,christine).
mere(rolande ,franck).
mere(rolande ,gerard).

/*auguste est le parents de y*/
pere(auguste ,christine).
pere(auguste ,franck).
pere(auguste ,gerard).

/*christian et solange sont les parents de gisele*/
pere(christian ,gisele).
mere(solange,gisele).

/*franck et corinne sont les parents de charles*/
pere(franck ,charles).
mere(corinne,charles).

/*gerard est le parents de y*/
pere(gerard ,monique).
pere(gerard ,sonya).
pere(gerard ,amandine).

/*christine est le parents de y*/
mere(christine ,monique).
mere(christine ,sonya).
mere(christine ,amandine).




/* X est un parent de Y, pere ou mere */
parent(X,Y) :- mere(X,Y).
parent(X,Y) :- pere(X,Y). 

/* X est le fils de Y */ 
fils(X,Y) :- mere(Y,X),homme(X).
fils(X,Y) :- pere(Y,X),homme(X).

/* X est la fille de Y */ 
fille(X,Y) :- mere(Y,X),femme(X).
fille(X,Y) :- pere(Y,X),femme(X).

/* X est l'enfant de Y */ 
enfant(X,Y) :- mere(Y,X).
enfant(X,Y) :- pere(Y,X).

/* X est le frere de Y */
frere(X,Y) :- homme(X), pere(P,X), pere(P,Y), mere(M,X), mere(M,Y), X \== Y.
/* X est la soeur de Y */
soeur(X,Y) :- femme(X), pere(P,X), pere(P,Y), mere(M,X), mere(M,Y), X \== Y.

/* X est grand-parent de Y */ 
grand-parent(X,Y) :- parent(X,Z), parent(Z,Y).
/* X est le grand-pere de Y */ 
grand-pere(X,Y) :- parent(P,Y), pere(X,P).
/* X est la grand-mere de Y */ 
grand-mere(X,Y) :- parent(P,Y), mere(X,P).

/* X tante de Y */ 
tante(X,Y) :- femme(X),parent(Z,Y),soeur(X,Z).

/* X oncle de Y */ 
oncle(X,Y) :- homme(X),parent(Z,Y),frere(X,Z).

/* X cousin de Y */ 
cousin(X,Y) :- homme(X),oncle(Z,X),enfant(Y,Z).

/* X cousine de Y */ 
cousine(X,Y) :- femme(X),tante(Z,X),enfant(Y,Z).

/* X ancetre de Y */ 
ancetre(X,Y) :- parent(X,Y).
ancetre(X,Y) :- parent(X,Z),ancetre(Z,Y).

