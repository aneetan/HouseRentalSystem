package com.example.houserental;

import Hashing.PasswordHashing;
import Model.HouseRental;
import Service.RentalService;

import java.io.*;
import java.util.Collections;
import java.util.List;
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

            request.getSession().setAttribute("rental", rental);
            new RentalService().authorizeUser(rental);

            RequestDispatcher requestDispatcher = request.getRequestDispatcher("landing.jsp");
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
                HttpSession session = request.getSession(true);

                session.setAttribute("email", email);
                session.setAttribute("id", id);

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("landing.jsp");
                requestDispatcher.forward(request, response);
            } else {
                request.setAttribute("errorMessage", "Invalid username or password");

                RequestDispatcher requestDispatcher = request.getRequestDispatcher("index.jsp");
                requestDispatcher.forward(request, response);
            }
        }


    }


    public void destroy() {
    }
}