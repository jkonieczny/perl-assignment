#!/usr/bin/perl
# header: 
print "Content-type:text/html\r\n\r\n";
# html:
print '<!DOCTYPE html>';
print '<html lang="pl">';
print '<head>';
print '<title>Hello Word - First CGI Program</title>';
# troche css od twittera co by formularz lepiej wygladal:
# nie jest to potrzebne zeby dzialalo wszystko, ale ladniej wyglada:
print '<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css"/>';
print '<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>';
print '<script type="text/javascript" src="//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>';

print '</head>';
print '<body><div class="container">';

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

# Zestaw E, zadanie na 4.0 
# Mozna bylo 3.0, 4.0 rozdzielic na osobne pliki, ale chyba sie połapiesz co i jak
# dodalem troche css (elementy <div> i properies 'class' - nie sa potrzebne 
# zeby program dzialal jak trzeba, ale ladniej z tym wyglada formularz ;)
   
$logged_in = 0;
$flash      = "";
$flash_class= "";
if ($ENV{'REQUEST_METHOD'} eq "POST")
{
    read(STDIN, $post, $ENV{'CONTENT_LENGTH'});
    @pairs = split(/&/, $post);
    foreach $pair (@pairs)
    {
      ($name, $value) = split(/=/, $pair);
      $value =~ tr/+/ /;
      $value =~ s/%(..)/pack("C", hex($1))/eg;
      $FORM{$name} = $value;
    }
    $login      = $FORM{login};
    $password   = $FORM{password};

    if($login eq "admin" && $password eq "password"){
      $logged_in = 1;
      $flash = "Zostałeś pomyślnie zalogowany";
      $flash_class = " alert-success";
    }else{
      $flash = "Niepoprawne hasło";
      $flash_class = " alert-info";
    }
}

if($flash){
  print '<div class="alert';
  print $flash_class;
  print '">';
  print $flash;
  print '</div>';
}

if($logged_in){
  print '<h4>Brawo! Oto ukryta wiadomość:</h4>';
  print '<img src="http://www.mobilemarketingwatch.com/wordpress/wp-content/uploads/2011/07/Top-Secret-Tip-To-Pick-SMS-Keyword.jpeg" />';
}else{
  print '<h4>Zaloguj sie zeby wyswitlic ukryta wiadomosc</h4>';

  # wyswietlamy formularz:
  print '<form action="" method="post" role="form">';
  print '<div class="form-group">';
  print '<label for="login">Login:</label>';
  print '<input id="login" type="text" class="form-control" name="login" value="';
  print "";
  print '"/></div>';
  print '<div class="form-group">';
  print '<label for="pass">Password</label>';
  print '<input id="pass" type="password" class="form-control" name="password" /></div>';
  print '<div class="form-group">';
  print '<input type="submit" value="Wyślij formularz"  class="btn btn-default"/>';
  print '<p class="group-help">Uzyj loginu "admin" i hasła "password"</p></form>';
}
print '</div></body>';
print '</html>';

exit(0);