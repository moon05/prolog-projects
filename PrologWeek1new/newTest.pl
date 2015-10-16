male(i).
male(dad).
male(baby).
male(onrun).
female(widow).
female(redhair).


%i married the widow
married_to(widow,i).

%dad married redhair
married_to(redhair,dad).

%parents to baby
parent_to(widow,baby).

%parents to onrun
parent_to(redhair,onrun).

parent_to(dad,i).

parent_to(widow,redhair).


husband(X,Y):-
	(male(X),
		(married_to(Y,X))
	).


wife(X,Y):-
	(female(X),
		(married_to(X,Y))
	).


son(X,Y):-
	(male(X),
		(
			parent_to(Y,X)
		);
		(
			male(Y),
			married_to(Z,Y),
			parent_to(Z,X)
		)
	).


daughter(X,Y):-
	(female(X),
		((
			parent_to(Y,X)
		);
		(
			male(Y),
			married_to(Z,Y),
			parent_to(Z,X)
		))
	).


father(X,Y):-
	(male(X),
		(
			(parent_to(Z,Y),
			married_to(Z,X)
			);
			(
				parent_to(X,Y)
			);
			(
				female(Y),
				married_to(Y,Z),
				son(Z,X)
			);
			(
				male(Y),
				married_to(Z,Y),
				daughter(Z,X)
			)
		)
	).


mother(X,Y):-
	(female(X),
		(
		(	(parent_to(X,Y))
		);
		(
			female(Y),
			married_to(Y,Z),
			son(Z,X)
		);
		(
			male(Y),
			married_to(Z,Y),
			daughter(Z,X)
		)
		)
	).


grandfather(X,Y):-
	(male(X),
		(
			(
			parent_to(Z,Y),
			father(X,Z)
			);
			(
			parent_to(Z,Y),
			married_to(U,Z),
			father(X,U)
			)
		)
	).

grandmother(X,Y):-
	(female(X),
		(	
			(parent_to(Z,Y),
			mother(X,Z)
			)

		)
	).


grandchild(X,Y):-
	(
		grandmother(Y,X);
		grandfather(Y,X)
	).

brother(X,Y):-
	(
		(	parent_to(Z,Y),
			parent_to(Z,X)
		);

		(
			female(Y),
			(
				parent_to(Z,X),
				parent_to(U,Y),
				married_to(Z,U)
			)
		)
	).
