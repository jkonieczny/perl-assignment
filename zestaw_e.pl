#!/usr/bin/perl
print "Content-type:text/html\r\n\r\n";
print '<html>';
print '<head>';
print '<title>Hello Word - First CGI Program</title>';
print '</head>';
print '<body>';

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
      print "<h3>Najdluzszy query string parameter: ";
      print $longest;
      print "</h3>";
      
} else {
  print "<h3>Nie podano parametrow query string</h3>";
}

# Zestaw E, zadanie na 4.0 i 5.0 
# Mozna bylo 3.0, 4.0 i 5.0 rozdzielic na osobne pliki, ale chyba sie połapiesz co i jak
print '<form action="" method="post">



print '</body>';
print '</html>';

1;