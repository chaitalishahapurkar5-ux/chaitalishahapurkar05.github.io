<!DOCTYPE html>
<html>
<head>
<title>Login - Resume Studio</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
body{
background: linear-gradient(135deg,#667eea,#764ba2);
height:100vh;
display:flex;
align-items:center;
justify-content:center;
}

.card{
border-radius:20px;
padding:30px;
box-shadow:0 20px 40px rgba(0,0,0,0.2);
}
</style>

</head>

<body>

<div class="card" style="width:400px">

<h3 class="text-center mb-4">Login</h3>

<form action="LoginServlet" method="post">

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<button class="btn btn-primary w-100">
Login
</button>

<p class="text-center mt-3">
Don't have account?
<a href="register.jsp">Register</a>
</p>

</form>

</div>

</body>
</html>