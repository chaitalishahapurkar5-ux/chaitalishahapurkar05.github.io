<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<style>
    /* Template 4 specific styles */
    .resume {
        width: 100%;
        padding: 30px;
        border: 1px solid #ddd;
        background: white;
        border-radius: 4px;
    }
    .name {
        font-size: 28px;
        font-weight: bold;
    }
    .contact {
        color: #555;
        margin-bottom: 20px;
    }
    .section {
        margin-top: 20px;
    }
    .section-title {
        font-weight: bold;
        font-size: 18px;
        border-bottom: 1px solid #000;
        margin-bottom: 8px;
    }
    .skill-badge {
        display: inline-block;
        background: #f0f0f0;
        padding: 3px 10px;
        border-radius: 15px;
        margin: 3px;
        font-size: 0.9rem;
    }
    .project-title {
        font-weight: bold;
    }
    @media print {
        .resume {
            border: none;
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
    <div class="name"><%= (name != null && !name.trim().isEmpty()) ? name : "Your Name" %></div>
    <div class="contact">
        <%= email != null ? email : "email@example.com" %> | <%= phone != null ? phone : "Phone" %><br>
        <%= address != null ? address : "Address" %>
    </div>

    <!-- Professional Summary -->
    <% if(summary != null && !summary.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Professional Summary</div>
        <p><%= summary %></p>
    </div>
    <% } %>

    <!-- Skills (with badges) -->
    <% if(skills != null && !skills.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Technical Skills</div>
        <p>
            <% for(String skill : skills.split(",")) { %>
                <span class="skill-badge"><%= skill.trim() %></span>
            <% } %>
        </p>
    </div>
    <% } %>

    <!-- Education -->
    <% if(education != null && !education.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Education</div>
        <p><%= education.replace("\n", "<br>") %></p>
    </div>
    <% } %>

    <!-- Work Experience -->
    <% if(experience != null && !experience.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Work Experience</div>
        <p><%= experience.replace("\n", "<br>") %></p>
    </div>
    <% } %>

    <!-- Projects -->
    <% if(projects != null && projects.length() > 0) { %>
    <div class="section">
        <div class="section-title">Projects</div>
        <% for(int i = 0; i < projects.length(); i++) {
            JSONObject proj = projects.getJSONObject(i);
            String title = proj.optString("title", "");
            String desc = proj.optString("description", "");
            if(!title.trim().isEmpty()) { %>
            <div style="margin-bottom: 12px;">
                <div class="project-title"><%= title %></div>
                <div><%= desc.replace("\n", "<br>") %></div>
            </div>
        <% } } %>
    </div>
    <% } %>

    <!-- Certifications -->
    <% if(certifications != null && certifications.length() > 0) { %>
    <div class="section">
        <div class="section-title">Certifications</div>
        <ul>
            <% for(int i = 0; i < certifications.length(); i++) { %>
                <li><%= certifications.getString(i) %></li>
            <% } %>
        </ul>
    </div>
    <% } %>

    <!-- Languages -->
    <% if(languages != null && !languages.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">Languages</div>
        <p><%= languages %></p>
    </div>
    <% } %>

    <!-- References -->
    <% if(references != null && !references.trim().isEmpty()) { %>
    <div class="section">
        <div class="section-title">References</div>
        <p><%= references.replace("\n", "<br>") %></p>
    </div>
    <% } %>
</div>