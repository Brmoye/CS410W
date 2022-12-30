!
! Program calculates the number of calories lost doing specific activities at hour-long intervals
! Written by Brian Moye
! CS 410W - Assignment #4
! January 19, 2022
!

PROGRAM exercise
    IMPLICIT NONE

    REAL :: cyclingHours, runningHours, swimmingHours, poundsLost, caloriesBurned

    PRINT *, "Please enter the hours spent cycling:"
    READ (*,*) cyclingHours
	
	PRINT *, "Please enter the hours spent running:"
    READ (*,*) runningHours
	
	PRINT *, "Please enter the hours spent swimming:"
    READ (*,*) swimmingHours

	CALL calcCalories(cyclingHours, runningHours, swimmingHours, caloriesBurned, poundsLost)

    WRITE (*,"(A10)",ADVANCE='NO') "You burned"
	WRITE (*,"(f9.2)",ADVANCE='NO') caloriesBurned
	WRITE (*,"(A18)",ADVANCE='NO') " calories and lost"
	WRITE (*,"(f6.2)",ADVANCE='NO') poundsLost
	WRITE (*,"(A8)") " pounds!"

END PROGRAM exercise

!
! Subroutine to calculate the calories burned and pounds lost while doing specific exercises.
!
SUBROUTINE calcCalories(cyclingHours, runningHours, swimmingHours, caloriesBurned, poundsLost)
	IMPLICIT NONE
	REAL, INTENT(IN) :: cyclingHours, runningHours, swimmingHours
	REAL, INTENT(OUT) :: poundsLost, caloriesBurned
	INTEGER, PARAMETER :: CYCLING_CALS_BURNED = 225
    INTEGER, PARAMETER :: RUNNING_CALS_BURNED = 450
    INTEGER, PARAMETER :: SWIMMING_CALS_BURNED = 275
	INTEGER, PARAMETER :: CALORIES_IN_POUND = 3800
	
	caloriesBurned = (cyclingHours * CYCLING_CALS_BURNED) + (runningHours * RUNNING_CALS_BURNED) 
	caloriesBurned = caloriesBurned + (swimmingHours * SWIMMING_CALS_BURNED)
	
	poundsLost = caloriesBurned / CALORIES_IN_POUND
	
END SUBROUTINE calcCalories