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
import com.entity.TodoDetails;

@WebServlet("/update")
public class UpdateServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));
		String userName = req.getParameter("username");
		String todo = req.getParameter("todo");
		String status = req.getParameter("status");

		TodoDAO dataAccessObject = new TodoDAO(DBConnect.getConnection());

		TodoDetails todoDetails = new TodoDetails();
		todoDetails.setId(id);
		todoDetails.setName(userName);
		todoDetails.setTodo(todo);
		todoDetails.setStatus(status);

		boolean f = dataAccessObject.updateTodo(todoDetails);
		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("successMessage", "Todo Updated Successfully");
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("failedMessage", "Something went wrong in the server");
			resp.sendRedirect("index.jsp");
		}

	}

}
