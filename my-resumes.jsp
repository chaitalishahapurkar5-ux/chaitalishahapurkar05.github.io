<%@ page session="true" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="com.resumebuilder.dao.ResumeDAO" %>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Resumes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body { background: #f8faff; }
        .navbar-custom { background: linear-gradient(135deg, #667eea, #764ba2); }
        .resume-card { transition: transform 0.2s; }
        .resume-card:hover { transform: translateY(-5px); }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark navbar-custom">
    <div class="container">
        <a class="navbar-brand" href="dashboard.jsp">Resume Studio</a>
        <div class="ms-auto">
            <a href="dashboard.jsp" class="btn btn-outline-light me-2">Dashboard</a>
            <a href="LogoutServlet" class="btn btn-outline-light">Logout</a>
        </div>
    </div>
</nav>

<div class="container mt-5">
    <h2 class="mb-4"><i class="fas fa-file-alt me-2"></i>My Resumes</h2>
    
    <% if(request.getParameter("msg") != null) { %>
        <div class="alert alert-success">Resume deleted successfully!</div>
    <% } %>
    <% if(request.getParameter("error") != null) { %>
        <div class="alert alert-danger">Failed to delete resume.</div>
    <% } %>
    
    <div class="row">
        <%
            Integer userId = (Integer) session.getAttribute("userId");
            if (userId == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            ResumeDAO dao = new ResumeDAO();
            ResultSet rs = dao.getResumesByUser(userId);
            boolean hasResumes = false;
            while (rs != null && rs.next()) {
                hasResumes = true;
                int resumeId = rs.getInt("id");
                int templateId = rs.getInt("template_id");
                String resumeDataJson = rs.getString("resume_data");
                JSONObject resume = new JSONObject(resumeDataJson);
                String name = resume.optString("name", "Untitled");
                String createdAt = rs.getString("created_at");
        %>
        <div class="col-md-4 mb-4">
            <div class="card resume-card shadow-sm h-100">
                <div class="card-body">
                    <h5 class="card-title"><%= name %></h5>
                    <p class="card-text text-muted small">Template <%= templateId %></p>
                    <p class="card-text"><small>Created: <%= createdAt %></small></p>
                    <div class="d-flex justify-content-between">
                        <!-- ✅ FIXED: Use PreviewResumeServlet to load the saved data -->
                        <a href="PreviewResumeServlet?id=<%= resumeId %>" class="btn btn-sm btn-primary">Preview</a>
                        <a href="create.jsp?edit=<%= resumeId %>" class="btn btn-sm btn-secondary">Edit</a>
                        <a href="DeleteResumeServlet?id=<%= resumeId %>" class="btn btn-sm btn-danger" onclick="return confirm('Delete this resume?')">Delete</a>
                    </div>
                </div>
            </div>
        </div>
        <% } 
        if (!hasResumes) { %>
            <div class="col-12 text-center py-5">
                <i class="fas fa-folder-open fa-4x text-muted mb-3"></i>
                <h4>No resumes found</h4>
                <a href="create.jsp" class="btn btn-primary mt-3">Create your first resume</a>
            </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>