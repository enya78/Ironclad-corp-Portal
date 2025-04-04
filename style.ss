It looks like the provided code snippet is a complete CSS stylesheet for a web application. However, to ensure everything is properly defined and functional, you should include the CSS variables (custom properties) that are being referenced in the styles, such as `--dark`, `--secondary`, `--transition`, `--radius`, `--shadow`, `--primary`, `--primary-light`, `--primary-dark`, and `--error`. These variables should be defined in a `:root` selector at the beginning of your CSS file.

Here's the complete CSS code with the missing CSS variables added:

```css
:root {
    --dark: #111827;
    --secondary: #4b5563;
    --transition: all 0.3s ease;
    --radius: 0.375rem;
    --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    --primary: #2563eb;
    --primary-light: #93c5fd;
    --primary-dark: #1d4ed8;
    --error: #b91c1c;
}

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
}

body {
    background-color: #f1f5f9;
    color: var(--dark);
    line-height: 1.6;
}

.app-container {
    display: flex;
    min-height: 100vh;
}

/* Sidebar */
.sidebar {
    width: 250px;
    background: var(--secondary);
    color: white;
    padding: 1.5rem 1rem;
    transition: var(--transition);
}

.logo {
    display: flex;
    align-items: center;
    gap: 0.75rem;
    font-size: 1.25rem;
    font-weight: 600;
    margin-bottom: 2rem;
    padding: 0 0.5rem;
}

.nav-menu {
    list-style: none;
}

.nav-item {
    margin-bottom: 0.5rem;
}

.nav-link {
    display: flex;
    align-items: center;
    padding: 0.75rem 1rem;
    border-radius: var(--radius);
    color: rgba(255, 255, 255, 0.8);
    text-decoration: none;
    transition: var(--transition);
    gap: 0.75rem;
}

.nav-link:hover, .nav-link.active {
    background: rgba(255, 255, 255, 0.1);
    color: white;
}

.nav-link i {
    width: 20px;
    text-align: center;
}

/* Main Content */
.main-content {
    flex: 1;
    padding: 2rem;
    overflow-y: auto;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 2rem;
    padding-bottom: 1rem;
    border-bottom: 1px solid #e2e8f0;
}

.user-menu {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.avatar {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    object-fit: cover;
    border: 2px solid var(--primary-light);
}

/* Modules */
.module {
    display: none;
    animation: fadeIn 0.3s ease-out;
}

@keyframes fadeIn {
    from { opacity: 0; transform: translateY(10px); }
    to { opacity: 1; transform: translateY(0); }
}

.module.active {
    display: block;
}

/* Common Components */
.card {
    background: white;
    border-radius: var(--radius);
    padding: 1.5rem;
    box-shadow: var(--shadow);
    margin-bottom: 1.5rem;
}

.form-group {
    margin-bottom: 1.25rem;
}

label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: 500;
    color: var(--secondary);
}

input, select, textarea {
    width: 100%;
    padding: 0.875rem 1rem;
    border: 1px solid #e2e8f0;
    border-radius: var(--radius);
    font-size: 1rem;
    transition: var(--transition);
    background-color: #f8fafc;
}

input:focus, select:focus, textarea:focus {
    outline: none;
    border-color: var(--primary);
    box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.1);
    background-color: white;
}

.btn {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    padding: 0.875rem 1.75rem;
    background: var(--primary);
    color: white;
    border: none;
    border-radius: var(--radius);
    font-weight: 500;
    cursor: pointer;
    transition: var(--transition);
    gap: 0.5rem;
}

.btn:hover {
    background: var(--primary-dark);
    transform: translateY(-2px);
}

.btn-block {
    width: 100%;
}

/* Payment Module */
.payment-methods {
    display: flex;
    gap: 1rem;
    margin-bottom: 1.5rem;
}

.payment-method {
    flex: 1;
}

.payment-radio {
    position: absolute;
    opacity: 0;
}

.payment-label {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    padding: 1.5rem 1rem;
    border: 1px solid #e2e8f0;
    border-radius: var(--radius);
    cursor: pointer;
    transition: var(--transition);
    background: white;
}

.payment-radio:checked + .payment-label {
    border-color: var(--primary);
    background-color: rgba(59, 130, 246, 0.05);
}

.payment-icon {
    font-size: 1.75rem;
    margin-bottom: 0.75rem;
    color: var(--primary);
}

/* HRIS Module */
.employee-table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 1.5rem;
}

.employee-table th, .employee-table td {
    padding: 1rem;
    text-align: left;
    border-bottom: 1px solid #e2e8f0;
}

.employee-table th {
    background-color: #f8fafc;
    font-weight: 600;
    color: var(--secondary);
}

.status-badge {
    display: inline-block;
    padding: 0.25rem 0.5rem;
    border-radius: 1rem;
    font-size: 0.75rem;
    font-weight: 500;
}

.status-active {
    background-color: #d1fae5;
    color: #065f46;
}

.status-pending {
    background-color: #fef3c7;
    color: #92400e;
}

/* Login Page */
.login-container {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    padding: 2rem;
}

.login-card {
    width: 100%;
    max-width: 400px;
    background: white;
    border-radius: var(--radius);
    padding: 2rem;
    box-shadow: var(--shadow);
}

.login-logo {
    display: flex;
    align-items: center;
    justify-content: center;
    gap: 0.75rem;
    font-size: 1.5rem;
    font-weight: 600;
    margin-bottom: 1.5rem;
    color: var(--primary);
}

.error-message {
    color: var(--error);
    font-size: 0.875rem;
    margin-top: 0.25rem;
    display: none;
}

/* Responsive */
@media (max-width: 768px) {
    .app-container {
        flex-direction: column;
    }
    
    .sidebar {
        width: 100%;
        padding: 1rem;
    }
    
    .payment-methods {
        flex-direction: column;
    }
}
```
