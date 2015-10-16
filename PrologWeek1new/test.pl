male(i).
male(dad).
male(baby).
female(widow).
female(redhair).



%i is dads son
son_of(i,dad).

%i married the widow
wife_of(widow,i).

%redhair is widows daughter
daughter_of(redhair,widow).

%dad married redhair
wife_of(redhair,dad).

%i with widow had a male baby
son_of(baby,i).
son_of(baby,widow).

%dad with redhair had onrun
son_of(onrun,dad).
son_of(onrun,redhair).




husband_of(X,Y):-
	wife_of(Y,X).

father_of(X,Y):-
	(
	male(X),
		((
			son_of(Y,X);
			daughter_of(Y,X)
		);
		(
		female(Y),
			(
				husband_of(Z,Y),
				son_of(Z,X)
			)
		);
		(
		male(Y),
			(
				wife_of(Z,Y),
				daughter_of(Z,X)
			)

		);
		(
			son_of(Z,X),
			husband_of(Z,Y)
		);
		(
			daughter_of(Z,X),
			wife_of(Z,Y)
		)
		)
	).

mother_of(X,Y):-
	(
	female(X),
		((
			son_of(Y,X);
			daughter_of(Y,X)
		);
		(
		female(Y),
			(
				husband_of(Z,Y),
				son_of(Z,X)
			)
		);
		(
		male(Y),
			(
				wife_of(Z,Y),
				daughter_of(Z,X)
			)

		);
		(
			son_of(Z,X),
			husband_of(Z,Y)
		);
		(
			daughter_of(Z,X),
			wife_of(Z,Y)
		)
		)
	).






grandfather_of(X,Y):-
	(
	father_of(X,Z),
		(son_of(Y,Z);
		daughter_of(Y,Z)
		)
	).





grandmother_of(X,Y):-
	(
	mother_of(X,Z),
	 (son_of(Y,Z);
	 	daughter_of(Y,Z))
	).

grandchild_of(X,Y):-
	(
	grandmother_of(Y,X);
	grandfather_of(Y,X)
	).

brother_of(X,Y):-
	(
	father_of(Z,Y),
	son_of(X,Z)
	).


uncle_of(X,Y):-
	(
	father_of(Z,Y),
	brother_of(X,Z)
	).

# aunt_of(X,Y):-
# 	(
# 	father_of(Z,Y),
# 	da
# 	).



