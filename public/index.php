<?php

$f3 = require('../lib/base.php');
$f3->set('AUTOLOAD','../src/');
$f3->set('UI','../views/');

$f3->route('GET /', 'Main\Home->show');

$f3->run();
