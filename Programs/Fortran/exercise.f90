!
! Program calculates the number of calories lost doing specific activities at hour-long intervals
! Written by Brian Moye
! CS 410W - Assignment #2
! January 11, 2022
!

PROGRAM exercise
    implicit none

    integer :: cycling, running, swimming, activity, hours, caloriesBurned
    real :: poundsLost

    cycling = 225
    running = 450
    swimming = 275

    print *, "Please choose an activity: "
    print *, "1. Cycling"
    print *, "2. Running"
    print *, "3. Swimming"
    read (*,*) activity

    print *, "Please enter the hours spent doing your activity:"
    read (*,*) hours

    IF (activity == 1) THEN
        caloriesBurned = cycling * hours
        
    ELSE IF (activity == 2) THEN
        caloriesBurned = running * hours

    ELSE IF (activity == 3) THEN
        caloriesBurned = swimming * hours

    ELSE
        print *, "Invalid selection, please try again."

    END IF

    poundsLost = caloriesBurned / 3800.0

    print *, "You burned", caloriesBurned, "calories and lost", poundsLost, "pounds!"

END PROGRAM exercise