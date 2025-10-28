<?php
include 'db.php'; 

if (isset($_GET['petID'])) {
    $petID = $_GET['petID'];

    $vets_sql = "SELECT * FROM VetAppointments WHERE AppointmentID = '$petID'";
    $vets_result = mysqli_query($conn, $vets_sql);

    if (mysqli_num_rows($vets_result) > 0) {
        echo "<h2>Appointment List</h2>";
        while ($row = mysqli_fetch_assoc($vets_result)) {
            echo "<p>Appointment with Pet ID: " . htmlspecialchars($row['petID']) . "<br>";
            echo "Appointment Date: " . htmlspecialchars($row['appointmentDate']) . "</p>";
        }
    } else {
        echo '<div style="padding: 20px; background-color: #fff3cd; color: #856404; border: 1px solid #ffeeba; border-radius: 4px; margin: 20px 0; text-align: center;">';
        echo "<p>No appointments found.</p>";
        echo '</div>';
    }
} else {
    echo '<div style="padding: 20px; background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; border-radius: 4px; margin: 20px 0; text-align: center;">';
    echo "No pet ID provided in the request.";
    echo '</div>';
}


mysqli_close($conn);
?>