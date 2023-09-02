<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="passatempo.model.domain.Ator" %>
<%@ page import="passatempo.model.application.AtorApp" %>
<%@ page import="java.util.List" %>

<html>
    <head>
        <link rel="stylesheet" href="styles/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <title>PassaTempo</title>
    </head>
    <body class="bg-secondary-subtle" data-bs-theme="dark">
        <div style="max-width: 920px" class="container-sm mt-5 px-5">
            <div class="row mb-3">
                <a href="index.jsp" class="bi bi-arrow-left-circle fs-6 text-decoration-none text-secondary p-0"> Voltar</a>
            </div>
            <div class="row bg-danger text-white rounded rounded-1 justify-content-center">
                Gerenciamento de Atores
            </div>
            <div class="row mt-5 mb-2">
                <form class="m-0 p-0" method="post" action="AtorController?type=inserir">
                    <div class="input-group mb-3">
                        <span class="input-group-text">Nome do ator</span>
                        <input type="text" id="nome" name="nome" class="form-control">
                        <button class="btn btn-secondary" type="submit">Inserir</button>
                    </div>
                </form>
            </div>
            <div class="row mb-5">
                <table class="table table-striped border">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Nome</th>
                            <th>Alterar</th>
                            <th>Excluir</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                        AtorApp atorApp = new AtorApp();
                        List<Ator> listaAtores = atorApp.listar(Ator.class);

                        for (Ator ator : listaAtores) {
                        %>
                        <tr>
                            <td>
                                <%= ator.getId_ator() %>
                            </td>
                            <td>
                                <%= ator.getNome() %>
                            </td>
                            <td>
                                <a type="button"
                                   class="btn btn-outline-secondary"
                                   href="AtorController?type=alterar&id_ator=<%= ator.getId_ator() %>">
                                    <i class="bi bi-pencil fs-6"></i>
                                </a>
                            </td>
                            <td>
                                <a type="button"
                                   class="btn btn-outline-danger"
                                   href="AtorController?type=excluir&id_ator=<%= ator.getId_ator() %>">
                                    <i class="bi bi-trash fs-6"></i>
                                </a>
                            </td>
                        </tr>
                        <%
                        }
                        %>
                    </tbody>
                </table>
            </div>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
