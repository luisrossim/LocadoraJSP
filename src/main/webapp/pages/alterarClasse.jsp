<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="passatempo.model.domain.Classe" %>
<%@ page import="passatempo.model.application.ClasseApp" %>
<%@ page import="java.util.List" %>

<html>
    <head>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <title>PassaTempo</title>
    </head>
    <body class="bg-dark-subtle" data-bs-theme="dark">
        <h2>Alterar Classe ${classe.getId_classe()}</h2>

        <form action="ClasseController?type=save" method="post">
            <input type="hidden" name="id_classe" value="${classe.getId_classe()}">
            <label for="nome">Nome da Classe:</label>
            <input type="text" id="nome" name="nome" value="${classe.getNome()}">

            <label for="valor">Valor:</label>
            <input type="text" id="valor" name="valor" value="${classe.getValor()}">

            <label for="prazo_devolucao">Prazo de Devolução:</label>
            <input type="text" id="prazo_devolucao" name="prazo_devolucao" value="${classe.getPrazo_devolucao()}">

            <button type="submit">Salvar</button>
        </form>
        <br>
        <br>
        <a href="classe.jsp" class="btn btn-primary">Gerenciamento de Classes</a>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
