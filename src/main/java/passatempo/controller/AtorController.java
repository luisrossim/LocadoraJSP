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
        String TipoRequest = request.getParameter("acao");

        System.out.println(TipoRequest);

        response.sendRedirect("index.jsp");
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        service(request, response);
    }

}
