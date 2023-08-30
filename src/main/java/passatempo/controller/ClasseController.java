package passatempo.controller;

import passatempo.model.application.ClasseApp;
import passatempo.model.domain.Classe;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/ClasseController")
public class ClasseController extends HttpServlet {
    private ClasseApp banco = new ClasseApp();

    public ClasseController() {}



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

        response.sendRedirect("classe.jsp");
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
        String valor = request.getParameter("valor");
        String prazo_devolucao = request.getParameter("prazo_devolucao");

        float valorFloat = Float.parseFloat(valor);
        int prazoInt = Integer.parseInt(prazo_devolucao);

        Classe classe = new Classe(nome, valorFloat, prazoInt);
        banco.inserir(classe);
    }

    private void alterar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id_classe");
        Classe classe = banco.findById(id);
        request.setAttribute("classe", classe);

        //System.out.println("pegou a classe: " + classe.getNome());
        RequestDispatcher dd = request.getRequestDispatcher("alterarClasse.jsp");
        dd.forward(request, response);
    }

    private void save(HttpServletRequest request) {
        String nome_classe = request.getParameter("nome");
        String valor = request.getParameter("valor");
        String prazo_devolucao = request.getParameter("prazo_devolucao");

        System.out.println(nome_classe);
        System.out.println(valor);
        System.out.println(prazo_devolucao);

        float valorFloat = Float.parseFloat(valor);
        int prazoInt = Integer.parseInt(prazo_devolucao);

        String id_classe = request.getParameter("id_classe");
        Classe classe = banco.findById(id_classe);

        classe.setNome(nome_classe);
        classe.setValor(valorFloat);
        classe.setPrazo_devolucao(prazoInt);
        banco.alterar(classe);
    }

    private void excluir(HttpServletRequest request) {
        String id_classe = request.getParameter("id_classe");
        Classe classe = banco.findById(id_classe);
        banco.excluir(classe);
    }


}
