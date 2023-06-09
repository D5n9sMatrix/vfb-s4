/'
There are various precise ways of deﬁning vectors and matrices, but we
will generally think of them merely as linear or rectangular arrays of numbers,
or scalars, on which an algebra is deﬁned. Unless otherwise stated, we will as-
sume the scalars are real numbers. We denote both the set of real numbers
and the ﬁeld of real numbers as IR. (The ﬁeld is the set together with the
two operators.) Occasionally we will take a geometrical perspective for vec-
tors and will consider matrices to deﬁne geometrical transformations. In all
contexts, however, the elements of vectors or matrices are real numbers (or,
more generally, members of a ﬁeld). When the elements are not members of
a ﬁeld (names or characters, for example) we will use more general phrases,
such as “ordered lists” or “arrays”.
'/
Declare Function Arrays ( ByRef Geometrical As Integer, ByRef Numerical As Integer, ByRef Matrix  As Integer) As Integer

Type Geometrical
   Dim GeometricalTypes As Integer
End Type 

Type Numerical
    Dim NumericalEvent As Integer
End Type 

Type Matrix 
    Dim MatrixObj As Integer
End Type 


Type		widget		Extends object
Protected:
as Integer		X
as Integer		Y
End Type

Type		container		Extends widget
Protected:
as Boolean	B
End Type

Type        button         	 Extends widget
as Integer  	C
Declare	 	sub Create(a as container ptr)
End Type

Sub		button.Create(Byval owner as container Ptr)
owner->X = 10
owner->Y = 10
owner->B = False
End Sub

End
