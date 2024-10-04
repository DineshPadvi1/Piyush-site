/*=============== SHOW HIDDEN - PASSWORD ===============*/
const showHiddenPass = (loginPass, loginEye) => {
    const input = document.getElementById(loginPass);
    const iconEye = document.getElementById(loginEye);

    iconEye.addEventListener('click', () => {
        // Toggle input type and icon classes
        if (input.type === 'password') {
            input.type = 'text'; // Switch to text
            iconEye.classList.add('ri-eye-line');
            iconEye.classList.remove('ri-eye-off-line');
        } else {
            input.type = 'password'; // Switch back to password
            iconEye.classList.remove('ri-eye-line');
            iconEye.classList.add('ri-eye-off-line');
        }
    });
};

// Function to handle login
const handleLogin = async (event) => {
    event.preventDefault(); // Prevent form from submitting

    // Get email and password values
    const email = document.getElementById('login-email').value;
    const password = document.getElementById('login-pass').value;

    // Prepare data for the API request
    const data = { email, password };

    try {
        const response = await fetch('api/login', { // Update with your endpoint
            method: 'POST', // Change to POST for login
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        });

        if (!response.ok) {
            throw new Error('Login failed');
        }

        const result = await response.json();
        console.log('Login successful:', result);
        // Handle successful login (e.g., redirect to another page, store tokens, etc.)

    } catch (error) {
        console.error('Error:', error);
        // Handle error (e.g., show an error message to the user)
    }
};

// Event listener for the form submission
const loginForm = document.querySelector('.login__form');
loginForm.addEventListener('submit', handleLogin);

// Initialize the password visibility toggle
showHiddenPass('login-pass', 'login-eye');
