#!/usr/bin/perl
# The above line tells program where the compiler is for perl

# $ENV is an environment variable that can be a variety of things

print "Content-Type: Text/html\n\n";

print <<END;
<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="styles.css" type="text/css" >
		<title>Rectangle Processing Fun!</title>
	</head>
	<body>
		<h1>Rectangle Processing Fun</h1>
END

$dateString = localtime();
print("<p>Current date and time: $dateString</p>\n");

open(FP, ">>rectangles.txt");

$str = $ENV{QUERY_STRING};
($s1,$s2,$s3) = split(/&/, $str);
($dummy,$length) = split(/=/, $s1);
($dummy,$width) = split(/=/, $s2);
($dummy,$choice) = split(/=/, $s3);

if ($choice eq "P")
{
	$perimeter = 2 * $length + 2 * $width;
	printf("<p>Perimeter is %0.1f</p>\n", $perimeter);
	printf(FP "%s, Perimeter is %0.1f\n", $dateString, $perimeter);
}
else
{
	$area = $length * $width;
	printf("<p>Area is %0.1f</p>\n", $area);
	printf(FP "%s, Area is %0.1f\n", $dateString, $area);
}

close(FP);

print "</body>\n";
print "</html>\n";