<?php 
if (isset($_POST['remove'])) 

	{

    $product_id = $_POST['cart_id'];
    $conn = connect();
    $sql = "DELETE FROM cart WHERE fk_product_id={$product_id}";
    $res = mysqli_query($conn,$sql);

    header("Location: ../components/shoppingCart.php");
	}
if (isset($_POST['decrease'])){ 
	$product_id = $_POST['cart_id'];
    $conn = connect();
    $sql = "SELECT * FROM cart WHERE fk_product_id={$product_id}";
    $res = mysqli_query($conn,$sql);
    $row = $res->fetch_assoc();
    if($row['cart_qty'] <= 1){
    $sql1 = "DELETE FROM cart WHERE fk_product_id={$product_id}";
    $res1 = mysqli_query($conn,$sql1);	
    }
    else{
	$qty = $row['cart_qty'] -1;
	$sql2 = "UPDATE cart SET cart_qty=$qty WHERE fk_product_id=$product_id";
	$res3 = mysqli_query($conn,$sql2);
	

	header("Location: ../components/shoppingCart.php");

	}
	}
	if (isset($_POST['increase'])){ 
	$product_id = $_POST['cart_id'];
    $conn = connect();
    $sql = "SELECT * FROM cart WHERE fk_product_id={$product_id}";
    $res = mysqli_query($conn,$sql);
    $row = $res->fetch_assoc();
	$qty = $row['cart_qty'] +1;
	$sql2 = "UPDATE cart SET cart_qty=$qty WHERE fk_product_id=$product_id";
	$res3 = mysqli_query($conn,$sql2);
	

	header("Location: ../components/shoppingCart.php");

	}
	if (isset($_POST['erase'])){
		$conn = connect();
		$sql = "DELETE FROM cart WHERE fk_user_id={$_SESSION['user']}";
		$res = mysqli_query($conn,$sql);

		header("Location: ../components/shoppingCart.php");
	}
	if (isset($_POST['check-out'])){

	}

?>
