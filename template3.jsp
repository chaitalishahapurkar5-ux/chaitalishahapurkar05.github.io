<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<style>
    /* Template 3 specific styles */
    .resume {
        width: 100%;
        background: white;
        padding: 30px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.1);
        border-radius: 8px;
    }
    .header {
        text-align: center;
        padding-bottom: 20px;
        border-bottom: 3px solid #667eea;
    }
    .name {
        color: #667eea;
        font-weight: bold;
    }
    .section {
        margin-top: 25px;
    }
    .section-title {
        background: #667eea;
        color: white;
        padding: 8px 15px;
        border-radius: 20px;
        display: inline-block;
        margin-bottom: 10px;
    }
    .card-box {
        background: #f8faff;
        padding: 15px;
        border-radius: 10px;
        margin-top: 5px;
    }
    .skill-badge {
        display: inline-block;
        background: #e0e7ff;
        color: #4c51bf;
        padding: 4px 12px;
        border-radius: 20px;
        margin: 3px;
        font-size: 0.9rem;
    }
    .project-item, .cert-item {
        margin-bottom: 12px;
    }
    .project-title {
        font-weight: bold;
        color: #667eea;
    }
    @media print {
        .resume {
            box-shadow: none;
            width: 100%;
        }
    }
</style>

<%
    // Retrieve attributes set by PreviewServlet
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
    
    JSONArray projects = null;
    JSONArray certifications = null;
    try {
        if (projectsJson != null && !projectsJson.trim().isEmpty())
            projects = new JSONArray(projectsJson);
        if (certificationsJson != null && !certificationsJson.trim().isEmpty())
            certifications = new JSONArray(certificationsJson);
    } catch (Exception e) { /* ignore */ }
%>

<div class="resume">
    <div class="header">
        <h2 class="name"><%= (name != null && !name.trim().isEmpty()) ? name : "Your Name" %></h2>
        <p><%= email != null ? email : "email@example.com" %> | <%= phone != null ? phone : "Phone" %></p>
        <p><%= address != null ? address : "Address" %></p>
    </div>

    <!-- Professional Summary -->
    <% if(summary != null && !summary.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Professional Summary</div>
        <div class="card-box"><%= summary %></div>
    </div>
    <% } %>

    <!-- Skills (with badges) -->
    <% if(skills != null && !skills.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Technical Skills</div>
        <div class="card-box">
            <% for(String skill : skills.split(",")) { %>
                <span class="skill-badge"><%= skill.trim() %></span>
            <% } %>
        </div>
    </div>
    <% } %>

    <!-- Education -->
    <% if(education != null && !education.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Education</div>
        <div class="card-box"><%= education.replace("\n", "<br>") %></div>
    </div>
    <% } %>

    <!-- Work Experience -->
    <% if(experience != null && !experience.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Work Experience</div>
        <div class="card-box"><%= experience.replace("\n", "<br>") %></div>
    </div>
    <% } %>

    <!-- Projects -->
    <% if(projects != null && projects.length() > 0) { %>
    <div class="section">
        <div class="section-title">Projects</div>
        <div class="card-box">
            <% for(int i = 0; i < projects.length(); i++) {
                JSONObject proj = projects.getJSONObject(i);
                String title = proj.optString("title", "");
                String desc = proj.optString("description", "");
                if(!title.trim().isEmpty()) { %>
                <div class="project-item">
                    <div class="project-title"><%= title %></div>
                    <div><%= desc.replace("\n", "<br>") %></div>
                </div>
            <% } } %>
        </div>
    </div>
    <% } %>

    <!-- Certifications -->
    <% if(certifications != null && certifications.length() > 0) { %>
    <div class="section">
        <div class="section-title">Certifications</div>
        <div class="card-box">
            <ul>
                <% for(int i = 0; i < certifications.length(); i++) { %>
                    <li><%= certifications.getString(i) %></li>
                <% } %>
            </ul>
        </div>
    </div>
    <% } %>

    <!-- Languages -->
    <% if(languages != null && !languages.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Languages</div>
        <div class="card-box"><%= languages %></div>
    </div>
    <% } %>

    <!-- References -->
    <% if(references != null && !references.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">References</div>
        <div class="card-box"><%= references.replace("\n", "<br>") %></div>
    </div>
    <% } %>
</div>