<?php
include("includes/config.php");
include("includes/classes/Account.php");
include("includes/classes/Constants.php");
$account = new Account($con);
include("includes/handlers/register-handler.php");
include("includes/handlers/login-handler.php");

function getInputValue($name)
{
    if(isset($_POST[$name]))
    {
        echo $_POST[$name];
    }
}
?>

<!DOCTYPE html>
<html>
<head>
    <title>Ovy Kode Music</title>
    <link rel="stylesheet" type="text/css" href="assets/css/register.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="assets/js/register.js"></script>
</head>
<body>
    <?php
        if(isset($_POST['registerButton'])) 
        {
            echo '<script>
                    $(document).ready(function() {
                        $("#loginForm").hide();
                        $("#registerForm").show();
                    });
                </script>';
        }
        else 
        {
            echo '<script>
                    $(document).ready(function() {
                        $("#loginForm").show();
                        $("#registerForm").hide();
                    });
                </script>';
        }
	?>
    <div id="background">
        <!-- Login Container Begin -->
        <div id="loginContainer">
            <!-- Input Container Begin -->
            <div id="inputContainer">
                <!-- Begin Login Form -->
                <form id="loginForm" action="register.php" method="POST">
                    <h2>Login to your account</h2>
                    <p>
                    <?php echo $account->getError(Constants::$loginFailed); ?>
                        <label for="loginUsername">Username </label>
                        <input id="loginUsername" name="loginUsername" type="text" placeholder="Enter Your Username..." value="<?php getInputValue('loginUsername') ?>" required>
                    </p>

                    <p>
                        <label for="loginPassword">Password </label>
                        <input id="loginPassword" name="loginPassword" type="password" placeholder="Enter Your Password..." required>
                    </p>
                
                    <button type="submit" name="loginButton">Login</button>
                    <div class="hasAccountText">
                        <span id="hideLogin">Don`t have an account yet? Signup here!</span>
                    </div>
                </form>
                <!-- End Login Form -->

                <!-- Begin Register Form -->
                <form id="registerForm" action="register.php" method="POST">
                    <h2>Create your free account</h2>
                    <p>
                        <?php echo $account->getError(Constants::$usernameCharacters); ?>
                        <?php echo $account->getError(Constants::$usernameTaken); ?>
                        <label for="username">Username </label>
                        <input id="username" name="username" type="text" placeholder="Enter Your Username..." value="<?php getInputValue('username') ?>" required>
                    </p>

                    <p>
                        <?php echo $account->getError(Constants::$firstnameCharacters); ?>
                        <label for="firstName">First Name </label>
                        <input id="firstName" name="firstName" type="text" placeholder="Enter Your First Name..." value="<?php getInputValue('firtName') ?>" required>
                    </p>

                    <p>
                        <?php echo $account->getError(Constants::$lastnameCharacters); ?>
                        <label for="lastName">Last Name </label>
                        <input id="lastName" name="lastName" type="text" placeholder="Enter Your Last Name..." value="<?php getInputValue('lastName') ?>" required>
                    </p>

                    <p>
                        <?php echo $account->getError(Constants::$emailsDoNotMatch); ?>
                        <?php echo $account->getError(Constants::$emailInvalid); ?>
                        <?php echo $account->getError(Constants::$emailTaken); ?>
                        <label for="email">Email </label>
                        <input id="email" name="email" type="email" placeholder="Enter Your Email..." value="<?php getInputValue('email') ?>" required>
                    </p>

                    <p>
                        <label for="email">Confirm Email </label>
                        <input id="email2" name="email2" type="email" placeholder="Confirm Your Email..." value="<?php getInputValue('email2') ?>" required>
                    </p>

                    <p>
                        <?php echo $account->getError(Constants::$passwordsDoNotMatch); ?>
                        <?php echo $account->getError(Constants::$passwordNotAlphaNumeric); ?>
                        <?php echo $account->getError(Constants::$passwordCharacters); ?>
                        <label for="password">Password </label>
                        <input id="password" name="password" type="password" placeholder="Enter Your Password..." required>
                    </p>

                    <p>
                        <label for="password">Confirm Password </label>
                        <input id="password2" name="password2" type="password" placeholder="Confirm Your Password..." required>
                    </p>
                
                    <button type="submit" name="registerButton">Sign Up</button>
                    <div class="hasAccountText">
                        <span id="hideRegister">Already have a account! Login here!</span>
                    </div>
                </form>
                <!-- End Register Form -->
            </div>
            <!-- Input Container End -->
            <!-- Login Text Begin -->
            <div id="loginText">
                <h1>Get great music, right now!</h1>
                <h2>Listen to loads of songs for free</h2>
                <ul>
                    <li>Discover music you `ll fall in  love with</li>
                    <li>Create your own playlist</li>
                    <li>Follow artists to keep up to date</li>
                </ul> 
            </div>
            <!-- Login Text End -->
        </div>
        <!-- Login Container End -->
    </div>
</body>
</html>