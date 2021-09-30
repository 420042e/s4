<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Spring Web MVC project</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
    </head>

    <body>
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <a class="navbar-brand" href="#">S4</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
              <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                  <a class="nav-link" href="index.htm">Students</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="clases.htm">Classes</a>
                </li>
              </ul>
            </div>
          </nav>
    
    
        <div class="container mt-4">
            <div class="card border-info">
                <div class="card-header bg-info text-white">
                    Create Student
                </div>
                <div class="card-body">
                    <form method="POST">
                        <label>First Name</label>
                        <input type="text" name="first_name" class="form-control">
                        <label>Last Name</label>
                        <input type="text" name="last_name" class="form-control">
                        <label>Class</label>
                        
                        <select id="clases" name="code" class="form-select" aria-label="Default select example">
                            <c:forEach var="dato" items="${lista}">
                                <option value="${dato.code}">${dato.title}</option>
                            </c:forEach>
                        </select>
                        
                        <input type="submit" value="Agregar" class="btn btn-success">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
