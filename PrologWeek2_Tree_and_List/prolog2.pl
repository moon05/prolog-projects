%Abdullah Al Mamun
%CSC 173
%Prolog Week 2


%count_nodes
%this is the basecase
count_nodes(leaf(A),0).

count_nodes(node(A,B),X):-
	(	count_nodes(A,Y),
	 	count_nodes(B,Z),
			X is 1+Y+Z
	).

%tree_leaf
%this is the basecase
%this is where it checks the element, not same it returns false
tree_leaf(leaf(A),X):-
	(	(A==X);
		false
	).

tree_leaf(node(A,B),X):-
	(
		tree_leaf(A,X);
		tree_leaf(B,X)
	).

%increment_tree
%this is the basecase
%this is where it does the incrementing
increment_tree(leaf(A),leaf(B)):-
	B is A+1.

increment_tree(node(A,B),node(C,D)):-
	(
		increment_tree(A,C),
		increment_tree(B,D)
	).


%subtree
%this is the basecase
subtree(leaf(A),X):-
	X = leaf(A).

%here it stores the nodes afterwards just displays it
subtree(node(A,B),X):-
	(
		(
		Y = node(A,B),
		(
		subtree(A,X);
		subtree(B,X);
		X = Y
		)

		)
	).



%list_length
%this is the basecase
list_length([],0).

list_length([H|T],X):-
	(
		list_length(T,Y),
		X is Y + 1

	).

%list_element
%this is the basecase
list_element([],X):-
	(
		false
	).
%this is where it checks the element, not same it returns false
list_element([H|T],X):-
	(
		(H==X;
		list_element(T,X)
		)

	).


%increment_list
%this is the basecase
increment_list([],[]).

%this is where it does the incrementing
increment_list([H|T],[X|Y]):-
	(
		(
			increment_list(T,Y),
			X is H+1

		)
		
	).


%list_last
%this is the basecase
list_last([X],X).

list_last([H|T],X):-
	(
		list_last(T,X)

	).


%list_suffix
%this is the basecase
list_suffix(X,X).

list_suffix([H|T],X):-
	(
		list_suffix(T,X)

	).


%list_concat
%this is the basecase
list_concat([],X,X).

list_concat([H|T],X,[H|NT]):-
	(
		list_concat(T,X,NT)

	).



%extra credit

list_prefix(X,X).
list_prefix([H|T],X):-
	(
		list_prefix(X,H)


	).

list_reverse([],[]).
list_reverse([H|T],X):-
	(
		list_reverse(T,NT),
		list_concat(NT,[H],X)

	).

is_element([X|NT],X).
is_element([H|T],X):-
	(
		is_element(T,X)

	).

del_duplicate([],[]):-
	!.
del_duplicate([H|T], X):-
	(
	is_element(T,H),
	del_duplicate(T,X),
	!
	).
del_duplicate([H|T],[X|Y]):-
	del_duplicate(T,Y).


