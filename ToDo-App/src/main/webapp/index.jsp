<%@page import="com.db.DBConnect"%>
<%@page import="com.DAO.TodoDAO"%>
<%@page import="com.entity.TodoDetails"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>ToDo App - Add, Edit or Delete your daily checklist and organize yourself!</title>
    <%@include file="component/all_css.jsp" %>
    <link href="component/index.css" rel="stylesheet" type="text/css">
  </head>
  <body>
    <%@include file="component/navbar.jsp" %>
    <div class="home-page-content">
    	<img src="images/todo_app_banner.png" class="first-image">
    	<div class="about-app">
    		<div class="heading-text" style="font-size: 45px;">Organize your priorities and get more done!</div>
   			<ul class="list-container">
			  <li class="point">Remember everything and tackle any thing to do with an app to keep track of your activities.</li>
			  <li class="point">Create and assign tasks inside your notes with reminders so nothing falls through the cracks.</li>
			  <li class="point">Capture actionable tasks from meetings, lectures, or your own imagination. </li>
			</ul>
    	</div>
    </div>
    <div class="home-page-content">
    	<img src="images/fourth-image.webp">
    	<img src="images/myList.png" style="width: 300px;">
    	<div style="margin: 30px 0px 0px 50px;">
    		<div class="heading-text" style="font-size: 45px;">Functionality in the WebApp</div>
   			<ul class="list-container">
			  <li class="point">Add any number of new todo items as per requirements.</li>
			  <li class="point">Make important changes to existing todo items.</li>
			  <li class="point">Delete a todo item if no longer required, or mark it done.</li>
			</ul>
    	</div>
    </div>
    <%String successMessage = (String)session.getAttribute("successMessage");
    	if (successMessage != null) {
   	%>
   	<div class="alert alert-success" role="alert"><%=successMessage %></div>
   	<%
   	session.removeAttribute("successMessage");
    	}
    %>
    
    <%String failedMessage = (String)session.getAttribute("failedMessage");
    	if (failedMessage != null) {
   	%>
   	<div class="alert alert-danger" role="alert"><%=failedMessage %></div>
   	<%
   	session.removeAttribute("failedMessage");
    	}
    %>
    <div class="container" style="margin-bottom: 200px;">
      <div style="font-size: 40px; margin: 25px 0px; font-weight: 500;">Your todo items are:</div>
      <table class="table table-striped" border="1px">
        <thead class="bg-dark text-white table-head">
          <tr>
            <th scope="col">ID</th>
            <th scope="col" style="text-align: center;">Name</th>
            <th scope="col" style="text-align: center;">Todo</th>
            <th scope="col" style="text-align: center;">Status</th>
            <th scope="col" style="text-align: center;">Action</th>
          </tr>
        </thead>
        <tbody class="table-body">
        <%
        TodoDAO dataAccessObject = new TodoDAO(DBConnect.getConnection());
        List<TodoDetails> todoItems = dataAccessObject.getTodo();
        
        for(TodoDetails item : todoItems) {%>
        <tr>
            <th scope="row"><%= item.getId() %></th>
            <th scope="col" style="text-align: center;"><%= item.getName() %></th>
            <td style="text-align: center;"><%= item.getTodo() %></td>
            <td style="text-align: center;"><%= item.getStatus() %></td>
            <td style="text-align: center;">
	            <a href="edit.jsp?id=<%= item.getId()%>" class="btn btn-sm btn-success" style="margin: 0px 10px; font-size: 20px;padding: 4px 20px;">Edit</a>
	            <a href="delete?id=<%= item.getId()%>" class="btn btn-sm btn-danger" style="margin: 0px 10px; font-size: 20px; padding: 4px 20px;">Delete</a>
            </td>
          </tr>
        	
        <%}
        %>
        </tbody>
      </table>
    </div>
    </body>
</html>
