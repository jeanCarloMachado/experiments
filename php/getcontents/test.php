<?php

$check_url1 = "https://www.google.com.br/";
$check_url2 = "https://www.terra.com.br";



(($view_loaded_url1 = file_get_contents($check_url1)) &&  ($view_loaded_url2= file_get_contents($check_url2)));

var_dump(substr($view_loaded_url1,0,10)); //RETURNS boolean true 
var_dump(substr($view_loaded_url2,0,10)); //Ret

/* if(  $view_loaded_url1 = file_get_contents($check_url1) &&  $view_loaded_url2= file_get_contents($check_url2) ) { */

/*     var_dump(substr($view_loaded_url1,0,10)); //RETURNS boolean true */ 
/*     var_dump(substr($view_loaded_url2,0,10)); //Ret */
/* } */

