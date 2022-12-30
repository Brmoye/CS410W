PROGRAM arrayFun

	IMPLICIT NONE
	INTEGER :: i
	i = 0
	REAL :: data(5)
	
	print *, "This is a program to demonstrate arrays"
	
	data(1) = 45.6
	data(2) = 61.3
	
	print *, "What is data #3?"
	READ (*,*) data(3)
	
	DO i = 1, 3
		print *, i, data(i)
	END DO
	
END PROGRAM arrayFun