<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
    <title>Resume Preview - Template 2</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * { margin: 0; padding: 0; box-sizing: border-box; }
        body { background: #eef2f5; font-family: 'Segoe UI', sans-serif; padding: 40px 0; }
        .resume-card { max-width: 1000px; margin: 0 auto; background: white; box-shadow: 0 20px 40px rgba(0,0,0,0.1); border-radius: 12px; overflow: hidden; }
        .resume-header { background: linear-gradient(135deg, #11998e, #38ef7d); color: white; padding: 35px 40px; }
        .resume-header h1 { font-size: 2.8rem; font-weight: 700; margin-bottom: 8px; }
        .contact-info { display: flex; flex-wrap: wrap; gap: 20px; font-size: 0.95rem; margin-top: 15px; }
        .contact-info i { width: 22px; margin-right: 8px; }
        .resume-body { padding: 40px; }
        .section { margin-bottom: 30px; border-bottom: 1px solid #e0e6ed; padding-bottom: 20px; }
        .section-title { font-size: 1.4rem; font-weight: 700; color: #2c3e50; margin-bottom: 15px; border-left: 5px solid #38ef7d; padding-left: 15px; display: flex; align-items: center; gap: 10px; }
        .section-title i { color: #38ef7d; }
        .item-title { font-weight: 700; font-size: 1.1rem; color: #1a2632; }
        .item-subtitle { font-weight: 600; color: #38ef7d; margin-bottom: 5px; }
        .item-date { font-size: 0.85rem; color: #7f8c8d; margin-bottom: 8px; }
        .item-desc { line-height: 1.5; color: #2c3e50; }
        .skills-grid { display: flex; flex-wrap: wrap; gap: 10px; margin-top: 8px; }
        .skill-badge { background: #ecf0f1; padding: 5px 14px; border-radius: 30px; font-size: 0.85rem; color: #2c3e50; }
        .two-column { display: flex; gap: 30px; flex-wrap: wrap; }
        .left-col { flex: 1.2; }
        .right-col { flex: 0.8; }
        @media print { body { background: white; padding: 0; } .resume-card { box-shadow: none; margin: 0; border-radius: 0; } }
    </style>
</head>
<body>
<%
    String name = (String) request.getAttribute("name");
    String email = (String) request.getAttribute("email");
    String phone = (String) request.getAttribute("phone");
    String address = (String) request.getAttribute("address");
    String summary = (String) request.getAttribute("summary");
    String skills = (String) request.getAttribute("skills");
    String education = (String) request.getAttribute("education");
    String experience = (String) request.getAttribute("experience");
    String languages = (String) request.getAttribute("languages");
    String references = (String) request.getAttribute("references");
    String projectsJson = (String) request.getAttribute("projectsJson");
    String certificationsJson = (String) request.getAttribute("certificationsJson");
    JSONArray projects = null, certifications = null;
    try {
        if (projectsJson != null && !projectsJson.trim().isEmpty()) projects = new JSONArray(projectsJson);
        if (certificationsJson != null && !certificationsJson.trim().isEmpty()) certifications = new JSONArray(certificationsJson);
    } catch (Exception e) {}
%>
<div class="resume-card">
    <div class="resume-header">
        <h1><%= (name != null && !name.trim().isEmpty()) ? name : "Your Name" %></h1>
        <div class="contact-info">
            <% if(email != null && !email.trim().isEmpty()) { %><span><i class="fas fa-envelope"></i> <%= email %></span><% } %>
            <% if(phone != null && !phone.trim().isEmpty()) { %><span><i class="fas fa-phone-alt"></i> <%= phone %></span><% } %>
            <% if(address != null && !address.trim().isEmpty()) { %><span><i class="fas fa-map-marker-alt"></i> <%= address %></span><% } %>
        </div>
    </div>
    <div class="resume-body">
        <% if(summary != null && !summary.trim().isEmpty()) { %>
        <div class="section"><div class="section-title"><i class="fas fa-user-edit"></i> Professional Summary</div><p class="item-desc"><%= summary %></p></div>
        <% } %>
        <div class="two-column">
            <div class="left-col">
                <% if(education != null && !education.trim().isEmpty()) { %>
                <div class="section"><div class="section-title"><i class="fas fa-graduation-cap"></i> Education</div><div class="item-desc"><%= education.replace("\n", "<br>") %></div></div>
                <% } %>
                <% if(experience != null && !experience.trim().isEmpty()) { %>
                <div class="section"><div class="section-title"><i class="fas fa-briefcase"></i> Work Experience</div><div class="item-desc"><%= experience.replace("\n", "<br>") %></div></div>
                <% } %>
                <% if(projects != null && projects.length() > 0) { %>
                <div class="section"><div class="section-title"><i class="fas fa-code-branch"></i> Projects</div>
                    <% for(int i = 0; i < projects.length(); i++) { JSONObject proj = projects.getJSONObject(i); String title = proj.optString("title",""), desc = proj.optString("description",""); if(!title.trim().isEmpty()) { %>
                    <div class="mb-3"><div class="item-title"><%= title %></div><div class="item-desc"><%= desc.replace("\n", "<br>") %></div></div>
                <% } } %>
                </div>
                <% } %>
            </div>
            <div class="right-col">
                <% if(skills != null && !skills.trim().isEmpty()) { %>
                <div class="section"><div class="section-title"><i class="fas fa-code"></i> Technical Skills</div><div class="skills-grid"><% for(String skill : skills.split(",")) { %><span class="skill-badge"><%= skill.trim() %></span><% } %></div></div>
                <% } %>
                <% if(certifications != null && certifications.length() > 0) { %>
                <div class="section"><div class="section-title"><i class="fas fa-certificate"></i> Certifications</div><ul class="ps-3"><% for(int i = 0; i < certifications.length(); i++) { %><li><%= certifications.getString(i) %></li><% } %></ul></div>
                <% } %>
                <% if(languages != null && !languages.trim().isEmpty()) { %>
                <div class="section"><div class="section-title"><i class="fas fa-language"></i> Languages</div><div class="skills-grid"><span class="skill-badge"><%= languages %></span></div></div>
                <% } %>
                <% if(references != null && !references.trim().isEmpty()) { %>
                <div class="section"><div class="section-title"><i class="fas fa-address-card"></i> References</div><div class="item-desc"><%= references.replace("\n", "<br>") %></div></div>
                <% } %>
            </div>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>