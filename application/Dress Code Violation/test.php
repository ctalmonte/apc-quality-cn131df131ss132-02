<?php  
require 'app/controller/init.php';
global $conn;

$select = "SELECT * FROM violation_code where gender = 'M' OR gender = 'A'";
$query = $conn->query($select);
	while ($row = $query->fetch_object()) {
?>
<form method="POST" action="test.php">
	<label><input type="checkbox" name="violation[]" value="<?php echo $row->violation_code; ?>"><?php echo $row->name; ?></label><br>
<?php 
}
?>
	<input type="submit" value="Submit">
</form>
<?php  
if (isset($_POST['violation'])) {
	$violation = $_POST['violation'];
	foreach ($violation as $value) {
		$insert = "INSERT INTO dummy(violation_code) values('$value')";
		$query = $conn->query($insert);
	}
}
?>