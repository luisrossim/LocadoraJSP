package passatempo.controller;

import passatempo.model.application.AtorApp;
import passatempo.model.domain.Ator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/AtorController")
public class AtorController extends HttpServlet {
    private AtorApp banco = new AtorApp();

    public AtorController() {}



    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String TipoRequest = request.getParameter("type");

        switch (TipoRequest){
            case "inserir":
                inserir(request);
                break;
            case "alterar":
                alterar(request, response);
                break;
            case "save":
                save(request);
                break;
            case "excluir":
                excluir(request);
                break;
        }

        response.sendRedirect("ator.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }



    private void inserir(HttpServletRequest request) {
        String nome = request.getParameter("nome");
        Ator ator = new Ator(nome);
        banco.inserir(ator);
    }

    private void alterar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id_ator");
        Ator ator = banco.findById(id);
        System.out.println(ator.getNome());
        System.out.println(ator.getId_ator());
        request.setAttribute("ator", ator);
        request.getRequestDispatcher("alterarAtor.jsp").forward(request, response);
    }

    private void save(HttpServletRequest request) {
        String nome_ator = request.getParameter("nome");
        String id_ator = request.getParameter("id_ator");
        Ator ator = banco.findById(id_ator);
        ator.setNome(nome_ator);
        banco.alterar(ator);
    }

    private void excluir(HttpServletRequest request) {
        String id_ator = request.getParameter("id_ator");
        Ator ator = banco.findById(id_ator);
        //int id = Integer.parseInt(id_ator);
        banco.excluir(ator);
    }

}
