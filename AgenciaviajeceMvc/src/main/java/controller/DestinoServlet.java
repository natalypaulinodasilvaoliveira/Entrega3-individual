package controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.DestinoDAO;
import modelos.destinos;

@WebServlet(urlPatterns = {"/destino", "/destino-create", "/destino-edit", "/destino-update", "/destino-delete"})
public class DestinoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    DestinoDAO ddao = new DestinoDAO(); 
    Destinos = new Destinos();
    
    public DestinoServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		switch (action) {
		case "/destino":
			read(request, response);
			break;
		case "/destino-create":
			create(request, response);
			break;
		case "/destino-edit":
			edit(request, response);
			break;
		case "/destino-update":
			update(request, response);
			break;			
		case "/destino-delete":
			delete(request, response);
			break;
		default:
			response.sendRedirect("index.html");
			break;
		}
	}
	
	protected void read (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<modelosdestinos> lista = ddao.read();
		
		request.setAttribute("listaDestinos", lista);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/destinos/index.jsp");
		rd.forward(request, response);
	}
	
	protected void create (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		destino.setDataentrada(request.getParameter("data_entrada"));
		destino.setDatasaida(request.getParameter("data_saida"));
		destino.setValorcompra(Double.parseDouble(request.getParameter("valor_compra")));
		
		ddao.create(destino);
		response.sendRedirect("destino");
	}
	
	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		destino = ddao.readById(id);
		
		request.setAttribute("destino", destino);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/destinos/update.jsp");
		rd.forward(request, response);
		
	}
		
		
	protected void update (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		destino.setId(Integer.parseInt(request.getParameter("id")));
		destino.setDataentrada(request.getParameter("data_entrada"));
		destino.setDatasaida(request.getParameter("data_saida"));
		destino.setValorcompra(Double.parseDouble(request.getParameter("valor_compra")));
		
		ddao.update(destino);
		response.sendRedirect("destino");
	}
	
	protected void delete (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter(id));
		ddao.delete(id);
		response.sendRedirect("destino");
	}
}

