<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Add a new todo item here</title>
    <link href="component/index.css" rel="stylesheet" type="text/css">
    <%@include file="component/all_css.jsp" %>
  </head>
    <%@include file="component/navbar.jsp" %>
    <div class="container">
    	<div class="home-page-content" style="margin-top: -30px;">
    	<div style="display: flex; flex-wrap: wrap;">
    		<img src="images/add-item.jpeg" style="margin: 0px 50px; height: 150px;">
    		<img src="images/add-item2.png" style="height: 150px;">
    		<img src="images/cart.png" style="height: 300px;">
    	</div>
    	<div style="margin: 30px 0px 0px 50px;">
    		<div class="heading-text" style="font-size: 45px;">Add a New ToDo Item:</div>
   			<ul class="list-container">
			  <li class="point">Note down a priority item that you need to add to your schedule.</li>
			  <li class="point">Be sure to mark it as pending, or it can mislead you.</li>
			  <li class="point">You might want to add the more important tasks first, so that high priority items are seen first.</li>
			</ul>
    	</div>
    </div>
      <div class="row">
        <div class="col-md-6 offset-md-3">
          <div class="card" style="background-color: #000; border: 1px solid black;"/>
          <div class="card-body" />
          <h3 class="text-center" style="color: #fff; font-weight: bold;">Add ToDo Item</h3>
           <div id="error-message" class="error-message"></div>
          <form action="add_todo" method="post" id = "addTodoForm">
          	<div class="form-group">
              <label for="exampleInputEmail1" style="color: #fff; margin-bottom: 10px; font-weight: 700;">Name</label>
              <input
                type="text"
                class="form-control"
                id="personName"
                aria-describedby="emailHelp"
                name="username"
              />
            </div>
            <div class="form-group">
              <label for="exampleInputEmail1" style="color: #fff; margin: 10px 0px; font-weight: 700;">TODO</label>
              <input
                type="text"
                class="form-control"
                id="todoName"
                aria-describedby="emailHelp"
                name="todo"
              />
            </div>
            <div class="form-group">
              <label for="inputState" style="color: #fff; margin: 10px 0px; font-weight: 700;">Status</label>
              <select id="inputState" class="form-control" name="status">
                <option selected>--Select--</option>
                <option value="Pending">Pending</option>
                <option value="Complete">Complete</option>
              </select>
            </div>
            <div class="text-center">
            	<button type="submit" class="btn btn-primary" style="font-weight: bold; margin-top: 15px; background-color: #BDBCBC  ; color: #000;">Add</button>
            </div> 
          </form>
        </div>
      </div>
    </div>
    <script src="addTodoValidation.js"></script>
  </body>
</html>
