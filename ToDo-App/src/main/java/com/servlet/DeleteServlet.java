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

@WebServlet("/delete")
public class DeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id = Integer.parseInt(req.getParameter("id"));

		TodoDAO dataAccessObject = new TodoDAO(DBConnect.getConnection());
		boolean f = dataAccessObject.deleteTodo(id);

		HttpSession session = req.getSession();

		if (f) {
			session.setAttribute("successMessage", "Todo Deleted Successfully");
			resp.sendRedirect("index.jsp");
		} else {
			session.setAttribute("failedMessage", "Something went wrong in the server");
			resp.sendRedirect("index.jsp");
		}
	}

}
