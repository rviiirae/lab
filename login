<?php
// login.php

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = trim($_POST['username']);
    $password = $_POST['password'];

    // Hash the entered password
    $hashedPassword = md5($password);

    if (file_exists("users.txt")) {
        $users = file("users.txt", FILE_IGNORE_NEW_LINES);
        foreach ($users as $user) {
            list($savedUser, $savedHash) = explode(":", $user);
            if ($savedUser === $username && $savedHash === $hashedPassword) {
                die("Login successful! Welcome, " . htmlspecialchars($username));
            }
        }
    }

    die("Invalid username or password.");
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
<style>
       body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
        }

        form {
            display: inline-block;
            padding: 20px;
            border: 1px solid #2f55ecff;
            border-radius: 8px;
            background-color: #f9f9f9;
        }

        input {
            display: block;
            margin: 10px 0;
            padding: 5px;
        }

        button {
            padding: 5px 10px;
            background-color: #2f55ecff;
            color: white;
        }

        a {
            display: block;
            margin-top: 10px;
        }
    </style>    
<form method="POST" action="">
    <h2>Login</h2>
    <input type="text" name="username" placeholder="Username" required>
    <input type="password" name="password" placeholder="Password" required><br>
    <button type="submit">Login</button>
</form>
</head>
</html>
