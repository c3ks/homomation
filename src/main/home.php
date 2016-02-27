<?php

namespace Main;

class Home {
  function show($f3) {
    echo \Template::instance()->render('main/home/show.html');
  }
}
