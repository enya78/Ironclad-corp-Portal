<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ironclad Corp Portal</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1e40af;
            --primary-light: #93c5fd;
            --secondary: #1e293b;
            --accent: #f59e0b;
            --light: #f8fafc;
            --dark: #0f172a;
            --gray: #64748b;
            --success: #10b981;
            --error: #ef4444;
            --radius: 8px;
            --shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
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
    </style>
</head>
<body>
    <!-- Login Page -->
    <div id="login-container" class="login-container">
        <div class="login-card">
            <div class="login-logo">
                <i class="fas fa-shield-alt"></i>
                <span>Ironclad Corp</span>
            </div>
            <form id="login-form">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" id="username" placeholder="Enter your username" required>
                    <div class="error-message" id="username-error">Please enter your username</div>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" placeholder="Enter your password" required>
                    <div class="error-message" id="password-error">Please enter your password</div>
                </div>
                <button type="submit" class="btn btn-block">
                    <i class="fas fa-sign-in-alt"></i> Login
                </button>
                <div class="error-message" id="login-error" style="text-align: center; margin-top: 1rem;">Invalid username or password</div>
            </form>
        </div>
    </div>

    <!-- Main App -->
    <div id="app-container" class="app-container" style="display: none;">
        <!-- Sidebar -->
        <div class="sidebar">
            <div class="logo">
                <i class="fas fa-shield-alt"></i>
                <span>Ironclad</span>
            </div>
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="#" class="nav-link active" data-module="dashboard">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" data-module="payment">
                        <i class="fas fa-money-bill-wave"></i>
                        <span>Payment Info</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" data-module="hris" id="hris-link">
                        <i class="fas fa-users"></i>
                        <span>HRIS</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#" class="nav-link" data-module="profile">
                        <i class="fas fa-user"></i>
                        <span>My Profile</span>
                    </a>
                </li>
            </ul>
        </div>

        <!-- Main Content -->
        <div class="main-content">
            <div class="header">
                <h2 id="module-title">Dashboard</h2>
                <div class="user-menu">
                    <div style="text-align: right;">
                        <div style="font-weight: 500;" id="user-display-name">John Doe</div>
                        <div style="font-size: 0.875rem; color: var(--gray);" id="user-role">Employee</div>
                    </div>
                    <img src="https://randomuser.me/api/portraits/men/32.jpg" alt="User" class="avatar" id="user-avatar">
                    <button onclick="logout()" class="btn" style="padding: 0.5rem 1rem;">
                        <i class="fas fa-sign-out-alt"></i>
                    </button>
                </div>
            </div>

            <!-- Dashboard Module -->
            <div id="dashboard-module" class="module active">
                <div class="card">
                    <h3>Welcome, <span id="welcome-name">John</span>!</h3>
                    <p style="margin-top: 0.5rem; color: var(--gray);">Here's what's happening today.</p>
                </div>
                
                <div class="card">
                    <h3>Quick Actions</h3>
                    <div style="display: grid; grid-template-columns: repeat(auto-fit, minmax(200px, 1fr)); gap: 1rem; margin-top: 1rem;">
                        <button class="btn" onclick="switchModule('payment')">
                            <i class="fas fa-money-bill-wave"></i> Update Payment
                        </button>
                        <button class="btn" onclick="switchModule('profile')">
                            <i class="fas fa-user-edit"></i> Edit Profile
                        </button>
                        <button class="btn" id="hris-action-btn" style="display: none;">
                            <i class="fas fa-users"></i> Manage Employees
                        </button>
                    </div>
                </div>
            </div>

            <!-- Payment Module -->
            <div id="payment-module" class="module">
                <div class="card">
                    <h3>Payment Information</h3>
                    <p style="margin-bottom: 1.5rem; color: var(--gray);">Select your preferred payment method</p>
                    
                    <div class="payment-methods">
                        <div class="payment-method">
                            <input type="radio" id="bankTransfer" name="paymentMethod" value="bank" checked class="payment-radio">
                            <label for="bankTransfer" class="payment-label">
                                <i class="fas fa-university payment-icon"></i>
                                <span>Bank Transfer</span>
                            </label>
                        </div>
                        <div class="payment-method">
                            <input type="radio" id="paypal" name="paymentMethod" value="paypal" class="payment-radio">
                            <label for="paypal" class="payment-label">
                                <i class="fab fa-paypal payment-icon"></i>
                                <span>PayPal</span>
                            </label>
                        </div>
                    </div>
                    
                    <div id="bankDetails" style="margin-top: 1.5rem;">
                        <div class="form-group">
                            <label for="accountHolder">Account Holder Name</label>
                            <input type="text" id="accountHolder" placeholder="As appears on bank account">
                        </div>
                        <div class="form-group">
                            <label for="bankName">Bank Name</label>
                            <input type="text" id="bankName" placeholder="Bank name">
                        </div>
                        <div class="form-group">
                            <label for="accountNumber">Account Number</label>
                            <input type="text" id="accountNumber" placeholder="123456789">
                        </div>
                        <div class="form-group">
                            <label for="routingNumber">Routing Number</label>
                            <input type="text" id="routingNumber" placeholder="021000021">
                        </div>
                    </div>
                    
                    <div id="paypalDetails" style="display: none; margin-top: 1.5rem;">
                        <div class="form-group">
                            <label for="paypalEmail">PayPal Email</label>
                            <input type="email" id="paypalEmail" placeholder="your.email@example.com">
                        </div>
                    </div>
                    
                    <button class="btn btn-block" id="savePaymentBtn" style="margin-top: 1.5rem;">
                        <i class="fas fa-save"></i> Save Payment Information
                    </button>
                    <div id="save-success" style="color: var(--success); text-align: center; margin-top: 1rem; display: none;">
                        <i class="fas fa-check-circle"></i> Payment information saved successfully!
                    </div>
                </div>
            </div>

            <!-- HRIS Module -->
            <div id="hris-module" class="module">
                <div class="card">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1.5rem;">
                        <h3>Employee Management</h3>
                        <button class="btn" id="add-employee-btn">
                            <i class="fas fa-plus"></i> Add Employee
                        </button>
                    </div>
                    
                    <table class="employee-table">
                        <thead>
                            <tr>
                                <th>Employee ID</th>
                                <th>Name</th>
                                <th>Department</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody id="employee-table-body">
                            <!-- Employees will be loaded here -->
                        </tbody>
                    </table>
                </div>
            </div>

            <!-- Profile Module -->
            <div id="profile-module" class="module">
                <div class="card">
                    <h3>My Profile</h3>
                    
                    <div class="form-group">
                        <label for="profile-name">Full Name</label>
                        <input type="text" id="profile-name" placeholder="Your full name">
                    </div>
                    
                    <div class="form-group">
                        <label for="profile-email">Email</label>
                        <input type="email" id="profile-email" placeholder="your.email@company.com">
                    </div>
                    
                    <div class="form-group">
                        <label for="profile-department">Department</label>
                        <input type="text" id="profile-department" placeholder="Your department">
                    </div>
                    
                    <div class="form-group">
                        <label for="profile-position">Position</label>
                        <input type="text" id="profile-position" placeholder="Your position">
                    </div>
                    
                    <button class="btn btn-block" id="save-profile-btn">
                        <i class="fas fa-save"></i> Save Profile
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        // Sample database
        const database = {
            users: {
                admin: {
                    password: 'admin123',
                    name: 'Admin User',
                    role: 'Admin',
                    avatar: 'https://randomuser.me/api/portraits/men/32.jpg',
                    department: 'Management',
                    position: 'System Administrator',
                    paymentMethod: 'bank',
                    bankDetails: {
                        accountHolder: 'Admin User',
                        bankName: 'Chase Bank',
                        accountNumber: '******3456',
                        routingNumber: '021000021'
                    },
                    permissions: {
                        hris: true
                    }
                },
                employee1: {
                    password: 'employee123',
                    name: 'John Smith',
                    role: 'Employee',
                    avatar: 'https://randomuser.me/api/portraits/men/45.jpg',
                    department: 'Engineering',
                    position: 'Software Developer',
                    paymentMethod: 'paypal',
                    paypalEmail: 'john.smith@example.com',
                    permissions: {
                        hris: false
                    }
                },
                employee2: {
                    password: 'employee123',
                    name: 'Sarah Johnson',
                    role: 'Employee',
                    avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
                    department: 'Marketing',
                    position: 'Marketing Specialist',
                    paymentMethod: 'bank',
                    bankDetails: {
                        accountHolder: 'Sarah Johnson',
                        bankName: 'Bank of America',
                        accountNumber: '******7890',
                        routingNumber: '026009593'
                    },
                    permissions: {
                        hris: false
                    }
                }
            },
            employees: [
                {
                    id: 'IC-EMP-1001',
                    name: 'Admin User',
                    department: 'Management',
                    status: 'active'
                },
                {
                    id: 'IC-EMP-1002',
                    name: 'John Smith',
                    department: 'Engineering',
                    status: 'active'
                },
                {
                    id: 'IC-EMP-1003',
                    name: 'Sarah Johnson',
                    department: 'Marketing',
                    status: 'active'
                },
                {
                    id: 'IC-EMP-1004',
                    name: 'Michael Brown',
                    department: 'Sales',
                    status: 'pending'
                }
            ]
        };

        // Current user
        let currentUser = null;

        // Initialize the app
        document.addEventListener('DOMContentLoaded', function() {
            // Login form submission
            document.getElementById('login-form').addEventListener('submit', function(e) {
                e.preventDefault();
                
                // Reset error messages
                document.querySelectorAll('.error-message').forEach(el => {
                    el.style.display = 'none';
                });

                const username = document.getElementById('username').value.trim();
                const password = document.getElementById('password').value.trim();

                // Validate inputs
                if (!username) {
                    document.getElementById('username-error').style.display = 'block';
                    return;
                }
                if (!password) {
                    document.getElementById('password-error').style.display = 'block';
                    return;
                }

                // Check if user exists
                if (database.users[username] && database.users[username].password === password) {
                    currentUser = database.users[username];
                    
                    // Hide login and show app
                    document.getElementById('login-container').style.display = 'none';
                    document.getElementById('app-container').style.display = 'flex';

                    // Set user data
                    document.getElementById('user-display-name').textContent = currentUser.name;
                    document.getElementById('user-role').textContent = currentUser.role;
                    document.getElementById('user-avatar').src = currentUser.avatar;
                    document.getElementById('welcome-name').textContent = currentUser.name.split(' ')[0];
                    
                    // Load profile data
                    loadProfileData();
                    
                    // Load payment info
                    loadPaymentInfo();
                    
                    // Check permissions
                    checkPermissions();
                    
                    // Load employees for HRIS
                    loadEmployees();
                } else {
                    document.getElementById('login-error').style.display = 'block';
                }
            });

            // Payment method toggle
            document.querySelectorAll('.payment-radio').forEach(radio => {
                radio.addEventListener('change', function() {
                    document.getElementById('bankDetails').style.display = 'none';
                    document.getElementById('paypalDetails').style.display = 'none';
                    
                    if (this.value === 'bank') {
                        document.getElementById('bankDetails').style.display = 'block';
                    } else {
                        document.getElementById('paypalDetails').style.display = 'block';
                    }
                    
                    document.getElementById('save-success').style.display = 'none';
                });
            });

            // Save payment info
            document.getElementById('savePaymentBtn').addEventListener('click', function() {
                if (!currentUser) return;
                
                const paymentMethod = document.querySelector('input[name="paymentMethod"]:checked').value;
                
                if (paymentMethod === 'bank') {
                    currentUser.paymentMethod = 'bank';
                    currentUser.bankDetails = {
                        accountHolder: document.getElementById('accountHolder').value.trim(),
                        bankName: document.getElementById('bankName').value.trim(),
                        accountNumber: document.getElementById('accountNumber').value.trim(),
                        routingNumber: document.getElementById('routingNumber').value.trim()
                    };
                    delete currentUser.paypalEmail;
                } else {
                    currentUser.paymentMethod = 'paypal';
                    currentUser.paypalEmail = document.getElementById('paypalEmail').value.trim();
                    delete currentUser.bankDetails;
                }
                
                // Show success message
                const successMsg = document.getElementById('save-success');
                successMsg.style.display = 'block';
                setTimeout(() => {
                    successMsg.style.display = 'none';
                }, 3000);
                
                // In a real app, you would save to a database here
                console.log('Updated user payment info:', currentUser);
            });

            // Navigation
            document.querySelectorAll('.nav-link').forEach(link => {
                link.addEventListener('click', function(e) {
                    e.preventDefault();
                    const module = this.getAttribute('data-module');
                    switchModule(module);
                });
            });

            // Add employee button
            document.getElementById('add-employee-btn').addEventListener('click', function() {
                alert('In a complete implementation, this would open a form to add a new employee.');
            });

            // Save profile
            document.getElementById('save-profile-btn').addEventListener('click', function() {
                if (!currentUser) return;
                
                currentUser.name = document.getElementById('profile-name').value.trim();
                currentUser.email = document.getElementById('profile-email').value.trim();
                currentUser.department = document.getElementById('profile-department').value.trim();
                currentUser.position = document.getElementById('profile-position').value.trim();
                
                // Update display
                document.getElementById('user-display-name').textContent = currentUser.name;
                document.getElementById('welcome-name').textContent = currentUser.name.split(' ')[0];
                
                alert('Profile updated successfully!');
            });
        });

        // Load payment information
        function loadPaymentInfo() {
            if (!currentUser) return;
            
            if (currentUser.paymentMethod === 'bank') {
                document.getElementById('bankTransfer').checked = true;
                document.getElementById('bankDetails').style.display = 'block';
                
                if (currentUser.bankDetails) {
                    document.getElementById('accountHolder').value = currentUser.bankDetails.accountHolder || '';
                    document.getElementById('bankName').value = currentUser.bankDetails.bankName || '';
                    document.getElementById('accountNumber').value = currentUser.bankDetails.accountNumber || '';
                    document.getElementById('routingNumber').value = currentUser.bankDetails.routingNumber || '';
                }
            } else if (currentUser.paymentMethod === 'paypal') {
                document.getElementById('paypal').checked = true;
                document.getElementById('paypalDetails').style.display = 'block';
                document.getElementById('paypalEmail').value = currentUser.paypalEmail || '';
            }
        }

        // Load profile data
        function loadProfileData() {
            if (!currentUser) return;
            
            document.getElementById('profile-name').value = currentUser.name || '';
            document.getElementById('profile-email').value = currentUser.email || '';
            document.getElementById('profile-department').value = currentUser.department || '';
            document.getElementById('profile-position').value = currentUser.position || '';
        }

        // Check user permissions
        function checkPermissions() {
            if (!currentUser) return;
            
            // Show/hide HRIS based on permissions
            if (currentUser.permissions?.hris) {
                document.getElementById('hris-link').style.display = 'flex';
                document.getElementById('hris-action-btn').style.display = 'flex';
            } else {
                document.getElementById('hris-link').style.display = 'none';
                document.getElementById('hris-action-btn').style.display = 'none';
            }
        }

        // Load employees for HRIS
        function loadEmployees() {
            const tbody = document.getElementById('employee-table-body');
            tbody.innerHTML = '';
            
            database.employees.forEach(employee => {
                const row = document.createElement('tr');
                
                row.innerHTML = `
                    <td>${employee.id}</td>
                    <td>${employee.name}</td>
                    <td>${employee.department}</td>
                    <td>
                        <span class="status-badge ${employee.status === 'active' ? 'status-active' : 'status-pending'}">
                            ${employee.status}
                        </span>
                    </td>
                    <td>
                        <button class="btn" style="padding: 0.25rem 0.5rem; font-size: 0.875rem;">
                            <i class="fas fa-edit"></i>
                        </button>
                        <button class="btn" style="padding: 0.25rem 0.5rem; font-size: 0.875rem; margin-left: 0.5rem;">
                            <i class="fas fa-trash"></i>
                        </button>
                    </td>
                `;
                
                tbody.appendChild(row);
            });
        }

        // Switch between modules
        function switchModule(moduleName) {
            // Hide all modules
            document.querySelectorAll('.module').forEach(module => {
                module.classList.remove('active');
            });
            
            // Show selected module
            document.getElementById(`${moduleName}-module`).classList.add('active');
            
            // Update active nav link
            document.querySelectorAll('.nav-link').forEach(link => {
                link.classList.remove('active');
            });
            document.querySelector(`.nav-link[data-module="${moduleName}"]`).classList.add('active');
            
            // Update title
            document.getElementById('module-title').textContent = moduleName.charAt(0).toUpperCase() + moduleName.slice(1);
        }

        // Logout
        function logout() {
            currentUser = null;
            
            // Hide app and show login
            document.getElementById('app-container').style.display = 'none';
            document.getElementById('login-container').style.display = 'flex';

            // Clear form fields
            document.getElementById('username').value = '';
            document.getElementById('password').value = '';
            document.querySelectorAll('.error-message').forEach(el => {
                el.style.display = 'none';
            });
        }
    </script>
</body>
</html>
