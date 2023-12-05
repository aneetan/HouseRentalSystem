<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css" integrity="sha384-GLhlTQ8iBZ1+eaNdTOq8C6Zy5PzU2FhH8dQzFqLQxSQqmeMvq2GAgGgbDAA & # 47; 72FayeaRqYl5K7l" crossorigin="anonymous">

<%--    CSS of the login/signup page--%>
    <style>
        @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700;800&display=swap");

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body,
        input {
            font-family: "Poppins", sans-serif;
        }

        .container {
            position: relative;
            width: 100%;
            background-color: #fff;
            min-height: 100vh;
            overflow: hidden;
        }

        .forms-container {
            position: absolute;
            width: 100%;
            height: 100%;
            top: 0;
            left: 0;
        }

        .signin-signup {
            position: absolute;
            top: 50%;
            transform: translate(-50%, -50%);
            left: 75%;
            width: 50%;
            transition: 1s 0.7s ease-in-out;
            display: grid;
            grid-template-columns: 1fr;
            z-index: 5;
        }

        form {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            padding: 0rem 5rem;
            transition: all 0.2s 0.7s;
            overflow: hidden;
            grid-column: 1 / 2;
            grid-row: 1 / 2;
        }

        form.sign-up-form {
            opacity: 0;
            z-index: 1;
        }

        form.sign-in-form {
            z-index: 2;
        }

        .title {
            font-size: 2.2rem;
            color: #444;
            margin-bottom: 10px;
        }

        .input-field {
            max-width: 380px;
            width: 100%;
            background-color: #f0f0f0;
            margin: 10px 0;
            height: 55px;
            border-radius: 55px;
            display: grid;
            grid-template-columns: 15% 70% 15%; /* Adjusted column percentages */
            padding: 0 0.4rem;
            position: relative;
        }

        .input-field i {
            text-align: center;
            line-height: 55px;
            color: #acacac;
            transition: 0.5s;
            font-size: 1.1rem;
        }

        .input-field input {
            background: none;
            outline: none;
            border: none;
            line-height: 1;
            font-weight: 600;
            font-size: 1.1rem;
            color: #333;
            width: 100%;
        }

        .input-field .error{
            color: #ff3860;
            font-size: 12px;
            height: 13px;
            width: 400px;
        }

        #togglePassword {
            cursor: pointer;
        }

        .input-field input::placeholder {
            color: #aaa;
            font-weight: 500;
        }

        .social-text {
            padding: 0.7rem 0;
            font-size: 1rem;
        }

        .social-media {
            display: flex;
            justify-content: center;
        }

        .social-icon {
            height: 46px;
            width: 46px;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 0 0.45rem;
            color: #333;
            border-radius: 50%;
            border: 1px solid #333;
            text-decoration: none;
            font-size: 1.1rem;
            transition: 0.3s;
        }

        .social-icon:hover {
            color: #4481eb;
            border-color: #4481eb;
        }

        .btn {
            width: 150px;
            background-color: #2F4E7E;
            border: none;
            outline: none;
            height: 49px;
            border-radius: 49px;
            color: #fff;
            text-transform: uppercase;
            font-weight: 600;
            margin: 32px 0;
            cursor: pointer;
            transition: 0.5s;
        }

        .btn:hover {
            background-color: #4d84e2;
        }

        .panels-container {
            position: absolute;
            height: 100%;
            width: 100%;
            top: 0;
            left: 0;
            display: grid;
            grid-template-columns: repeat(2, 1fr);
        }

        .container:before {
            content: "";
            position: absolute;
            height: 2000px;
            width: 2000px;
            top: -10%;
            right: 48%;
            transform: translateY(-50%);
            background-color: #2F4E7E;
            transition: 1.8s ease-in-out;
            border-radius: 50%;
            z-index: 6;
        }

        .image {
            width: 100%;
            transition: transform 1.1s ease-in-out;
            transition-delay: 0.4s;
        }

        .panel {
            display: flex;
            flex-direction: column;
            align-items: flex-end;
            justify-content: space-around;
            text-align: center;
            z-index: 6;
        }

        .left-panel {
            pointer-events: all;
            padding: 3rem 17% 2rem 12%;
        }

        .right-panel {
            pointer-events: none;
            padding: 3rem 12% 2rem 17%;
        }

        .panel .content {
            color: #fff;
            transition: transform 0.9s ease-in-out;
            transition-delay: 0.6s;
        }

        .panel h3 {
            font-weight: 600;
            line-height: 1;
            font-size: 1.5rem;
        }

        .panel p {
            font-size: 0.95rem;
            padding: 0.7rem 0;
        }

        .btn.transparent {
            margin: 0;
            background: none;
            border: 2px solid #fff;
            width: 130px;
            height: 41px;
            font-weight: 600;
            font-size: 0.8rem;
        }

        .right-panel .image,
        .right-panel .content {
            transform: translateX(800px);
        }

        /* ANIMATION */

        .container.sign-up-mode:before {
            transform: translate(100%, -50%);
            right: 52%;
        }

        .container.sign-up-mode .left-panel .image,
        .container.sign-up-mode .left-panel .content {
            transform: translateX(-800px);
        }

        .container.sign-up-mode .right-panel .image,
        .container.sign-up-mode .right-panel .content {
            transform: translateX(0%);
        }

        .container.sign-up-mode .signin-signup {
            left: 25%;
        }

        .container.sign-up-mode form.sign-up-form {
            opacity: 1;
            z-index: 2;
        }

        .container.sign-up-mode form.sign-in-form {
            opacity: 0;
            z-index: 1;
        }

        .container.sign-up-mode .left-panel {
            pointer-events: none;
        }

        .container.sign-up-mode .right-panel {
            pointer-events: all;
        }

        @media (max-width: 870px) {
            .container {
                min-height: 800px;
                height: 100vh;
            }
            .signin-signup {
                width: 100%;
                top: 95%;
                transform: translate(-50%, -100%);
                transition: 1s 0.8s ease-in-out;
            }

            .signin-signup,
            .container.sign-up-mode .signin-signup {
                left: 50%;
            }

            .panels-container {
                grid-template-columns: 1fr;
                grid-template-rows: 1fr 2fr 1fr;
            }

            .panel {
                flex-direction: row;
                justify-content: space-around;
                align-items: center;
                padding: 2.5rem 8%;
                grid-column: 1 / 2;
            }

            .right-panel {
                grid-row: 3 / 4;
            }

            .left-panel {
                grid-row: 1 / 2;
            }

            .image {
                width: 200px;
                transition: transform 0.9s ease-in-out;
                transition-delay: 0.6s;
            }

            .panel .content {
                padding-right: 15%;
                transition: transform 0.9s ease-in-out;
                transition-delay: 0.8s;
            }

            .panel h3 {
                font-size: 1.2rem;
            }

            .panel p {
                font-size: 0.7rem;
                padding: 0.5rem 0;
            }

            .btn.transparent {
                width: 110px;
                height: 35px;
                font-size: 0.7rem;
            }

            .container:before {
                width: 1500px;
                height: 1500px;
                transform: translateX(-50%);
                left: 30%;
                bottom: 68%;
                right: initial;
                top: initial;
                transition: 2s ease-in-out;
            }

            .container.sign-up-mode:before {
                transform: translate(-50%, 100%);
                bottom: 32%;
                right: initial;
            }

            .container.sign-up-mode .left-panel .image,
            .container.sign-up-mode .left-panel .content {
                transform: translateY(-300px);
            }

            .container.sign-up-mode .right-panel .image,
            .container.sign-up-mode .right-panel .content {
                transform: translateY(0px);
            }

            .right-panel .image,
            .right-panel .content {
                transform: translateY(300px);
            }

            .container.sign-up-mode .signin-signup {
                top: 5%;
                transform: translate(-50%, 0);
            }
        }
        .input-field {
            position: relative;
        }

        /*.input-field .error{*/
        /*    color: #ff3860;*/
        /*    font-size: 12px;*/
        /*    height: 13px;*/
        /*    width: 400px;*/
        /*}*/

        .forgot-password-container {
            position: absolute;
            top: 100%;
            right: 0;
            margin-top: 8px;
            display: flex;
            align-items: center;
        }

        .line {
            width: 100%;
            height: 1px;
            background-color: #ccc;
            margin-right: 8px;
        }

        .forgot-password {
            color: #2F4E7E;
            font-size: 0.9rem;
            text-decoration: none;
        }

        .forgot-password:hover {
            text-decoration: underline;
        }

        @media (max-width: 570px) {
            form {
                padding: 0 1.5rem;
            }

            .image {
                display: none;
            }
            .panel .content {
                padding: 0.5rem 1rem;
            }
            .container {
                padding: 1.5rem;
            }

            .container:before {
                bottom: 72%;
                left: 50%;
            }

            .container.sign-up-mode:before {
                bottom: 28%;
                left: 50%;
            }

        }


    </style>
</head>
<body>

<%--        Login and Signup Page--%>

<div class="container">
    <div class="forms-container">
        <div class="signin-signup">
            <form action="rental?page=loginUser" method="post" id="LogIn" class="sign-in-form">
                <h2 class="title">Sign in</h2>

                <%--                display error message if username or password is incorrect--%>
                <% if (request.getAttribute("errorMessage") != null) { %>
                <div class="error" style="color: #ff3860;" id="error-message"><%= request.getAttribute("errorMessage") %></div>
                <% } %>

                <% if (request.getAttribute("successPassword") != null) { %>
                <div class="success" style="color: green;" id="success-message"><%= request.getAttribute("successPassword") %></div>
                <% } %>

                <div class="input-field">
                    <i class="fas fa-envelope"></i>

                    <input type="text" name="emailLogin" placeholder="Email"/>

                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="passwordLogin" placeholder="Password" class="passwordLogin" id="passwordInputLogin"/>
                    <i class="fas fa-eye" id="togglePasswordLogin"></i>
                    <div class="forgot-password-container">

                        <a href="rental?page=forgotPw" class="forgot-password" id="forgotPasswordLink">Forgot Password?</a>
                    </div>
                </div>

<%--                <input type="checkbox" name="rememberMe" /> Remember Me--%>

                <input type="submit" value="Login" class="btn solid" />

            </form>

            <%--            Register Form--%>
            <form action="rental?page=registerUser" method="post" id="SignUp" class="sign-up-form">
                <h2 class="title">Sign up</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input type="text" name="userName" id="userName" placeholder="Full Name"/>
                    <i class="fas fa"></i>

                    <div class="error"></div>
                </div>

                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input type="text" name="email" id="email" placeholder="Email"/>
                    <i class="fas fa"></i>

                    <div class="error"></div>
                </div>

                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" class="passwordSignup" placeholder="Password" id="passwordInput"/>
                    <i class="fas fa-eye" id="togglePassword"></i>
                    <div class="error"></div>

                </div>

                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input type="password" name="password" placeholder="Confirm Password" id="passwordInputConfirm"  />
                    <i class="fas fa-eye" id="togglePasswordConfirm"></i>

                    <div class="error" style="color: #ff3860;"></div>

                </div>
<%--                <input type="submit" class="btn" value="Sign up" />--%>
                <input type="submit" name="registerSubmit" class="btn" value="Sign up">

                <p style="width: 29.375rem; color: #2F4E7E; height: 3.4375rem; margin-left: 80px; flex-shrink: 0;">
                    By clicking Sign up, you agree our
                    <a href="rental?page=terms"> Terms and Conditions </a> .


                </p>
<%--                <input type="submit" class="btn" value="Sign up" />--%>


            </form>
        </div>
    </div>

    <div class="panels-container">
        <div class="panel left-panel">
            <div class="content">
                <h3>New here ?</h3>
                <p>
                    Explore, Discover, Rent: Your Gateway to Hassle-Free Accommodation!
                </p>
                <button class="btn transparent" id="sign-up-btn">
                    Sign up
                </button>
            </div>
            <img src="./img/rentomatic-04.png" class="image" alt="" />
        </div>
        <div class="panel right-panel">
            <div class="content">
                <h3>Need room for rent?</h3>
                <p>
                    Unlock Comfort, Rent a Room – Your Home Away from Home!
                </p>
                <button class="btn transparent" id="sign-in-btn">
                    Sign in
                </button>
            </div>
            <img src="./img/rentomatic-04.png" class="image" alt="" />
        </div>
    </div>
</div>

<script>
    const passwordInput = document.getElementById("passwordInput");
    const passwordInputConfirm = document.getElementById("passwordInputConfirm");

    document.addEventListener("DOMContentLoaded", function () {
        const togglePassword = document.getElementById("togglePassword");
        const passwordInputLogin = document.getElementById("passwordInputLogin");
        const togglePasswordLogin = document.getElementById("togglePasswordLogin");
        const togglePasswordConfirm = document.getElementById("togglePasswordConfirm");

        function togglePasswordVisibility(inputElement, iconElement) {
            const type = inputElement.getAttribute("type") === "password" ? "text" : "password";
            inputElement.setAttribute("type", type);
            // Toggle the eye icon based on the password visibility
            iconElement.classList.toggle("fa-eye-slash");
        }

        togglePassword.addEventListener("click", function () {
            togglePasswordVisibility(passwordInput, this);
        });

        togglePasswordLogin.addEventListener("click", function () {
            togglePasswordVisibility(passwordInputLogin, this);
        });

        togglePasswordConfirm.addEventListener("click", function () {
            togglePasswordVisibility(passwordInputConfirm, this); // Assuming the same input for confirmation
        });

        const sign_in_btn = document.querySelector("#sign-in-btn");
        const sign_up_btn = document.querySelector("#sign-up-btn");
        const container = document.querySelector(".container");

        sign_up_btn.addEventListener("click", () => {
            container.classList.add("sign-up-mode");
        });

        sign_in_btn.addEventListener("click", () => {
            container.classList.remove("sign-up-mode");
        });


    });


    // Form validation and verification
    const email = document.getElementById("email");
    const form1 = document.getElementById("SignUp");
    const name = document.getElementById("userName");
    const form2 = document.getElementById("LogIn");


    // submitting the form
    form1.addEventListener('submit', function(e){
        e.preventDefault();

        if (validateInputs()) {
            this.submit();
        }
    });

    //error message
    const setError = (element, message) => {
        const inputControl = element.parentElement;
        const errorDisplay = inputControl.querySelector('.error');

        errorDisplay.innerText = message;
        inputControl.classList.add('error');
        inputControl.classList.remove('success');
    }

    //success message
    const setSuccess = element => {
        const inputControl = element.parentElement;
        const errorDisplay = inputControl.querySelector('.error');

        errorDisplay.innerText = '';
        inputControl.classList.add('success');
        inputControl.classList.remove('error');
    }

    //email validation
    //email validation
    const isValidEmail = email => {
        const re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    //password verification
    //check for strong password
    const isValidPassword = passwordInput => {
        const pw =  /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{7,15}$/;
        return pw.test(String(passwordInput).toLowerCase());
    }

    //phone number verification
    // function isValidPhoneNumber(phone) {
    //     // Check if the input is a numeric string and has a length of 10
    //     return /^\d{10}$/.test(phone);
    // }

    const validateInputs = () => {
        const emailValue = email.value.trim();
        const fullName = name.value;
        const passwordValue = passwordInput.value.trim();
        const confirmPwValue = passwordInputConfirm.value.trim();
        let isValid = true;

        //check name validation
        if (fullName === ''){
            setError(name, 'Name is required');
        } else {
            setSuccess(name);
        }

        // //check email validation
        if(emailValue === '') {
            setError(email, 'Email is required');
            isValid=false;
        } else if(!isValidEmail(emailValue)) {
            setError(email, 'Insert valid email address');
            isValid=false;
        } else {
            setSuccess(email);
        }

        //check phone validation
        // if(phoneNo === '') {
        //     setError(phone, 'Contact is required');
        //     isValid=false;
        // } else if(!isValidPhoneNumber(phoneNo)) {
        //     setError(phone, 'Insert valid contact');
        //     isValid=false;
        // } else {
        //     setSuccess(phone);
        // }

        //check password validation
        if(passwordValue === '') {
            setError(passwordInput, 'Password is required');
            isValid=false;
        } else if(passwordValue.length < 7) {
            setError(passwordInput,'Password must be 7 characters');
            isValid=false;
        } else if (!isValidPassword(passwordValue)) {
            setError(passwordInput,'Please insert strong password');
            isValid=false;
        } else {
            setSuccess(passwordInput);
        }

        // check for matching password
        if(confirmPwValue === '') {
            setError(passwordInputConfirm, 'Please confirm your password');
            isValid=false;
        } else if(confirmPwValue !== passwordValue) {
            setError(passwordInputConfirm, "Password doesn't match");
            isValid=false;
        } else {
            setSuccess(passwordInputConfirm);
        }
        return isValid;
    }



</script>
</body>
</html>