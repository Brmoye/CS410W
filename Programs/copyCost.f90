!
! Program calculates the cost for printing a specified number of copies
! Written by Brian Moye
! CS 410W - Assignment #2
! January 12, 2022
!

PROGRAM copyCost
    implicit none

    integer :: numCopies
    real :: first200Price, otherPrice, totalPrice
    character(len = 50) :: name

    first200Price = 0.10
    otherPrice = 0.05

    print *, "Please enter your name: "
    read (*,*) name

    print *, "Please enter how many copies you need:"
    read (*,*) numCopies

    IF (numCopies < 200) THEN
        totalPrice = numCopies * first200Price
    ELSE
        totalPrice = (numCopies - mod(numCopies, 200)) * first200Price + ((numCopies - 200) * otherPrice)
    END IF
    
    print *, "Thank you ",name, "your ",numCopies, "copies will cost", totalPrice

END PROGRAM copyCost