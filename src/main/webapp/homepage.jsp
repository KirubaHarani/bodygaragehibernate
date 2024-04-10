<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>BodyGarage Gym</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <!-- Link your custom CSS file -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<!-- Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"> <!-- Make navbar fixed -->
  <a class="navbar-brand" href="#">BodyGarage Gym</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto">
      <li class="nav-item active">
        <a class="nav-link" href="homepage.jsp">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Aboutus.jsp">About</a> <!-- Updated href attribute -->
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Services</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Contact</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#adminLoginModal">Admin Login</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Main Content -->
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <h1>Welcome to BodyGarage Gym</h1>
    
    </div>
  </div>
</div>
<br>
<br>
<!-- Carousel -->
<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img src="img/image1.jpg" class="d-block w-100 img-fluid" alt="Slide 1">
            <div class="carousel-caption">
              <h5>Welcome to BodyGarage Gym</h5>
              <p>We offer state-of-the-art equipment and personalized training programs.</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="img/image2.jpg" class="d-block w-100 img-fluid" alt="Slide 2">
            <div class="carousel-caption">
              <h5>Reach Your Fitness Goals</h5>
              <p>Join us today and start your fitness journey!</p>
            </div>
          </div>
          <div class="carousel-item">
            <img src="img/image3.jpg" class="d-block w-100 img-fluid" alt="Slide 3">
            <div class="carousel-caption">
              <h5>Personalized Training</h5>
              <p>Our certified trainers are here to help you achieve your fitness objectives.</p>
            </div>
          </div>
        </div>
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div>
  </div>
</div>

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
        <form action="<%=request.getContextPath()%>/reg" method="post">
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
