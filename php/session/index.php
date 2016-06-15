<?php
session_start();
$_SESSION['foo'] = 'bar';
header('Location: baz.php');
exit();
