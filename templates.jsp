<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> Resume Studio</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<style>
:root {
    --primary-gradient: linear-gradient(135deg, #667eea, #764ba2);
}

body {
    background: #f8faff;
    font-family: 'Segoe UI', sans-serif;
}

/* Navbar */
.navbar-custom {
    background: var(--primary-gradient);
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

/* Card */
.template-card {
    background: white;
    border-radius: 20px;
    padding: 18px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.08);
    transition: 0.3s;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.template-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 20px 35px rgba(0,0,0,0.12);
}

/* Preview */
.template-preview {
    border-radius: 12px;
    margin-bottom: 15px;
    overflow: hidden;
    background: #f0f2fa;
    position: relative;
    aspect-ratio: 3 / 4;
}

/* Image */
.template-img {
    width: 100%;
    height: 100%;
    object-fit: contain;   /* changed from cover */
    background: white;
    padding: 8px;
}

/* Title */
.template-title {
    font-weight: 600;
    font-size: 1.05rem;
    margin-top: 5px;
}

/* Button */
.btn-select {
    background: var(--primary-gradient);
    border: none;
    border-radius: 40px;
    padding: 10px;
    font-weight: 500;
    margin-top: auto;
}

.btn-select:hover {
    opacity: 0.9;
}

/* Header */
.page-header {
    background: var(--primary-gradient);
    color: white;
    padding: 40px;
    margin-bottom: 40px;
    border-radius: 0 0 30px 30px;
}

/* mockup fallback */
.mockup {
    width: 100%;
    height: 100%;
    display: flex;
    flex-direction: column;
    padding: 15px;
}

.mockup-header {
    height: 30px;
    border-radius: 8px;
    margin-bottom: 12px;
}

.mockup-line {
    height: 8px;
    border-radius: 4px;
    margin-bottom: 8px;
    background: #ddd;
}

.mockup-1 { background: #2d3561; }
.mockup-2 { background: #f5f7fa; }
.mockup-3 { background: #fef9e6; }
.mockup-4 { background: #e8f0fe; }
.mockup-5 { background: #fdeff2; }
.mockup-6 { background: #e8f8f5; }

</style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
<div class="container">

<a class="navbar-brand fw-bold" href="dashboard.jsp">
Resume Studio
</a>

<div class="ms-auto">
<a href="dashboard.jsp" class="btn btn-outline-light me-2">Dashboard</a>
<a href="create.jsp" class="btn btn-light">Create Resume</a>
</div>

</div>
</nav>

<!-- Header -->
<div class="page-header text-center">
<h2>Choose Your Signature Template</h2>
<p class="opacity-75">Professional designs crafted to impress recruiters</p>
</div>

<div class="container">
<div class="row g-4">

<% for (int i = 1; i <= 6; i++) { %>

<div class="col-md-6 col-lg-4">
<div class="template-card">

<div class="template-preview">

<img src="images/template<%= i %>.png"
class="template-img"
onerror="this.style.display='none'; this.nextElementSibling.style.display='flex';">

<div class="mockup mockup-<%= i %>" style="display:none;">
<div class="mockup-header"></div>
<div class="mockup-line"></div>
<div class="mockup-line"></div>
<div class="mockup-line"></div>
</div>

</div>

<div class="template-title">
Template <%= i %>
</div>

<p class="text-muted small">
Modern professional layout
</p>

<a href="create.jsp?template=<%= i %>"
class="btn btn-primary btn-select w-100">
Use Template
</a>

</div>
</div>

<% } %>

</div>
</div>

</body>
</html>