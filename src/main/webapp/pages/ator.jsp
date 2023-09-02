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
    <body class="bg-dark-subtle" data-bs-theme="dark">
        <h2>Gerenciamento de Atores</h2>

        <form method="post" action="AtorController?type=inserir">
            <label for="nome">Nome do Ator:</label>
            <input type="text" id="nome" name="nome">
            <button type="submit">Inserir</button>
        </form><br><br>

        <div class="container">
            <table class="table responsive-table">
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
                                    class="btn btn-primary"
                                    href="AtorController?type=alterar&id_ator=<%= ator.getId_ator() %>">
                                    Alterar
                                </a>
                            </td>
                            <td>
                                <a type="button"
                                    class="btn btn-danger"
                                    href="AtorController?type=excluir&id_ator=<%= ator.getId_ator() %>">
                                    Excluir
                                </a>
                            </td>
                        </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>



        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    </body>
</html>
