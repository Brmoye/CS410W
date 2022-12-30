!
! Program calculates the cost for printing a specified number of copies
! Written by Brian Moye
! CS 410W - Assignment #4
! January 19, 2022
!

PROGRAM copyCost
    IMPLICIT NONE

    INTEGER :: numCopies
	REAL :: makeCopies, totalPrice
    
    character(len = 50) :: customerName

    print *, "Please enter your name: "
    read (*,'(A)') customerName

    print *, "Please enter how many copies you need:"
    read (*,*) numCopies

    totalPrice = makeCopies(numCopies)
    
	WRITE (*,"(A11)",ADVANCE='NO') "Thank you, "
	WRITE (*,"(A50)") customerName
	WRITE (*,"(A5)",ADVANCE='NO') "Your "
	WRITE (*,"(i4)",ADVANCE='NO') numCopies
	WRITE (*,"(A19)",ADVANCE='NO') " copies will cost: "
	WRITE (*,"(f5.2)",ADVANCE='NO') totalPrice

END PROGRAM copyCost

!
! Function to calculate the price of the given number of copies based on pre-set prices.
!
REAL FUNCTION makeCopies(numCopies)
	IMPLICIT NONE
	INTEGER, INTENT(IN) :: numCopies
	REAL, PARAMETER :: FIRST200PRICE = 0.10
	REAL, PARAMETER :: AFTER200PRICE = 0.05
	
	IF (numCopies < 200) THEN
        makeCopies = numCopies * FIRST200PRICE
    ELSE
        makeCopies = (numCopies - mod(numCopies, 200)) * FIRST200PRICE + ((numCopies - 200) * AFTER200PRICE)
    END IF
	
	RETURN
	
END function makeCopies