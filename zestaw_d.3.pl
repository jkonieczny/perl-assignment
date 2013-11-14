#!/usr/bin/perl
use CGI ':standard';

print header(-type=>'text/html',-charset=>'utf-8');

print start_html();
# Zestaw D, Zadanie na 3.0 
if (length ($ENV{'QUERY_STRING'}) > 0){
      @numbers  = split(/\+/, $ENV{'QUERY_STRING'});
      $sum = 0;

      foreach $number (@numbers){
        $sum += $number;
      }

      print h3('Suma parametrów to: ',$sum);
      
} else {
  print h3("Nie podano parametru query string");
}

print end_html;