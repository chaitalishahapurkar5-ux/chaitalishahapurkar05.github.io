<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Resume Studio Dashboard</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background: linear-gradient(135deg, #667eea, #764ba2);
      min-height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      padding: 20px;
    }
    .dashboard-container {
      display: grid;
      grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
      gap: 30px;
      width: 100%;
      max-width: 1200px;
    }
    .dashboard-card {
      background-color: white;
      border-radius: 15px;
      text-align: center;
      padding: 50px 20px;
      color: #764ba2;
      font-weight: bold;
      font-size: 1.2rem;
      box-shadow: 0 10px 20px rgba(0,0,0,0.1);
      transition: transform 0.3s, box-shadow 0.3s;
      cursor: pointer;
      text-decoration: none;
    }
    .dashboard-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 15px 25px rgba(0,0,0,0.2);
      color: #667eea;
    }
    .logout-btn {
      position: fixed;
      top: 20px;
      right: 20px;
      background-color: #fff;
      color: #764ba2;
      font-weight: bold;
      border-radius: 50px;
      padding: 10px 20px;
      text-decoration: none;
      transition: background 0.3s, color 0.3s;
    }
    .logout-btn:hover {
      background-color: #764ba2;
      color: #fff;
    }
  </style>
</head>
<body>

  <a href="logout.jsp" class="logout-btn">Logout</a>

  <div class="dashboard-container">
    <a href="index.jsp" class="dashboard-card">Dashboard</a>
    <a href="create.jsp" class="dashboard-card">Create Resume</a>
    <a href="my-resumes.jsp" class="dashboard-card">My Resumes</a>   <!-- NEW CARD -->
    <a href="templates.jsp" class="dashboard-card">Templates</a>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>