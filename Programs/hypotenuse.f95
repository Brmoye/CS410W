PROGRAM triangle
	IMPLICIT NONE
	
	REAL :: side1, side2, hypotenuse
	
	WRITE (*,*) "Program to compute hypotenuse of right triangle"
	WRITE (*,"(A)",advance="no") "Enter side 1:"
	READ (*,*) side1
	WRITE (*,"(A)",advance="no") "Enter side 2:"
	READ (*,*) side2
	
	CALL calc_hypotenuse(side1,side2,hypotenuse)
	WRITE (*,*) "Hypotenuse is", hypotenuse
	
END PROGRAM triangle

SUBROUTINE calc_hypotenuse(side_1, side_2, the_hypotenuse)
	IMPLICIT NONE
	REAL, INTENT(IN) :: side_1
	REAL, INTENT(IN) :: side_2
	REAL, INTENT(OUT) :: the_hypotenuse
	
	REAL :: temp
	
	temp = side_1**2 + side_2**2
	the_hypotenuse = SQRT(temp)
	
END SUBROUTINE calc_hypotenuse