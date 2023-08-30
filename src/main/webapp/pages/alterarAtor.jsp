<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="passatempo.model.domain.Ator" %>
<%@ page import="passatempo.model.application.AtorApp" %>
<%@ page import="java.util.List" %>

<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <title>PassaTempo</title>
    </head>
    <body class="bg-dark" data-bs-theme="dark">
        <h2>Alterar Ator</h2>
        </form>
        <div class="container">
        <form action="AtorController?type=save" method="post">
            <input type="hidden" name="id_ator" value="${ator.getId_ator()}">
            <label for="nome">Nome:</label>
            <input type="text" id="nome" name="nome" value="${ator.getNome()}">
            <button type="submit">Salvar</button>
        </form>
        <br>
        <br>
        <a href="index.jsp" class="btn btn-primary">Gerenciamento de Atores</a>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
