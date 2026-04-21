<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.json.JSONArray, org.json.JSONObject" %>
<style>
    /* Template 6 specific styles */
    .resume {
        width: 100%;
        background: white;
        border-radius: 15px;
        overflow: hidden;
        box-shadow: 0 20px 40px rgba(0,0,0,0.2);
    }
    .header {
        background: linear-gradient(135deg, #667eea, #764ba2);
        color: white;
        padding: 40px;
        text-align: center;
    }
    .header h1 {
        margin: 0;
        font-weight: bold;
    }
    .contact {
        margin-top: 10px;
        font-size: 14px;
    }
    .body {
        display: flex;
        flex-wrap: wrap;
    }
    .left {
        width: 35%;
        background: #f4f6fb;
        padding: 25px;
    }
    .right {
        width: 65%;
        padding: 25px;
    }
    .section {
        margin-bottom: 20px;
    }
    .section-title {
        font-weight: bold;
        color: #764ba2;
        border-bottom: 2px solid #764ba2;
        margin-bottom: 8px;
        padding-bottom: 3px;
    }
    .skill-badge {
        display: inline-block;
        background: #e0e7ff;
        color: #4c51bf;
        padding: 4px 10px;
        border-radius: 20px;
        margin: 3px;
        font-size: 0.85rem;
    }
    .project-title {
        font-weight: bold;
        color: #764ba2;
    }
    @media print {
        .resume {
            box-shadow: none;
            width: 100%;
        }
    }
    @media (max-width: 576px) {
        .body {
            flex-direction: column;
        }
        .left, .right {
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
        <h1><%= (name != null && !name.trim().isEmpty()) ? name : "Your Name" %></h1>
        <div class="contact">
            <%= email != null ? email : "email@example.com" %> | <%= phone != null ? phone : "Phone" %><br>
            <%= address != null ? address : "Address" %>
        </div>
    </div>
    <div class="body">
        <!-- LEFT COLUMN (Sidebar) -->
        <div class="left">
            <!-- Skills (with badges) -->
            <% if(skills != null && !skills.trim().isEmpty()) { %>
            <div class="section">
                <div class="section-title">Skills</div>
                <div>
                    <% for(String skill : skills.split(",")) { %>
                        <span class="skill-badge"><%= skill.trim() %></span>
                    <% } %>
                </div>
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
        </div>

        <!-- RIGHT COLUMN (Main content) -->
        <div class="right">
            <!-- Professional Summary -->
            <% if(summary != null && !summary.trim().isEmpty()) { %>
            <div class="section">
                <div class="section-title">Professional Summary</div>
                <p><%= summary %></p>
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

            <!-- References -->
            <% if(references != null && !references.trim().isEmpty()) { %>
            <div class="section">
                <div class="section-title">References</div>
                <p><%= references.replace("\n", "<br>") %></p>
            </div>
            <% } %>
        </div>
    </div>
</div>