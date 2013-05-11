<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<title>KS Car Rental</title>
</head>

<body>
	<div id="page">
		<div id="pagetop">
			<h1>KS Car Rental</h1>
			<div class="links">
				<ul>
					<li><a href="http://localhost:8080/CarRental/Help.html">Help</a></li>
					<li><a href="http://localhost:8080/CarRental/ContactUs.html">Contact
							Us</a></li>
					<li><a href="http://localhost:8080/CarRental/AboutUs.html">About</a></li>
					<li><a href="http://localhost:8080/CarRental/ReturnCar.html">ReturnCar</a></li>
					<li><a href="http://localhost:8080/CarRental/home.html">RentCar</a></li>
					<li><a href="http://localhost:8080/CarRental/Welcome.html">Home</a></li>

				</ul>

			</div>
		</div>

		<div id="header">Reach the Road to success</div>

		<div id="main">
			<div class="content">
				<div class="main_top">
					<h1>Rent a Car</h1>
				</div>

				<div class="main_body">
					<h1>Please enter the following details</h1>
					<table>
						<FORM action="insertCustomerNew.jsp" method="post">
							<P>
								<tr>
									<td><LABEL for="FName"> FirstName </LABEL></td>
									<td><INPUT type="text" name="FirstName"></td>
								</tr>
								<tr>
									<td><LABEL for="LName"> LastName </LABEL></td>
									<td><INPUT type="text" name="LastName"></td>
								</tr>
								<tr>
									<td><LABEL for="ssn"> SSN </LABEL></td>
									<td><INPUT type="text" name="SSN"></td>
								</tr>
								<tr>
									<td><LABEL for="PrimaryPhNo"> PrimaryPhoneNo </LABEL></td>
									<td><INPUT type="text" name="PrimaryPhoneNo"></td>
								</tr>
								<tr>
									<td><LABEL for="AltPhNo"> AltPhoneNo </LABEL></td>
									<td><INPUT type="text" name="AltPhoneNo"></td>
								</tr>
								<tr>
									<td><LABEL for="street"> Street </LABEL></td>
									<td><INPUT type="text" name="Street"></td>

								</tr>
								<tr>
									<td><LABEL for="city"> City </LABEL></td>
									<td><INPUT type="text" name="City"></td>
								</tr>
								<tr>
									<td><LABEL for="state"> State </LABEL></td>
									<td><INPUT type="text" name="State"></td>
								</tr>
								<tr>
									<td><LABEL for="zip"> Zip </LABEL></td>
									<td><INPUT type="text" name="Zip"></td>
								</tr>
								<tr>

								</tr>
								<tr>

								</tr>
								<tr>
									<table>
										<tr>

											<td><INPUT type="submit" value="Submit" valign="middle"></td>
										</tr>
									</table>

								</tr>

							</P>
						</FORM>
					</table>
				</div>


			</div>
			<div class="clear">&nbsp;</div>
		</div>
		<div id="footer">
			<p>copyright protected KS Car Rental</p>
		</div>



	</div>
</body>
</html>
