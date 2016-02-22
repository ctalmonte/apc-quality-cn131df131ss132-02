<?php
$connect_error = 'Sorry for the Server Down Time... The Administrator will facilitate the website.';

$server = 'localhost';
$username = 'root';
$password = '';
$database = 'dresscodeviolationsystem';

$conn = new mysqli($server, $username, $password, $database);
if ($conn->connect_error) {
	die($connect_error);
}
?>