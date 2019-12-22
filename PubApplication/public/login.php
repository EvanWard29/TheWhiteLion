<?php include_once 'header.php'; include '../src/model/repository.php' ?>

<body>
<div class="w3-content" style="max-width:1100px">
    <div class="w3-row w3-padding-64" id="menu">
        <div class="w3-col 20 w3-padding-large">
            <h1 class="w3-center" style="font-size: 40px"><u>Login</u></h1><br>
            <p class="w3-center">To Continue, Please Login:</p><br>
            <form class="form-inline w3-center" action="<?php echo basename($_SERVER['PHP_SELF'])?>" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" class="form-control" id="username" placeholder="Enter Username" name="username">
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" class="form-control" id="password" placeholder="Enter Password" name="password">
                </div>
                <input type="submit" class="btn btn-default" name="login" value="Login">
            </form>
        </div>
    </div>
</div>
</body>

<?php include_once 'footer.php' ?>

<?php
if(isset($_POST['login']))
{
    $username = $_POST['username'];
    $password = md5($_POST['password']);

    $db = new Repository();

    if($password == $db->adminLogin($username)){
        //Success! Username and password confirmed
        $_SESSION['admin'] = 1;
        setcookie('admin', $username, time()+(84600*30));
        header('Location: admin.php');
        exit();
    }
    else{
        //Indicates password failure
        $_SESSION['admin'] = 0;

        echo "<script> alert('Incorrect Username or Password!')</script>";
    }
}
