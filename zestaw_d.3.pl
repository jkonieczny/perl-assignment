#!/usr/bin/perl
print "Content-type:text/html\r\n\r\n";
# Zestaw D, Zadanie na 3.0 
if (length ($ENV{'QUERY_STRING'}) > 0){
      @numbers  = split(/\+/, $ENV{'QUERY_STRING'});
      $sum = 0;

      foreach $number (@numbers){
        $sum += $number;
      }

      print $sum;
}
