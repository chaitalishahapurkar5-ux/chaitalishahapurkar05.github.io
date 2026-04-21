<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Resume</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<style>
:root {
    --primary-gradient: linear-gradient(135deg,#667eea,#764ba2);
}

body {
    background:#f8faff;
    font-family:'Segoe UI',sans-serif;
}

/* Navbar */
.custom-navbar {
    background: var(--primary-gradient);
}

/* Form Card */
.form-card {
    background:white;
    border-radius:20px;
    padding:40px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
}

/* Preview Card */
.preview-card {
    background:white;
    border-radius:20px;
    padding:30px;
    box-shadow:0 10px 30px rgba(0,0,0,0.08);
    position: sticky;
    top: 20px;
    max-height: 90vh;
    overflow-y: auto;
}

.page-header {
    background: var(--primary-gradient);
    color:white;
    padding:40px 0;
    margin-bottom:40px;
}

.btn-save {
    background: var(--primary-gradient);
    border: none;
    padding: 12px;
    font-weight: bold;
}

.btn-save:hover {
    opacity: 0.9;
    transform: scale(0.98);
}

.print-btn {
    position: fixed;
    bottom: 20px;
    right: 20px;
    z-index: 1000;
    border-radius: 50px;
    padding: 10px 20px;
    box-shadow: 0 2px 10px rgba(0,0,0,0.2);
}

@media print {
    .form-card, .navbar, .page-header, .print-btn, .col-md-5 {
        display: none;
    }
    .preview-card {
        position: static;
        max-height: none;
        overflow: visible;
        box-shadow: none;
        padding: 0;
    }
    .col-md-7 {
        width: 100%;
    }
}
</style>
</head>

<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark custom-navbar">
    <div class="container">
        <a class="navbar-brand fw-bold" href="dashboard.jsp">Resume Studio</a>
        <div class="ms-auto">
            <a href="dashboard.jsp" class="btn btn-outline-light me-2">Dashboard</a>
            <a href="templates.jsp" class="btn btn-outline-light">Templates</a>
        </div>
    </div>
</nav>

<!-- Header -->
<div class="page-header text-center">
    <h2>Create Your Resume</h2>
    <p>Fill the details and see live preview</p>
</div>

<!-- Form + Preview -->
<div class="container">
    <div class="row g-4">
        <!-- Form Column -->
        <div class="col-md-5">
            <div class="form-card">
                <form id="resumeForm">
                    <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input type="text" id="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="email" id="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone</label>
                        <input type="text" id="phone" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <textarea id="address" class="form-control" rows="2"></textarea>
                    </div>
                    
                    <!-- NEW: Professional Summary -->
                    <div class="mb-3">
                        <label class="form-label">Professional Summary</label>
                        <textarea id="summary" class="form-control" rows="3" placeholder="Brief overview of your experience and career goals..."></textarea>
                    </div>
                    
                    <!-- NEW: Projects (dynamic) -->
                    <div class="mb-3">
                        <label class="form-label">Projects</label>
                        <div id="projectsContainer">
                            <div class="project-entry mb-2">
                                <input type="text" class="form-control mb-1" placeholder="Project Title" id="project_title_0">
                                <textarea class="form-control mb-1" rows="2" placeholder="Project description..." id="project_desc_0"></textarea>
                            </div>
                        </div>
                        <button type="button" class="btn btn-sm btn-secondary mt-1" onclick="addProject()">+ Add Another Project</button>
                    </div>
                    
                    <!-- NEW: Certifications -->
                    <div class="mb-3">
                        <label class="form-label">Certifications</label>
                        <div id="certsContainer">
                            <div class="cert-entry mb-2">
                                <input type="text" class="form-control" placeholder="e.g., AWS Certified Developer" id="cert_0">
                            </div>
                        </div>
                        <button type="button" class="btn btn-sm btn-secondary mt-1" onclick="addCert()">+ Add Another Certification</button>
                    </div>
                    
                    <!-- NEW: Languages -->
                    <div class="mb-3">
                        <label class="form-label">Languages</label>
                        <input type="text" id="languages" class="form-control" placeholder="e.g., English (Fluent), Hindi (Native)">
                    </div>
                    
                    <!-- NEW: References -->
                    <div class="mb-3">
                        <label class="form-label">References</label>
                        <textarea id="references" class="form-control" rows="2" placeholder="Name, title, contact info (optional)"></textarea>
                    </div>
                    
                    <div class="mb-3">
                        <label class="form-label">Skills</label>
                        <textarea id="skills" class="form-control" rows="2"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Education</label>
                        <textarea id="education" class="form-control" rows="3"></textarea>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Experience</label>
                        <textarea id="experience" class="form-control" rows="3"></textarea>
                    </div>
                    <div class="mb-4">
                        <label class="form-label">Choose Template</label>
                        <select id="templateSelect" class="form-control">
                            <option value="1">Template 1 (Modern Gradient)</option>
                            <option value="2">Template 2 (Sidebar Professional)</option>
                            <option value="3">Template 3 (Card UI)</option>
                            <option value="4">Template 4 (ATS Minimal)</option>
                            <option value="5">Template 5 (Corporate)</option>
                            <option value="6">Template 6 (Creative Mode)</option>
                        </select>
                    </div>
                    <button type="button" id="saveBtn" class="btn btn-primary w-100 py-2 btn-save">
                        Save Resume
                    </button>
                </form>
            </div>
        </div>

        <!-- Preview Column -->
        <div class="col-md-7">
            <div class="preview-card">
                <h5 class="mb-3">Live Preview</h5>
                <div id="previewArea">
                    <div class="text-center text-muted py-5">Loading preview...</div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Floating Print Button -->
<button onclick="window.print()" class="btn btn-dark print-btn">
    Print / PDF
</button>

<script>
    // Helper functions to collect dynamic fields
    function getProjects() {
        var projects = [];
        $('.project-entry').each(function(index) {
            var title = $(this).find('input[type="text"]').val();
            var desc = $(this).find('textarea').val();
            if (title && title.trim() !== "") {
                projects.push({title: title, description: desc});
            }
        });
        return projects;
    }
    
    function getCertifications() {
        var certs = [];
        $('.cert-entry input').each(function() {
            var val = $(this).val();
            if (val && val.trim() !== "") {
                certs.push(val);
            }
        });
        return certs;
    }
    
    function updatePreview() {
        var formData = {
            name: $('#name').val(),
            email: $('#email').val(),
            phone: $('#phone').val(),
            address: $('#address').val(),
            summary: $('#summary').val(),
            projects: JSON.stringify(getProjects()),
            certifications: JSON.stringify(getCertifications()),
            languages: $('#languages').val(),
            references: $('#references').val(),
            skills: $('#skills').val(),
            education: $('#education').val(),
            experience: $('#experience').val(),
            templateId: $('#templateSelect').val()
        };
        
        $.ajax({
            url: 'PreviewServlet',
            type: 'POST',
            data: formData,
            success: function(html) {
                $('#previewArea').html(html);
            },
            error: function() {
                $('#previewArea').html('<div class="alert alert-danger">Error loading preview. Make sure PreviewServlet is deployed.</div>');
            }
        });
    }

    // Dynamic add/remove functions
    window.addProject = function() {
        var index = $('.project-entry').length;
        var newDiv = $('<div class="project-entry mb-2">' +
            '<input type="text" class="form-control mb-1" placeholder="Project Title" id="project_title_' + index + '">' +
            '<textarea class="form-control mb-1" rows="2" placeholder="Project description..." id="project_desc_' + index + '"></textarea>' +
            '<button type="button" class="btn btn-sm btn-danger" onclick="$(this).parent().remove(); updatePreview();">Remove</button>' +
            '</div>');
        $('#projectsContainer').append(newDiv);
        newDiv.find('input, textarea').on('input change', updatePreview);
        updatePreview();
    };
    
    window.addCert = function() {
        var index = $('.cert-entry').length;
        var newDiv = $('<div class="cert-entry mb-2">' +
            '<input type="text" class="form-control" placeholder="Certification name" id="cert_' + index + '">' +
            '<button type="button" class="btn btn-sm btn-danger mt-1" onclick="$(this).parent().remove(); updatePreview();">Remove</button>' +
            '</div>');
        $('#certsContainer').append(newDiv);
        newDiv.find('input').on('input change', updatePreview);
        updatePreview();
    };

    // Attach event listeners for all static fields
    $('input, textarea, select').on('input change', updatePreview);
    // For dynamic fields, we attach inside add functions; also initial call
    setTimeout(updatePreview, 200);

    // Save resume to database
    $('#saveBtn').click(function() {
        var resumeData = {
            name: $('#name').val(),
            email: $('#email').val(),
            phone: $('#phone').val(),
            address: $('#address').val(),
            summary: $('#summary').val(),
            projects: getProjects(),
            certifications: getCertifications(),
            languages: $('#languages').val(),
            references: $('#references').val(),
            skills: $('#skills').val(),
            education: $('#education').val(),
            experience: $('#experience').val()
        };
        
        $.post('SaveResumeServlet', {
            templateId: $('#templateSelect').val(),
            resumeData: JSON.stringify(resumeData)
        }, function(response) {
            alert('Resume saved successfully!');
            window.location.href = 'dashboard.jsp';
        }).fail(function() {
            alert('Error saving resume. Please try again.');
        });
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>