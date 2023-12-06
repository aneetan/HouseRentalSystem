<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <script src="https://kit.fontawesome.com/64d58efce2.js" crossorigin="anonymous"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;700&display=swap">

  <link rel="stylesheet" href="style.css" />
  <%@ include file="favicon.jsp" %>

  <title>Rento Matic</title>

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
      color: #191919;
      margin-bottom: 10px;
      font-family: 'Archivo Black', sans-serif;
      
    }

    .input-field {
      max-width: 380px;
      width: 100%;
      background-color: #f0f0f0;
      margin: 10px 0;
      height: 55px;
      border-radius: 55px;
      display: grid;
      grid-template-columns: 15% 70% 15%;
      /* Adjusted column percentages */
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

    .btn.back {
      background-color: #ccc;
      color: #333;
      margin-top: 10px;
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
      background-color: #2f4e7e;
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
      background-color: #2f4e7e;
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

      #gyante{
        font-family: 'Inter', sans-serif;
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

    .forgot-password-container {
      position: absolute;
      top: 100%;
      right: 0;
      margin-top: 8px;
      display: flex;
      align-items: center;
    }

    .back-link{
      color: #2f4e7e;
    }

    #resendOTP{
      color: #2F4E7E;
      text-decoration: none;
    }

    .line {
      width: 100%;
      height: 1px;
      background-color: #ccc;
      margin-right: 8px;
    }

    .forgot-password {
      color: #2f4e7e;
      font-size: 0.9rem;
      text-decoration: none;
    }

    .forgot-password:hover {
      text-decoration: underline;
    }

    .otp-box {
      display: none;
      transition: transform 0.5s ease-in-out;
    }

    .otp-box.active {
      display: block;
      transform: translateX(0%);
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
  <div class="container">
    <div class="forms-container">
      <div class="signin-signup">
        <!-- This is for OTP -->

        <form action="rental?page=verifyOtp" method="post" name="OtpForm" class="otp-form" id="otpForm" >
          <h2 class="title">Verification</h2>
          <p id="gyante">Please enter the OTP that we just sent you.</p>
          <div class="input-field">
            <i class="fas fa-key"></i>
            <input type="text" name="otp" id="otp" placeholder="OTP" required />
          </div>
          <%--                display error message if username or password is incorrect--%>
          <% if (request.getAttribute("message") != null) { %>
          <div class="error" style="color: #ff3860;" id="error-message"><%= request.getAttribute("message") %></div>
          <% } %>
          <%--                display error message if username or password is incorrect--%>
          <% if (request.getAttribute("message1") != null) { %>
          <div class="error" style="color:#28a745;" id="error-message"><%= request.getAttribute("message1") %></div>
          <% } %>

<%--          <p> Didn't get OTP? <a href="rental?page=resend"> Resend </a></p>--%>
          <input type="submit" value="Submit" class="btn solid" onsubmit="return validateOTP()" />

          <br>
          <p class="back-link" id="otpFormBackBtn">

            <a href="forgot.jsp" style="text-decoration: none">
              <i class="fas fa-arrow-left"></i> Back
            </a>

        </form>




<%--        <!-- Add this div for enhanced success message -->--%>
<%--        <div id="successMessage" style=" text-align: center;">--%>
<%--          <i class="fas fa-check-circle" style="color: #28a745; font-size: 3rem;"></i>--%>
<%--          <h2 class="title">Congratulations!</h2>--%>
<%--          <p>Password changed successfully.</p>--%>
<%--          <button onclick="handleDoneButtonClick()" class="btn solid">Done</button>--%>
<%--        </div>--%>
<%--      </div>--%>


</div>


        <!-- This is the end of the new password creation form -->
      </div>
    </div>

    <div class="panels-container">
      <div class="panel left-panel">
        <img src="./img/rentomatic-04.png" class="image" alt="" />
      </div>
    </div>
  </div>


  <script>
    document.getElementById('toggleNewPassword').addEventListener('click', togglePasswordVisibility.bind(null, 'newPassword', 'toggleNewPassword'));
    document.getElementById('toggleConfirmPassword').addEventListener('click', togglePasswordVisibility.bind(null, 'confirmPassword', 'toggleConfirmPassword'));

    document.getElementById('verifyForm').addEventListener('submit', function (event) {
      // event.preventDefault();
      validatePhoneNumber();
    });

    document.getElementById('otpForm').addEventListener('submit', function (event) {
      // event.preventDefault();
      validateOTP();
    });

    document.getElementById('newPasswordForm').addEventListener('submit', function (event) {
      // event.preventDefault();
      validatePassword();
    });

    function togglePasswordVisibility(inputId, iconId) {
      const passwordInput = document.getElementById(inputId);
      const passwordIcon = document.getElementById(iconId);

      if (passwordInput.type === 'password') {
        passwordInput.type = 'text';
        passwordIcon.classList.remove('fa-eye-slash');
        passwordIcon.classList.add('fa-eye');
      } else {
        passwordInput.type = 'password';
        passwordIcon.classList.remove('fa-eye');
        passwordIcon.classList.add('fa-eye-slash');
      }
    }

    function validatePassword() {
  const emailInput = document.getElementById('email');
  const newPasswordInput = document.getElementById('newPassword');
  const confirmPasswordInput = document.getElementById('confirmPassword');
  const email = emailInput.value;
  const newPassword = newPasswordInput.value;
  const confirmPassword = confirmPasswordInput.value;

  // Email validation
  if (!email) {
    alert('Email address is required.');
    return false;
  }

  // Built-in email validation for HTML5
  if (!emailInput.checkValidity()) {
    alert('Invalid email address. Please enter a valid email.');
    return false;
  }

  // Password length validation
  if (newPassword.length < 6) {
    alert('Password is too short. Please use at least 6 characters.');
    return false;
  }

  // Add any other password validation logic as needed

  // Password match validation
  if (newPassword !== confirmPassword) {
    alert('Passwords do not match. Please enter matching passwords.');
    return false;
  }

  // If all validations pass, hide the current form and show the success message
  hideForm('newPasswordForm');
  showSuccessMessage();

  // Return false to prevent form submission
  return true;
}

// Function to hide a form by its ID
function hideForm(formId) {
  const currentForm = document.getElementById(formId);
  currentForm.style.display = 'none';
}

// Function to show the success message
function showSuccessMessage() {
  const successMessage = document.getElementById('successMessage');
  successMessage.style.display = 'block';
}


    // Function to show the OTP box
    // function showOTPBox() {
    //   const verifyForm = document.getElementById('verifyForm');
    //   const otpForm = document.getElementById('otpForm');

      // Hide the verify form and show the OTP box
      // verifyForm.style.display = 'none';
      // otpForm.style.display = 'flex';
    // }

    // Event listener for the submit button in the verification form
    // document.getElementById('verifyForm').addEventListener('submit', function (event) {
    //   // event.preventDefault();
    //   showOTPBox();
    // });

    // Function to handle the "Done" button click event
function handleDoneButtonClick() {
  // You can perform any additional actions here if needed
  // For now, redirect to index.html
  window.location.href = 'index.jsp';
}

    // function validateOTP() {
    //   // Add OTP validation logic if needed
    //   // For now, always return true to allow submission
    //   showNewPasswordForm();
    //   return false; // Prevent form submission (you can remove this if you want to allow submission)
    // }

    function showNewPasswordForm() {
      const otpForm = document.getElementById('otpForm');
      const newPasswordForm = document.getElementById('newPasswordForm');

      // Show the new password form and hide the OTP form
      // otpForm.style.display = 'none';
      // newPasswordForm.style.display = 'flex';
    }

    function goBack(formId) {
      const currentForm = document.getElementById(formId);
      const previousFormId = formId === 'otpForm' ? 'verifyForm' : 'verifyForm'; // Adjust as needed

      const previousForm = document.getElementById(previousFormId);

      // Show the previous form and hide the current form
      // currentForm.style.display = 'none';
      // previousForm.style.display = 'flex';
    }

    // // Event listener for the back button in the OTP form
    // document.getElementById('otpFormBackBtn').addEventListener('click', function (event) {
    //   // event.preventDefault();
    //   goBack('otpForm');
    // });
    //
    // // Event listener for the back button in the new password form
    // document.getElementById('newPasswordFormBackBtn').addEventListener('click', function (event) {
    //   // event.preventDefault();
    //   goBack('newPasswordForm');
    // });
  </script>
</body>

</html>