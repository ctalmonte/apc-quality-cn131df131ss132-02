<?php 
$title = "Dress Code Violation System";
$css = "custom";

require 'app/views/layouts/overall/static_header.php';
require 'app/controller/init.php';
revert_page_protection();
?>
<img src="app/assets/images/application_images/apc_logo.png" width="100" height="100">
<div class="search">
	<form action="index.php" method="POST">
		<input type="password" name="student_id" class="student_information" placeholder= "Student ID Number or Scan your ID in the RFID Scanner" autofocus required >
	</form>
	<div class="error_message">
		<?php 
		if (isset($_POST['student_id'])) {
			$search_id = $_POST['student_id'];
			$_SESSION['student_id'] = $search_id;

			if (validate_student($search_id)) {
				if (violation_ticket_today($search_id)) {
		?>
				<div class="alert alert-warning" role="alert">
					<span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
					<span class="sr-only">Reminder:</span>
					<span class="danger_message">
						Violation Ticket has been processed. For more information
						<button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">View Ticket</button>
					</span>
				</div>

				<div id="myModal" class="modal fade" role="dialog">
					<div class="modal-dialog">
						<!-- Modal content-->
						<div class="modal-content">
							<div class="modal-header">
								<img src="app/assets/images/application_images/violation.png" width="180" height="100" style="margin-bottom: 13px;">
								<h3 class="modal-title">Dress Code Violation</h3>
							</div>
							<div class="modal-body" style="text-align: justify;">
								<!-- Insert Violation Ticket Report of the Student -->
							<?php 
								if (initialize_token() === TRUE) {
									global $conn;
									$search_id = $_SESSION['student_id'];
									date_default_timezone_set('Asia/Manila');
									$date_today = date('j');

									$select = "SELECT 	students.last_name		AS student_last_name,
														students.first_name		AS student_first_name,
												        students.middle_name	AS student_middle_name,
												        students.id_picture,
												        
												        violation_details.status,
												        DATE_FORMAT(violation_details.created_at, '%b %d, %Y - %h:%i %p') AS created_at,
												        
												        disciplinary_personnels.last_name,
												        disciplinary_personnels.first_name,
												        disciplinary_personnels.middle_name,
												        disciplinary_personnels.dp_picture

												FROM violation_details

												LEFT JOIN students
												ON students.student_id = violation_details.student_id

												LEFT JOIN disciplinary_personnels
												ON disciplinary_personnels.dp_id = violation_details.dp_id

												WHERE (students.student_id = '$search_id' OR students.card_id = '$search_id') AND EXTRACT(DAY FROM violation_details.created_at) = $date_today";
									
									$result = $conn->query($select);
									
									if ($result) {
										while ($row = $result->fetch_object()) {
							?>
											<div class="ticket_info">
												<img src="<?php echo $row->id_picture; ?>" width="120" height="120" class="img-thumbnail" style="float: left;">
												<label class="form_name" style="margin-right: 118px;">Name</label>
												<input type="text" class="form-control" value="<?php echo $row->student_last_name . ", " . $row->student_first_name . " " . $row->student_middle_name; ?>" disabled style="width: 250px;">
												<label class="form_name" style="margin-top: 20px; margin-right: 113px;">Status</label>
												<p style="margin-top: 17px; font-size: 18px;"><?php echo $row->status ?></p>
												<label class="form_name" style="margin-top: 9px; margin-right: 67px;">Issued Date</label>
												<p style="margin-top: 21px; font-size: 18px;"><?php echo $row->created_at ?></p>
											</div>
											<div class="ticket_info">
												<img src="<?php echo $row->dp_picture; ?>" width="120" height="120" class="img-thumbnail" style="float: left;">
												<label class="form_name" style="margin-right: 75px; margin-top: 40px;">Issued By</label>
												<input type="text" class="form-control" value="<?php echo $row->last_name . ", " . $row->first_name . " " . $row->middle_name; ?>" disabled style="width: 250px; margin-top: 35px; display: inline; float: right;">
											</div>
											<div class="space">
												<p style="margin-bottom: 30px;"></p>
											</div>
							<?php  
										}
									}
								}
							?>
							</div>
							<div class="modal-footer" style="margin-top: 100px;">
								<a href="index.php"><button type="button" class="btn btn-default">Close</button></a>
							</div>
						</div>
					</div>
				</div>
		<?php

				} else {
					header('Location: violation.php');
				}
			} else {
		?>
				<div class="alert alert-danger" role="alert">
					<meta http-equiv="refresh" content="3; URL='index.php'" />
					<span class="glyphicon glyphicon-warning-sign" aria-hidden="true"></span>
					<span class="sr-only">Error:</span>
					<span class="danger_message">Please Register and Accommodate your Student Account in the IT Resource Office.</span>
				</div>
		<?php
			}
		}

		if (isset($_GET['success'])) {
		?>
			<div class="alert alert-success">
				<meta http-equiv="refresh" content="2; URL='index.php'" />
				<span class="glyphicon glyphicon-ok-sign" aria-hidden="true"></span>
				<span class="success_message">Violation Ticket has been processed. For more information login to the APC Violation Website.</span>
			</div>
		<?php
		}
		?>
	</div>
</div>
<?php
require 'app/views/layouts/overall/static_footer.php';
?>