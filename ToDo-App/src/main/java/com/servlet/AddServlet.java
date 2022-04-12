package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TodoDAO;
import com.db.DBConnect;

@WebServlet("/add_todo")
public class AddServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String userName = req.getParameter("username");
		String todo = req.getParameter("todo");
		String status = req.getParameter("status");

		TodoDAO dataAccessObject = new TodoDAO(DBConnect.getConnection());
		boolean f = dataAccessObject.addTodo(userName, todo, status);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("successMessage", "Todo Added Successfully");
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("failedMessage", "Unable to add new todo");
			resp.sendRedirect("index.jsp");
		}

	}

}
