!
! Program takes in user input for exam scores and student names then calculates the average
! Written by Brian Moye
! CS 410W - Assignment #3
! January 17, 2022
!

PROGRAM examScores
	IMPLICIT NONE
	
	REAL, ALLOCATABLE, DIMENSION(:) :: scores
	Character(len=50), ALLOCATABLE, DIMENSION(:) :: names
	INTEGER :: numStudents, i, highStudent, lowStudent
	REAL :: score, averageScore, highScore, lowScore
	
	averageScore = 0.0
	score = -1
	numStudents = 0
	i = 1
	
	DO WHILE(numStudents < 1 .or. numStudents > 60)
		PRINT *, "Please enter the number of students (1-60):"
		READ (*,*) numStudents
	END DO
	
	allocate(scores(numStudents))
	allocate(names(numStudents))
	
	DO i = 1, numStudents
		WRITE (*,"(A34)",ADVANCE='NO') "Please enter the name of student #"
		WRITE (*,"(i2.2)") i
		
		READ (*, '(A)') names(i)
		
		DO WHILE(score < 0 .or. score > 100)
		    WRITE (*,"(A36)",ADVANCE='NO') "Please enter the score for student #"
		    WRITE (*,"(i2.2)") i
			READ (*,*) score
		END DO
		
		scores(i) = score
		score = -1
	END DO
	
	highStudent = 1
	lowStudent = 1
	highScore = scores(1)
	lowScore = scores(1)
	
	DO i = 1, numStudents
		averageScore = averageScore + scores(i)
		IF (highScore < scores(i)) THEN
			highScore = scores(i)
			highStudent = i
		END IF
		IF (lowScore > scores(i)) THEN
			lowScore = scores(i)
			lowStudent = i
		END IF
	END DO
	
	averageScore = averageScore / numStudents
	
	PRINT *
	
	WRITE (*,"(A14)",ADVANCE='NO') "Average Score:"
	WRITE (*,"(f7.2)") averageScore
	
	PRINT *
	
	WRITE (*,"(A11)") "High Score:"
	WRITE (*,"(A50)") names(highStudent)
	WRITE (*,"(f6.2)") scores(highStudent)
	
	PRINT *
	
	WRITE (*,"(A10)") "Low Score:"
	WRITE (*,"(A50)") names(lowStudent)
	WRITE (*,"(f6.2)") scores(lowStudent)
	
	PRINT *
	
	PRINT *, "Students who scored higher than the average:"
	
	DO i = 1, numStudents
		IF (scores(i) > averageScore) THEN
			WRITE (*,"(A50)") names(i)
			WRITE (*,"(f6.2)") scores(i)
		END IF
	END DO
	
END PROGRAM examScores