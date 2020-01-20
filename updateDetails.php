<?php
include("includes/includedFiles.php");
?>

<div class="userDetails">
    <div class="container borderBottom">
        <h2>EMAIL</h2>
        <input type="text" class="email" name="email" placeholder="Email..." value="<?php echo $userLoggedIn->getEmail(); ?>"> 
        <span class="message"></span>
        <button class="button" onclick="">SAVE</button>
    </div>

    <div class="container borderBottom">
        <h2>PASSWORD</h2>
        <input type="password" class="oldPassword" name="oldPassword" placeholder="Current Password..." value=""> 
        <input type="password" class="newPassword1" name="newPassword1" placeholder="New Password Password..." value=""> 
        <input type="password" class="newPassword2" name="newPassword2" placeholder="Confirm Password..." value=""> 
        <span class="message"></span>
        <button class="button" onclick="">SAVE</button>
    </div>
</div>