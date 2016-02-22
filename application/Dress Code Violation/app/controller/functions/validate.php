<?php 
	function initialize_token() {
		return (isset($_SESSION['student_id'])) ? TRUE : FALSE;
	}

	function validate_student($search_id) {
		global $conn;
		$select = "SELECT COUNT(card_id) as card_id, COUNT(student_id) as student_id from students WHERE card_id = $search_id OR student_id = '$search_id'";
		$result = $conn->query($select);

		if ($result) {
			while ($row = $result->fetch_object()) {
				$search_id = $row->card_id;
			}
		}
		return ($search_id == 1) ? TRUE : FALSE;
	}

	function violation_ticket_today($search_id) {
		global $conn;

		date_default_timezone_set('Asia/Manila');
		$date_today = date('j');
		$select = "SELECT EXTRACT(DAY FROM violation_details.created_at) AS Day FROM violation_details 
				   LEFT JOIN students ON violation_details.student_id = students.student_id 
				   WHERE violation_details.student_id = '$search_id' OR students.card_id = '$search_id'";

		$result = $conn->query($select);
		while ($row = $result->fetch_object()) {
			$day = $row->Day;
		}

		if ($day == $date_today) {
			return true;
		}
	}

	function determine_gender($gender) {
		global $conn;
		$select = "SELECT gender from students where card_id = $gender OR student_id = '$gender'";
		$result = $conn->query($select);

		if($result) {
			while ($row = $result->fetch_object()) {
				$gender = $row->gender;
			}
		}
		return $gender;
	}

	function determine_personnel($disciplinary_personnel_id) {
		global $conn;
		$select = "SELECT COUNT(dp_id) as dp_id from disciplinary_personnels WHERE dp_id = $disciplinary_personnel_id";
		$result = $conn->query($select);

		if ($result) {
			while ($row = $result->fetch_object()) {
				$disciplinary_personnel_id = $row->dp_id;
			}
		}
		return ($disciplinary_personnel_id == 1) ? TRUE : FALSE;
	}

	function student_information($search_id) {
		global $conn;
		$select = "SELECT student_id from students where card_id = $search_id OR student_id = '$search_id'";
		$result = $conn->query($select);

		if ($result) {
			while ($row = $result->fetch_object()) {
				$student_id = $row->student_id;
			}
		}
		return $student_id;
	}

	function violation_details_id($search_id) {
		global $conn;
		$select = "SELECT id from violation_details where student_id = '$search_id'";
		$result = $conn->query($select);

		if ($result) {
			while ($row = $result->fetch_object()) {
				$id = $row->id;
			}
		}
		return $id;	
	}
	
	function violation_ticket($violation_information) {
		global $conn;
		$fields = '`' . implode('`, `', array_keys($violation_information)) . '`';
		$data = '\'' . implode('\', \'', $violation_information) . '\'';
		$date = created_at;
		$valid_date = valid_date;

		$insert = "INSERT INTO violation_details($fields, $date, $valid_date) VALUES ($data, NOW(), DATE_ADD(NOW(), INTERVAL 2 DAY))";

		$result = $conn->query($insert);

		if ($result) {
			return TRUE;
		}
	}

	function violation_of_student($id, $value) {
		global $conn;

		$insert = "INSERT INTO violations(id, violation_code) VALUES ('$id', '$value')";
		$result = $conn->query($insert);

		if ($result) {
			session_unset();
			session_destroy();
		}
	}
?>