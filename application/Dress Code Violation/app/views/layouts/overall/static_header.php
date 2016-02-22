<!DOCTYPE html>
<html lang="en">
  <head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title><?php echo $title; ?></title>
	<link href="app/assets/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<link href="app/assets/stylesheets/<?php echo $css; ?>.css" rel="stylesheet">
	<script type="text/javascript" src="app/assets/javascript/webcam.js"></script>
  </head>
  <body>
  <div class="container">
	  	<header class="navbar navbar-fixed-top navbar-inverse">
	  		<div class="container">
	  			<a href="index.php" class="logo">Dress Code Violation</a>
	  			<nav>
	  				<ul class="nav navbar-nav pull-right">
	  					<li class="logo"><?php date_default_timezone_set('Asia/Manila'); echo date("F j, Y") ?></li>
	  				</ul>
	  			</nav>
	  		</div>
	  	</header>
	  	<div class="center jumbotron">