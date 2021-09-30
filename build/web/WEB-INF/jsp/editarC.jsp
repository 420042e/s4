<%-- 
    Document   : editarE
    Created on : 29-09-2021, 10:44:58 PM
    Author     : WINDOWS 10
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Class</title>
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
                    Create Class
                </div>
                <div class="card-body">
                    <form method="POST">
                        <label>Title</label>
                        <input type="text" name="title" class="form-control" value="${lista[0].title}">
                        <label>Description</label>
                        <input type="text" name="description" class="form-control" value="${lista[0].description}">
                        <input type="submit" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
