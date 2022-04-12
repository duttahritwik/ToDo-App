<%@page import="com.db.DBConnect"%> <%@page import="com.DAO.TodoDAO"%> <%@page
import="com.entity.TodoDetails"%> <%@ page language="java"
contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Edit any one of your todo items</title>
     <link href="component/index.css" rel="stylesheet" type="text/css">
    <%@include file="component/all_css.jsp" %>
  </head>
    <%@include file="component/navbar.jsp" %>
    <div class="container">
      <div class="row p-5">
      	<div class="home-page-content" style="margin-top: -30px;">
    	<div style="display: flex; flex-wrap: wrap;">
    		<img src="images/edit-2.png" style="margin: 0px 50px; height: 150px;">
    		<img src="images/edit-3.png" style="height: 150px;">
    	</div>
    	<div style="margin: 30px 0px 0px 50px;">
    		<div class="heading-text" style="font-size: 45px;">Edit one of your todos:</div>
   			<ul class="list-container">
			  <li class="point">Plans inevitably change, no matter how sound the initial planning is</li>
			  <li class="point">Make changes to your existing todo items to stay on track with your schedule.</li>
			  <li class="point">Note that this functionality can also be used to mark current items as complete.</li>
			</ul>
    	</div>
    </div>
        <div class="col-md-6 offset-md-3">
          <div class="card" style="background-color: #000; border: 1px solid black;"/>
          <div class="card-body" />
          <h3 class="text-center" style="color: #fff; font-weight: bold;">Edit ToDo</h3>

          <% int id = Integer.parseInt(request.getParameter("id")); TodoDAO
          dataAccessObject = new TodoDAO(DBConnect.getConnection()); TodoDetails
          todoDetails = dataAccessObject.getTodoById(id); %>

          <form action="update" method="post">
            <input type="hidden" value="<%= todoDetails.getId() %>" name="id"/>
            <div class="form-group">
              <label for="exampleInputEmail1" style="color: #fff; margin: 10px 0px; font-weight: 700;">Name</label>
              <input
                type="text"
                class="form-control"
                id="exampleInputEmail1"
                aria-describedby="emailHelp"
                name="username"
                value="<%= todoDetails.getName() %>"
              />
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1" style="color: #fff; margin: 10px 0px; font-weight: 700;">TODO</label>
              <input
                type="text"
                class="form-control"
                id="exampleInputEmail1"
                aria-describedby="emailHelp"
                name="todo"
                value="<%= todoDetails.getTodo() %>"
              />
            </div>
            <div class="form-group">
              <label for="inputState" style="color: #fff; margin: 10px 0px; font-weight: 700;">Status</label>
              <select id="inputState" class="form-control" name="status">
                <% if ("Pending".equals(todoDetails.getStatus())) {%>
                <option value="Pending">Pending</option>
                <option value="Complete">Complete</option>
                <%} else { %>
                <option value="Complete">Complete</option>
                <option value="Pending">Pending</option>
                <% } %>
                <option value="Pending">Pending</option>
                <option value="Complete">Complete</option>
              </select>
            </div>
            <div class="text-center">
              <button type="submit" class="btn btn-primary" style="font-weight: bold; margin-top: 15px; background-color: #BDBCBC;color: #000;">Update</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </body>
</html>
