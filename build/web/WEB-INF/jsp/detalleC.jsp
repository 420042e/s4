<%-- 
    Document   : detalleC
    Created on : 30-09-2021, 08:58:15 AM
    Author     : WINDOWS 10
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
                <div class="card-body">
                    <div class="card-header bg-info text-white">
                        Details Class
                    </div>
                    <form method="GET">
                        <input id="prodId" name="code" type="hidden" value="${codigo}">

                        <table>
                            <tr>
                                <td>
                                    <div class="input-group-append">
                                        <input type="text" name="id" class="form-control" placeholder="ID" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group-append">
                                        <input type="text" name="first_name" class="form-control" placeholder="First Name" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group-append">
                                        <input type="text" name="last_name" class="form-control" placeholder="Last Name" aria-label="Recipient's username" aria-describedby="basic-addon2">
                                    </div>
                                </td>
                                <td>
                                    <div class="input-group-append">
                                        <input type="submit" value="Search" class="btn btn-success">
                                    </div>
                                </td>
                            </tr>
                        </table>
                        
                    </form>
                    
                    <table border="1" class="table table-hover">
                        <thead>
                            <tr>
                            <th>CODE</th>
                            <th>Last Name</th>
                            <th>First Name</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dato" items="${lista}">
                                <tr>
                                    <td>${dato.code}</td>
                                    <td>${dato.last_name}</td>
                                    <td>${dato.first_name}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
