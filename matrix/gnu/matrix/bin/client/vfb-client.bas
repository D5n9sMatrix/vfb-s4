/'
Acknowledgments
I thank John Kimmel of Springer for his encouragement and advice on this
book and other books on which he has worked with me. I especially thank
Ken Berk for his extensive and insightful comments on a draft of this book.
I thank my student Li Li for reading through various drafts of some of the
chapters and pointing out typos or making helpful suggestions. I thank the
anonymous reviewers of this edition for their comments and suggestions. I also
thank the many readers of my previous book on numerical linear algebra who
informed me of errors and who otherwise provided comments or suggestions
for improving the exposition. Whatever strengths this book may have can be
attributed in large part to these people, named or otherwise. The weaknesses
can only be attributed to my own ignorance or hardheadedness.
'/

Declare Function Client ( ByRef Making As Integer, ByRef Books As Integer,  ByRef Previous As Integer ) As Integer

Type Making
    Dim MakingTypes As Integer
End Type 

Type Books
    Dim BooksEvent As Integer
End Type

Type Previous
    Dim PreviousObj As Integer
End Type 


TYPE AddNumbers AS FUNCTION(BYVAL a AS INTEGER, BYVAL b AS INTEGER)AS INTEGER

'' Note: under DOS you must specify "mydll.dxe", differently from Windows or Linux

VAR EpsonLib = DYLIBLOAD("epson.dxe")
DIM AS AddNumbers EpsonAdd
IF EpsonLib THEN
  EpsonAdd = DYLIBSYMBOL(EpsonLib, "_AddNumbers")
  IF 0 = EpsonAdd THEN
    PRINT "Could not get AddNumbers()'s address from EpsonLib library"
    DYLIBFREE EpsonLib
    END 1
  END IF
ELSE
  PRINT "Cannot load the EpsonLib dynamic library"
  SLEEP
  END 1
END IF

VAR NfcLib = DYLIBLOAD("nfc.dxe")
DIM AS AddNumbers NfcAdd
IF NfcLib THEN
  NfcAdd = DYLIBSYMBOL(NfcLib, "_AddNumbers")
  IF 0 = NfcAdd THEN
    PRINT "Could not get AddNumbers()'s address from NfcLib library"
    DYLIBFREE NfcLib
    DYLIBFREE EpsonLib
    END 1
  END IF
ELSE
  DYLIBFREE EpsonLib
  PRINT "Cannot load the NfcLib dynamic library"
  SLEEP
  END 1
END IF


RANDOMIZE( TIMER( ) )

DIM AS INTEGER x = RND * 10
DIM AS INTEGER y = RND * 10

PRINT x; " +"; y; " ="; EpsonAdd(x, y)
PRINT x; " +"; y; " ="; NfcAdd(x, y)

DYLIBFREE EpsonLib
DYLIBFREE NfcLib

End 
