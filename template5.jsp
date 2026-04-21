<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<style>
    /* Template 5 specific styles */
    .resume {
        width: 100%;
        background: white;
        box-shadow: 0 10px 30px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
    }
    .header {
        background: #1e3a8a;
        color: white;
        padding: 25px;
    }
    .header h2 {
        margin: 0;
    }
    .contact {
        font-size: 14px;
        margin-top: 5px;
    }
    .content {
        padding: 30px;
    }
    .section {
        margin-bottom: 20px;
    }
    .section-title {
        color: #1e3a8a;
        font-weight: bold;
        border-left: 5px solid #1e3a8a;
        padding-left: 10px;
        margin-bottom: 8px;
    }
    .skill-badge {
        display: inline-block;
        background: #e0e7ff;
        color: #1e3a8a;
        padding: 4px 12px;
        border-radius: 20px;
        margin: 3px;
        font-size: 0.85rem;
    }
    .project-title {
        font-weight: bold;
        color: #1e3a8a;
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
        <h2><%= (name != null && !name.trim().isEmpty()) ? name : "Your Name" %></h2>
        <div class="contact">
            <%= email != null ? email : "email@example.com" %> | <%= phone != null ? phone : "Phone" %><br>
            <%= address != null ? address : "Address" %>
        </div>
    </div>
    <div class="content">
        <!-- Professional Summary -->
        <% if(summary != null && !summary.trim().isEmpty()) { %>
        <div class="section">
            <div class="section-title">Professional Summary</div>
            <p><%= summary %></p>
        </div>
        <% } %>

        <!-- Skills with badges -->
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
                <div style="margin-bottom: 15px;">
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
</div>