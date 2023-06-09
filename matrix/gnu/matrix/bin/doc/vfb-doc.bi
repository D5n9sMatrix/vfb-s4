/'
Basic Vector/Matrix Structure and Notation
Vectors and matrices are useful in representing multivariate numeric data,
and they occur naturally in working with linear equations or when expressing
linear relationships among objects. Numerical algorithms for a variety of tasks
involve matrix and vector arithmetic. An optimization algorithm to ﬁnd the
minimum of a function, for example, may use a vector of ﬁrst derivatives and
a matrix of second derivatives; and a method to solve a diﬀerential equation
may use a matrix with a few diagonals for computing diﬀerences.
'/
Declare Function Doc ( ByRef Vector As Integer, ByRef Matrix As Integer, ByRef Arithmetic As Integer ) As Integer

Type Vector
    Dim VectorTypes As Integer
End Type 

Type Matrix
    Dim MatrixEvent As Integer
End Type 

Type Arithmetic
    Dim ArithmeticObj As Integer
End Type 


Type Parent
    Protected:
        Dim As Integer I
        Static As Integer J
End Type
Dim As Integer Parent.J

Type Child1 Extends Parent
End Type

Type Child2 Extends Parent
    Declare Sub test(Byref c2 As Child2, Byref p As Parent, Byref c1 As Child1)
    Declare Static Sub stest(Byref c2 As Child2, Byref p As Parent, Byref c1 As Child1)
End Type

Sub Child2.test(Byref c2 As Child2, Byref p As Parent, Byref c1 As Child1)
    ' non-static protected member access from non-static member procedure
    I = 1       ' OK
    This.I = 2  ' OK
    c2.I = 3    ' OK, but should be NOK ?
    p.I = 4     ' OK, but should be NOK ?
    c1.I = 5    ' OK, but should be NOK ?

    ' static protected member access from non-static member procedure
    J = 1       ' OK
    This.J = 2  ' OK
    c2.J = 3    ' OK
    p.J = 4     ' OK
    c1.J = 5    ' OK
End Sub

Static Sub Child2.stest(Byref c2 As Child2, Byref p As Parent, Byref c1 As Child1)
    ' non-static protected member access from static member procedure
    c2.I = 3    ' OK, but should be NOK ?
    p.I = 4     ' OK, but should be NOK ?
    c1.I = 5    ' OK, but should be NOK ?

    ' static protected member access from static member procedure
    J = 1       ' OK
    c2.J = 3    ' OK
    p.J = 4     ' OK
    c1.J = 5    ' OK
End Sub

End 


