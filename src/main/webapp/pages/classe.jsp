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
    <body class="bg-dark" data-bs-theme="dark">
        <h2>Gerenciamento de Classes</h2>

        <form method="post" action="ClasseController?type=inserir">
            <label for="nome">Nome da Classe:</label>
            <input type="text" id="nome" name="nome">
            <br>
            <label for="valor">Valor:</label>
            <input type="text" id="valor" name="valor">
            <br>
            <label for="prazo_devolucao">Prazo de Devolução:</label>
            <input type="text" id="prazo_devolucao" name="prazo_devolucao">

            <button type="submit">Inserir</button>
        </form>
        <div class="container">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Valor</th>
                        <th>Prazo Devolução</th>
                        <th>Alterar</th>
                        <th>Excluir</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        ClasseApp classeApp = new ClasseApp();
                        List<Classe> listaClasses = classeApp.listar(Classe.class);

                        for (Classe classe : listaClasses) {
                    %>
                        <tr>
                            <td>
                                <%= classe.getId_classe() %>
                            </td>
                            <td>
                                <%= classe.getNome() %>
                            </td>
                            <td>
                                <%= classe.getValor() %>
                            </td>
                            <td>
                                <%= classe.getPrazo_devolucao() %>
                            </td>
                            <td>
                                <a type="button"
                                    class="btn btn-primary"
                                    href="ClasseController?type=alterar&id_classe=<%= classe.getId_classe() %>">
                                    Alterar
                                </a>
                            </td>
                            <td>
                                <a type="button"
                                    class="btn btn-primary"
                                    href="ClasseController?type=excluir&id_classe=<%= classe.getId_classe() %>">
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
