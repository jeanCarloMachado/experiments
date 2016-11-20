<?php
session_start();

$locale = "en_GB";

putenv("LANG=" . $locale); 
putenv("LANGUAGE=" . $locale); 
setlocale(LC_ALL,"");
setlocale(LC_MESSAGES,$locale);
setlocale(LC_CTYPE,$locale);


$domain = "example";

bindtextdomain('domain', './locale/nocache');
bindtextdomain($domain, "./locale"); 
bind_textdomain_codeset($domain, 'UTF-8');

textdomain($domain);

$user = "Curious gettext tester";
echo _("Lets make the web multilingual.");

function __($text)
{
    return 'teste';
}
