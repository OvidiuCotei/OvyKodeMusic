<?php
include("includes/config.php");
include("includes/classes/Artist.php");
include("includes/classes/Album.php");
include("includes/classes/Song.php");

if(isset($_SESSION['userLoggedIn']))
{
    $usserLoggedIn = $_SESSION['userLoggedIn'];
    echo "<script>userLoggedIn = '$usserLoggedIn';</script>";
}
else
{
    header("Location: register.php");
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ovy Kode Music</title>
    <link rel="stylesheet" type="text/css" href="assets/css/style.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="assets/js/script.js"></script>
</head>
<body>
    <div id="mainContainer">
        <div id="topContainer">
            <?php include("includes/navBarContainer.php") ?>
            <div id="mainViewContainer">
                <div id="mainContent">