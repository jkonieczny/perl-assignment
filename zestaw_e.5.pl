#!/usr/bin/perl
use CGI ':standard';
use CGI::Session;
use File::Spec;

$cgi = CGI->new;
$session = new CGI::Session->new; #(undef, $cgi,{Directory=>File::Spec->tmpdir});
$session->expire(60);


if(param('logout') eq 'true'){
  $session->delete();
  print redirect($ENV{'SCRIPT_NAME'});
}

$login = '';
# validate submitted form:
if ($ENV{'REQUEST_METHOD'} eq "POST"){
  $login    = param('login');
  $password = param('password');
  
  if($login eq "admin" && $password eq "password"){
    $session->param('logged_in',1);
    # w zadaniu bylo ten sam komputer I TEN SAM IP:
    $session->param('ip_address',remote_host());
  }
}



print header(-type=>'text/html',-charset=>'utf-8');

print start_html( -title  => 'Zestaw E',
                  -style  => {-src=>'http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css'},
                  -script => {-type=>'JAVASCRIPT',
                              -src=>'http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'});

print '<div class="container">';





if($session->param('logged_in') eq 1 && $session->param('ip_address') eq remote_host()) {
  print h3('Brawo! Oto ukryta wiadomość:'),
        img({-src=>'http://www.mobilemarketingwatch.com/wordpress/wp-content/uploads/2011/07/Top-Secret-Tip-To-Pick-SMS-Keyword.jpeg'}),
        a({-href=>'?logout=true',-class=>'btn btn-default'},'WYLOGUJ!');
} else {

  print h4('Zaloguj sie zeby wyswitlic ukryta wiadomść:'),
        start_form(-method=>'post'),
        div({-class=>'form-group'},
            label({-for=>'login'},'Login:'),
            textfield(-name=>'login',-value=>'',-id=>'login',-class=>'form-control',-value=>$login)),
        div({-class=>'form-group'},    
            label({-for=>'password'},'Hasło:'),
            input({-name=>'password',-type=>'password',-value=>'',-id=>'password',-class=>'form-control'})),
        div({-class=>'form-group'},    
          submit(-value=>'Wyślij formularz',-class=>'btn btn-default'),
          p({-class=>'group-help'},'Uzyj loginu "admin" i hasła "password"')),
        end_form;
}

print '</div>';

print end_html();

