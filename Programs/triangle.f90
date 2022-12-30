!
! Program to compute the area of a triangle given 3 sides
! This program uses Heron's formula
! Written by Mark Terwilliger
! CS 410W - Assignment #XYZ
! January 11, 2022
!

PROGRAM triangle
	REAL :: a, b, c, s, areasq, area
	WRITE (*,*) "This program calculates the area of a triangle."
	WRITE (*,*) "Type in the lengths of the three sides."
	READ (*,*) a, b, c
	WRITE (*,*) "Check: you have entered the following lengths: "
	WRITE (*,*) a, b, c
	s = 0.5 * (a + b + c)
	areasq = s * (s - a) * (s - b) * (s - c)
	IF (areasq < 0.0) THEN
		WRITE (*,*) "ERROR: Invalid triangle."
	ELSE
		area = SQRT(areasq)
		WRITE (*,*) "The area of the triangle is ", area
	END IF
END PROGRAM triangle
