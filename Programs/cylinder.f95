PROGRAM cylinder
	IMPLICIT NONE
	
	REAL :: height, radius, volume
	REAL :: calc_cylinder_volume
	
	WRITE (*,*) "Program to compute volume of a cylinder"
	WRITE (*,"(A)",advance="no") "Enter height:"
	READ (*,*) height
	WRITE (*,"(A)",advance="no") "Enter radius:"
	READ (*,*) radius
	
	volume = calc_cylinder_volume(height,radius)
	WRITE (*,*) "Volume is", volume
	
END PROGRAM cylinder

REAL FUNCTION calc_cylinder_volume(height, radius)
	IMPLICIT NONE
	REAL, INTENT(IN) :: height
	REAL, INTENT(IN) :: radius
	REAL, PARAMETER :: PI = 3.1415927
	
	calc_cylinder_volume = height * PI * radius**2
	
	RETURN
	
END function calc_cylinder_volume