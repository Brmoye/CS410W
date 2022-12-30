#!/usr/bin/perl
# The above line tells program where the compiler is for perl

print "Rectangle Fun\n\n";

do
{
	print "Enter length: ";
	$length = <STDIN>;
	chomp($length);


	print "Enter width: ";
	$width = <STDIN>;
	chomp($width);

	print "Do you want Perimeter (P) or Area (A)? ";
	$choice = <STDIN>;
	chomp($choice);

	# String comparison operators eq, ne, lt, gt, le, ge
	if ($choice eq "P")
	{
		$perimeter = 2 * $length + 2 * $width;
		print "Perimeter is $perimeter\n";
	}
	elsif ($choice eq "A")
	{
		$area = $length * $width;
		print "Area is $area\n";
	}
	else
	{
		print "Invalid choice.";
	}
	print "Go again (Y/N)? ";
	$reply = <STDIN>;
	chomp($reply);
} while ($reply eq "Y" or $reply eq "y");