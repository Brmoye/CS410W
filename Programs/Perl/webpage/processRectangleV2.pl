#!/usr/bin/perl
# The above line tells program where the compiler is for perl
# CPAN is a website of perl modules
# $ENV is an environment variable that can be a variety of things
use CGI qw(:standard);
print header();
print start_html(-title=>"Rectangle Processing",
					-head=>Link({-rel=>"stylesheet",
					-type=>"text/css",
					-href=>"styles.css"}));

print "<h1>Rectangle Processing Fun</h1>\n";

$dateString = localtime();
print("<p>Current date and time: $dateString</p>\n");

open(FP, ">>rectangles.txt");

$length = param("length");
$width = param("width");
$choice = param("choice");

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

print end_html();
