<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vet Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .profile-container {
            background-color: #fff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }
        h2 {
            color: #333;
        }
        p {
            margin: 5px 0;
            color: #555;
        }
        .profile-btn {
            display: block;
            width: 100%;
            padding: 10px;
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
        }
        .profile-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="profile-container">
        <?php
        include 'db.php';
        if (isset($_GET['vetID'])) {
            $vetID = $_GET['vetID']; 
            $stmt = $conn->prepare("SELECT firstName, lastName, email, phoneNumber FROM vets WHERE vetID = ?");
            $stmt->bind_param("i", $vetID); 
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows > 0) {
                $row = $result->fetch_assoc();
                echo "<h2>Dr. " . htmlspecialchars($row['firstName']) . " " . htmlspecialchars($row['lastName']) . "</h2>";
                echo "<p>Email: " . htmlspecialchars($row['email']) . "</p>";
                echo "<p>Phone: " . htmlspecialchars($row['phoneNumber']) . "</p>";
                echo "<a class='profile-btn' href='edit_profile.php?vetID=$vetID'>Edit Profile</a>";
                echo "<a class='profile-btn' href='appointments.php?vetID=$vetID'>View Appointments</a>";
            } else {
                echo "<p>Vet profile not found.</p>";
            }
            $stmt->close(); 
        }
        $conn->close(); 
        ?>
    </div>
</body>
</html>
