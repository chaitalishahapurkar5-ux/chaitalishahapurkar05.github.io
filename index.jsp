<!DOCTYPE html>
<html>
<head>
<title>Resume Studio</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

<style>
:root {
--primary-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
}

body {
background: #f8faff;
font-family: 'Segoe UI', sans-serif;
}

/* Navbar */
.custom-navbar{
background: transparent;
position:absolute;
width:100%;
z-index:1000;
}

.navbar-brand{
font-size:22px;
}

.navbar .btn{
font-weight:500;
}

/* Hero */
.hero {
background: var(--primary-gradient);
color: white;
padding: 140px 0 100px 0;
clip-path: polygon(0 0, 100% 0, 100% 85%, 0 100%);
}

/* Cards */
.feature-card {
background: white;
border-radius: 20px;
padding: 30px;
text-align: center;
box-shadow: 0 10px 30px rgba(0,0,0,0.05);
transition: 0.3s;
}

.feature-card:hover {
transform: translateY(-10px);
box-shadow: 0 20px 40px rgba(0,0,0,0.1);
}

.feature-icon {
font-size: 3rem;
background: var(--primary-gradient);
-webkit-background-clip: text;
-webkit-text-fill-color: transparent;
margin-bottom: 20px;
}

footer{
margin-top:80px;
}
</style>

</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg custom-navbar navbar-dark">
<div class="container">

<a class="navbar-brand fw-bold text-white" href="#">
Resume Studio
</a>

<div class="ms-auto">
<a href="login.jsp" class="btn btn-light me-2 rounded-pill px-4">
Login
</a>

<a href="register.jsp" class="btn btn-outline-light rounded-pill px-4">
Register
</a>
</div>

</div>
</nav>

<!-- Hero Section -->
<div class="hero">
<div class="container text-center">

<h1 class="display-3 fw-bold mb-4">
Build Your Professional Resume
</h1>

<p class="lead fs-4 mb-5">
Create a stunning resume in minutes with our easy to use builder.
</p>

<a href="create.jsp" class="btn btn-light btn-lg px-5 py-3 rounded-pill shadow me-3">
<i class="fas fa-pen me-2"></i>Create Resume
</a>

<a href="templates.jsp" class="btn btn-outline-light btn-lg px-5 py-3 rounded-pill">
<i class="fas fa-palette me-2"></i>View Templates
</a>

</div>
</div>

<!-- Features -->
<div class="container my-5 py-5">
<div class="row g-4">

<div class="col-md-4">
<div class="feature-card">
<div class="feature-icon">
<i class="fas fa-pencil-alt"></i>
</div>
<h3>Easy Forms</h3>
<p class="text-muted">
Simple step-by-step forms to enter your details quickly.
</p>
</div>
</div>

<div class="col-md-4">
<div class="feature-card">
<div class="feature-icon">
<i class="fas fa-palette"></i>
</div>
<h3>Modern Templates</h3>
<p class="text-muted">
Choose from a variety of professionally designed templates.
</p>
</div>
</div>

<div class="col-md-4">
<div class="feature-card">
<div class="feature-icon">
<i class="fas fa-download"></i>
</div>
<h3>Download PDF</h3>
<p class="text-muted">
Export your resume as a PDF with one click.
</p>
</div>
</div>

</div>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center p-4">
© 2026 Resume Studio | All Rights Reserved
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>