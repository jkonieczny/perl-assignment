#!/usr/bin/perl
use CGI ':standard';

print header(-type=>'text/html',-charset=>'utf-8');

print start_html();
# Zestaw E, Zadanie na 3.0 
if (length ($ENV{'QUERY_STRING'}) > 0){
      @pairs  = split(/&/, $ENV{'QUERY_STRING'});
      $longest= "";

      foreach $pair (@pairs){
           ($name, $value) = split(/=/, $pair);
           if( length($value) > length($longest)){
              $longest = $name;
           }
      }
      print h3('Najdluzszy query string parameter: ',$longest);
      
} else {
  print h3("Nie podano parametrow query string");
}

print end_html;