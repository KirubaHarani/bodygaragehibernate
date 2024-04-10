<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BodyGarage Gym</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Link your custom CSS file -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<br>
<br>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> <!-- Make navbar fixed -->
  <a class="navbar-brand" href="#">BodyGarage Gym</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item">
        <a class="nav-link" href="bghome.jsp"> Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-item active" href="#">  About Us</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> Services</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"> Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#adminLoginModal"> Admin Login</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Admin Login Modal -->
<div class="modal fade" id="adminLoginModal" tabindex="-1" role="dialog" aria-labelledby="adminLoginModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="adminLoginModalLabel">Admin Login</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Admin login form -->
        <form action="LoginServlet" method="post">
          <div class="form-group">
            <label for="username">Username</label>
            <input type="text" class="form-control" id="username" name="username" placeholder="Enter username">
          </div>
          <div class="form-group">
            <label for="password">Password</label>
            <input type="password" class="form-control" id="password" name="password" placeholder="Password">
          </div>
          <button type="submit" class="btn btn-primary">Login</button>
        </form>
      </div>
    </div>
  </div>
</div>
<br>
<br>
<div class="container">
    <h2>Welcome to BodyGarage Gym</h2>
    <p>Established in<b>September 2019 </b>by <b>K. Karthik</b>, BodyGarage Gym is your ultimate destination for fitness and wellness. With a passion for health and a commitment to excellence, we provide a top-notch training facility equipped with state-of-the-art equipment and personalized coaching to help you reach your fitness goals.</p>
    <p>At BodyGarage Gym, we believe that fitness is not just about physical strength, but also mental well-being. Our experienced trainers are dedicated to guiding you through every step of your fitness journey, offering expert advice, tailored workout plans, and motivation to help you stay on track.</p>
    <p>Whether you're a beginner looking to kickstart your fitness routine or a seasoned athlete aiming to push your limits, our diverse range of classes and training programs cater to individuals of all fitness levels and interests. From strength training and cardio workouts to yoga and group classes, we have something for everyone.</p>
    <p>Join our community of like-minded individuals who are committed to living a healthier, happier lifestyle. Experience the difference at BodyGarage Gym and unlock your full potential today!</p>
    <p>Come visit us and take the first step towards a stronger, fitter you. Your body deserves the best – welcome to BodyGarage Gym, where we fuel your fitness journey!</p>
</div>

<!-- Footer -->
<footer>
    <p>&copy; 2024 BodyGarage Gym. All rights reserved.</p>
</footer>

<!-- Bootstrap JS and jQuery -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
