<?php
// start session 
session_start();
require_once '../DBandFunc/functions.php';
require_once '../DBandFunc/DBaccessProduct.php';
require_once '../DBandFunc/DBconnect.php';
 

$id = isset($_GET['id']) ? $_GET['id'] : "";

	if (isset($_POST['product_id']) && (isset($_SESSION['user']))) {
    $product_id = $_POST['product_id'];
    $conn = connect();
    $sql = "SELECT * FROM cart WHERE fk_product_id={$product_id}";
    
    $res = mysqli_query($conn,$sql);

	if ($res->num_rows == 0 ){
	$sql = "INSERT INTO cart (fk_product_id,fk_user_id, cart_qty) VALUES ({$product_id},{$_SESSION['user']}, 1)";
	$result1 = mysqli_query($conn,$sql);
	}
	else {

		$row = $res->fetch_assoc();
		$qty = $row['cart_qty'] +1;
		$sql = "UPDATE cart SET cart_qty=$qty WHERE fk_product_id=$product_id";
		$res = mysqli_query($conn,$sql);
	}
	if ( isset($_SESSION['user' ])!="") {
    header("Location: ../homes/userHome.php");
    exit;
	}
	}
	
	

?>
