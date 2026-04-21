<!DOCTYPE html>
<html>
<head>
<title>Register - Resume Studio</title>

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

<h3 class="text-center mb-4">Create Account</h3>

<form action="RegisterServlet" method="post">

<div class="mb-3">
<label>Name</label>
<input type="text" name="name" class="form-control" required>
</div>

<div class="mb-3">
<label>Email</label>
<input type="email" name="email" class="form-control" required>
</div>

<div class="mb-3">
<label>Password</label>
<input type="password" name="password" class="form-control" required>
</div>

<button class="btn btn-primary w-100">
Register
</button>

<p class="text-center mt-3">
Already have account?
<a href="login.jsp">Login</a>
</p>

</form>

</div>

</body>
</html>