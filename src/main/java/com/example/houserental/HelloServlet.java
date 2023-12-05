package com.example.houserental;

import Hashing.PasswordHashing;
import Model.HouseRental;
import Service.RentalService;

import java.io.*;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", urlPatterns = "/rental")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        String page = request.getParameter("page");

//--------------------------------------Registration and Login------------------------------------------------

        //for registering new user
        if (page.equalsIgnoreCase("registerUser")) {
            HouseRental rental = new HouseRental();

            rental.setName(request.getParameter("userName"));
            rental.setEmail(request.getParameter("email"));
            rental.setPassword(PasswordHashing.hashPassword(request.getParameter("password")));

//            request.getSession().setAttribute("rental", rental);
            request.getSession().setAttribute("rental", rental);

            new RentalService().authorizeUser(rental);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
            requestDispatcher.forward(request, response);
        }

        //for login of user using result set from database
        if (page.equalsIgnoreCase("loginUser")) {
            String email = request.getParameter("emailLogin");
            String password = PasswordHashing.hashPassword(request.getParameter("passwordLogin"));

            //User Login
            HouseRental rental = new RentalService().loginUser(email, password);

            if (rental != null){
                int id = rental.getId();

                //if authentication is successful create session
                HttpSession session = request.getSession(true);

                session.setAttribute("email", email);
                session.setAttribute("id", id);

                // Create a cookie for the username
                Cookie cookie = new Cookie("email", email);
                cookie.setMaxAge(30 * 24 * 60 * 60); // Set the cookie to expire in 30 days
                response.addCookie(cookie);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("landing.jsp");
                requestDispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
            }
        }

        if (page.equalsIgnoreCase("forgotPw")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("forgot.jsp");
            requestDispatcher.forward(request, response);
        }


        if (page.equalsIgnoreCase("terms")) {
            RequestDispatcher requestDispatcher = request.getRequestDispatcher("terms.jsp");
            requestDispatcher.forward(request, response);
        }


        //For Forgot password which is in login page
        if (page.equals("forgot")) {

            String email = request.getParameter("email");
            RequestDispatcher dispatcher = null;
            int otpvalue = 0;

            HttpSession mySession = request.getSession();
            mySession.setAttribute(email, "email");

            try {
                if (email != null && new RentalService().isEmailExists(email) == true) {
                    // sending otp
                    Random rand = new Random();
                    otpvalue = rand.nextInt(1255650);

                    String to = email;// change accordingly
                    // Get the session object
                    Properties props = new Properties();
                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.socketFactory.port", "465");
                    props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
                    props.put("mail.smtp.auth", "true");
                    props.put("mail.smtp.port", "465");
                    Session session = Session.getDefaultInstance(props, new Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication("rentmatic18@gmail.com", "ipotqmktdoltoxtw");// Put your email
                            // id and
                            // password here
                        }
                    });

                    // compose message
                    try {
                        MimeMessage message = new MimeMessage(session);
                        message.setFrom(new InternetAddress(email));// change accordingly
                        message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                        message.setSubject("Hello");
                        message.setText("your OTP is: " + otpvalue);
                        // send message
                        Transport.send(message);
                        System.out.println("message sent successfully");
                    } catch (MessagingException e) {
                        throw new RuntimeException(e);
                    }
                    dispatcher = request.getRequestDispatcher("otp.jsp");
                    request.setAttribute("message1", "OTP is sent to your email id");
                    //request.setAttribute("connection", con);
                    mySession.setAttribute("otp", otpvalue);
                    mySession.setAttribute("email", email);
                    dispatcher.forward(request, response);
                    //request.setAttribute("status", "success");
                } else {
                    request.setAttribute("errorMessage1", "Email address not found!");

                    RequestDispatcher requestDispatcher = request.getRequestDispatcher("forgot.jsp");
                    requestDispatcher.forward(request, response);

                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }

        }


//        //resend OTP
//        if (page.equalsIgnoreCase("resend")){
//            RequestDispatcher requestDispatcher = request.getRequestDispatcher("otp.jsp");
//            requestDispatcher.forward(request, response);
//        }

        if (page.equalsIgnoreCase("verifyOtp")) {

            int value = Integer.parseInt(request.getParameter("otp"));
            HttpSession session = request.getSession();
            int otp = (int) session.getAttribute("otp");


            RequestDispatcher dispatcher = null;


            if (value == otp) {

                request.setAttribute("email", request.getParameter("email"));
                request.setAttribute("status", "success");
                dispatcher = request.getRequestDispatcher("newPassword.jsp");
                dispatcher.forward(request, response);

            } else {
                request.setAttribute("message", "Invalid verification. Re-enter OTP");

                dispatcher = request.getRequestDispatcher("otp.jsp");
                dispatcher.forward(request, response);

            }

        }


        if (page.equalsIgnoreCase("resetPassword")) {
            HttpSession session = request.getSession();
            String email = (String) session.getAttribute("email");

            String password = PasswordHashing.hashPassword(request.getParameter("confirmPassword"));
//            String confirmPassword = request.getParameter("confirmPassword");

            RequestDispatcher dispatcher = null;

            try {
                new RentalService().resetPassword(email, password);
                request.setAttribute("status", "resetSuccess");
                request.setAttribute("successPassword", "Password changed!! Login new details");
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("status", "resetFailed");
            }
            dispatcher = request.getRequestDispatcher("index.jsp");
            dispatcher.forward(request, response);


        }


    }


    public void destroy() {
    }
}