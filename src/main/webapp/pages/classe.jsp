<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="passatempo.model.domain.Classe" %>
<%@ page import="passatempo.model.application.ClasseApp" %>
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
            <div class="row bg-primary text-white rounded rounded-1 justify-content-center">
                Gerenciamento de Classes
            </div>
            <div class="row mt-5 mb-2">
                <form class="m-0 p-0" method="post" action="ClasseController?type=inserir">
                    <div class="input-group">
                        <span class="input-group-text">Nome da classe</span>
                        <input type="text" id="nome" name="nome" class="form-control">
                    </div>
                    <div class="input-group">
                        <span class="input-group-text">Valor</span>
                        <input type="text" id="valor" name="valor" class="form-control">
                    </div>
                    <div class="input-group mb-3">
                        <span class="input-group-text">Prazo de Devolução</span>
                        <input type="text" id="prazo_devolucao" name="prazo_devolucao" class="form-control">
                        <button class="btn btn-secondary float-end" type="submit">Inserir</button>
                    </div>
                </form>
            </div>
            <div class="row mb-5">
                <table class="table table-striped border">
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
                                   class="btn btn-outline-secondary"
                                   href="ClasseController?type=alterar&id_classe=<%= classe.getId_classe() %>">
                                    <i class="bi bi-pencil fs-6"></i>
                                </a>
                            </td>
                            <td>
                                <a type="button"
                                   class="btn btn-outline-danger"
                                   href="ClasseController?type=excluir&id_classe=<%= classe.getId_classe() %>">
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
