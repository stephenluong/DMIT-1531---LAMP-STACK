#!/bin/bash


sudo echo '<html>
<head>
<title> Search Data In TextBox </title>
</head>
<body>
<center>
	<h1>DMIT1531 Final Load Test</h1>
			<form action="/index.php"method="POST">
					<input type="text" name="id" placeholder="Enter ID To Search"><br>
					<input type="submit" name="search" value="Submit">
			</form>
<?php
$connection = mysqli_connect("localhost","administrator","administrator123");
$db = mysqli_select_db($connection,'storagedb');

if(isset($_POST['search']))
{
	$id = $_POST['id'];

	$query = "SELECT * FROM storagedb.storagetb where id='$id'";
	$query_run = mysqli_query($connection,$query);

	while($row = mysqli_fetch_array($query_run))
	{
?>
	<form action="/index.php"method="POST">
		<input type="hidden" name="id" value="<?php echo $row['id']; ?>"/><br>
		<input type="text" name="firstname" value="<?php echo $row['firstname']; ?>"/><br>
		<input type="text" name="lastname" value="<?php echo $row['lastname']; ?>"/><br>
		<input type="text" name="hardware" value="<?php echo $row['hardware']; ?>"/><br>
		<input type="text" name="address" value="<?php echo $row['address']; ?>"/><br>
		<input type="text" name="spec" value="<?php echo $row['spec']; ?>"/><br>
		<input type="text" name="vendor" value="<?php echo $row['vendor']; ?>"/><br>
	</form>
	<?php
	}
}
	?>
</center>
</body>
</html>' > /var/www/site5/index.php

sudo mysql -u root -ppassword <<MY_QUERY 
CREATE USER 'administrator'@'localhost' IDENTIFIED BY 'administrator123';
GRANT ALL PRIVILEGES ON *.* TO 'administrator'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
MY_QUERY

