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
                    <a href="agregarE.htm" class="btn btn-light">Create Student</a>
                    <a href="buscarE.htm" class="btn btn-light">Search Student</a>
                </div>
                
                
                <div class="card-body">
                    <table border="1" class="table table-hover">
                        <thead>
                            <tr>
                            <th>ID</th>
                            <th>Last Name</th>
                            <th>First Name</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dato" items="${lista}">
                                <tr>
                                    <td>${dato.id}</td>
                                    <td>${dato.last_name}</td>
                                    <td>${dato.first_name}</td>
                                    <td>
                                        <table>
                                            <tr>
                                                <td><a href="detalleE.htm?id=${dato.id}" class="btn btn-warning">Details</a></td>
                                                <td><a href="editarE.htm?id=${dato.id}" class="btn btn-warning">Edit</a></td>
                                                <td><a href="deleteE.htm?id=${dato.id}" class="btn btn-danger">Delete</a></td>
                                            </tr>
                                        </table>
                                        
                                        
                                        
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
