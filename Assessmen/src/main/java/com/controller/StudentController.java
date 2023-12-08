package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import service.Services;

import java.io.IOException;
import java.util.Random;


import com.bean.Student;
import com.dao.StudentDao;

@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action.equalsIgnoreCase("insert")) {
			boolean flag = StudentDao.checkLogin(request.getParameter("email"));
			if (flag == false) {
				if (request.getParameter("password").equals(request.getParameter("cpassword"))) {

					Student s = new Student();
					s.setFname(request.getParameter("fname"));
					s.setLname(request.getParameter("lname"));
					s.setEmail(request.getParameter("email"));
					s.setMobile(request.getParameter("mobile"));
					s.setAddress(request.getParameter("address"));
					s.setGender(request.getParameter("gender"));
					s.setPassword(request.getParameter("password"));
					StudentDao.insert(s);
					request.setAttribute("msg", "User Sign Up Successfully");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				} else {
					request.setAttribute("msg", "Password & Confirm Password Does Not Matched");
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "Email Already Registered");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}

		} else if (action.equalsIgnoreCase("login")) {
			Student s = StudentDao.login(request.getParameter("email"), request.getParameter("password"));
			if (s != null) {
				if (s.getPassword().equals(request.getParameter("password"))) {
					HttpSession session = request.getSession();
					session.setAttribute("s", s);
					request.getRequestDispatcher("profile.jsp").forward(request, response);

				}

				else {

					request.setAttribute("msg", "Incorrect Password");
					request.getRequestDispatcher("login.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("msg", "Email Not Registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else if (action.equalsIgnoreCase("change password")) {
			HttpSession session = request.getSession();
			Student s = (Student) session.getAttribute("s");
			if (s.getPassword().equals(request.getParameter("old_password")))
			{
				if (request.getParameter("new_password").equals(request.getParameter("cnew_password")))
				{
					

						s.setPassword(request.getParameter("new_password"));
						StudentDao.change_password(s);
						request.setAttribute("msg", "Password Changed Successfully");
						response.sendRedirect("profile.jsp");
					}
					else
					{
						request.setAttribute("msg", "New Password and Confirm Password do not match");
						request.getRequestDispatcher("cp.jsp").forward(request, response);

					}
				}

		
			else 
			{
				request.setAttribute("msg", "Old Password Does NOt Matched");
				request.getRequestDispatcher("cp.jsp").forward(request, response);

			}
		}
			
		

		else if (action.equalsIgnoreCase("update profile")) {
			HttpSession session = request.getSession();
			Student s = (Student) session.getAttribute("s");
			System.out.println("profile changed called");

			s.setFname(request.getParameter("fname"));
			s.setLname(request.getParameter("lname"));
			s.setEmail(request.getParameter("email"));
			s.setMobile(request.getParameter("mobile"));
			s.setAddress(request.getParameter("address"));
			s.setGender(request.getParameter("gender"));
			StudentDao.updateProile(s);
			session.setAttribute("s", s);
			request.setAttribute("msg", "Profile Update Successfully");
		} 
		else if (action.equalsIgnoreCase("reset password")) {
			String email = request.getParameter("email");
			String np = request.getParameter("new_password");
			String cnp = request.getParameter("cnew_password");
			if (np.equals(cnp)) {
				StudentDao.reset_password(email, np);
				response.sendRedirect("login.jsp");
			} else {
				request.setAttribute("msg", "New Password & Confirm New Password Does Not Matched");
				request.setAttribute("email", email);
				request.getRequestDispatcher("cp.jsp").forward(request, response);
			}
		}

		else if (action.equalsIgnoreCase("send otp")) {
			boolean flag = StudentDao.checkLogin(request.getParameter("email"));

			if (flag == true) {
				Random t = new Random();
				int minRange = 1000, maxRange = 9999;
				int otp = t.nextInt(maxRange - minRange) + minRange;
				Services.sendMail(request.getParameter("email"), otp);
				request.setAttribute("email", request.getParameter("email"));
				request.setAttribute("otp", otp);
				request.getRequestDispatcher("otp.jsp").forward(request, response);

			} else {
				request.setAttribute("msg", "Email Not Registered");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
		} else if (action.equalsIgnoreCase("verify otp")) {
			String email = request.getParameter("email");
			int otp = Integer.parseInt(request.getParameter("otp"));
			int uotp = Integer.parseInt(request.getParameter("uotp"));

			if (otp == uotp) {
				
				request.setAttribute("email", email);
				request.getRequestDispatcher("reset.jsp").forward(request, response);

			} else {
				request.setAttribute("email", email);
				request.setAttribute("otp", otp);
				request.setAttribute("msg", "Invalid OTP");
				request.getRequestDispatcher("otp.jsp").forward(request, response);
			}

		}

	}

}
