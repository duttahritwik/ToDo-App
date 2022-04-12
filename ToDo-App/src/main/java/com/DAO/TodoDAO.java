package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.TodoDetails;

public class TodoDAO {
	private Connection connection;

	public TodoDAO(Connection connection) {
		super();
		this.connection = connection;
	}

	public boolean addTodo(String name, String todo, String status) {
		boolean f = false;
		try {
			String sqlQueryString = "insert into todo_app(name, todo, status) values(?, ?, ?)";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQueryString);
			preparedStatement.setString(1, name);
			preparedStatement.setString(2, todo);
			preparedStatement.setString(3, status);

			int i = preparedStatement.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<TodoDetails> getTodo() {
		List<TodoDetails> todoItems = new ArrayList<TodoDetails>();
		TodoDetails todoDetails = null;

		try {
			String sqlQuery = "select * from todo_app";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				todoDetails = new TodoDetails();
				todoDetails.setId(resultSet.getInt(1));
				todoDetails.setName(resultSet.getString(2));
				todoDetails.setTodo(resultSet.getString(3));
				todoDetails.setStatus(resultSet.getString(4));
				todoItems.add(todoDetails);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return todoItems;
	}

	public TodoDetails getTodoById(int id) {
		TodoDetails todoDetails = null;
		try {
			String sqlQuery = "select * from todo_app where id=?";

			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setInt(1, id);
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				todoDetails = new TodoDetails();
				todoDetails.setId(resultSet.getInt(1));
				todoDetails.setName(resultSet.getString(2));
				todoDetails.setTodo(resultSet.getString(3));
				todoDetails.setStatus(resultSet.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return todoDetails;
	}

	public boolean updateTodo(TodoDetails todoDetails) {
		boolean f = false;

		try {
			String sqlQuery = "update todo_app set name=?, todo =?, status =? where id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setString(1, todoDetails.getName());
			preparedStatement.setString(2, todoDetails.getTodo());
			preparedStatement.setString(3, todoDetails.getStatus());
			preparedStatement.setInt(4, todoDetails.getId());

			int i = preparedStatement.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public boolean deleteTodo(int id) {
		boolean f = false;

		try {
			String sqlQuery = "delete from todo_app where id=?";
			PreparedStatement preparedStatement = connection.prepareStatement(sqlQuery);
			preparedStatement.setInt(1, id);

			int i = preparedStatement.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
