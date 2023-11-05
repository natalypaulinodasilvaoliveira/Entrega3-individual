package controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CompraDAO;
import dao.DestinoDAO;
import dao.ViajanteDAO;
import modelos.Compras;
import modelos.Destinos;
import modelos.Viajantes;

@WebServlet(urlPatterns = {"/compra", "/compra-getCreate", "/compra-create", "/compra-edit", "/compra-update", "/compra-delete"})
public class CompraServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CompraDAO cdao = new CompraDAO();
	DestinoDAO ddao = new DestinoDAO();
	ViajanteDAO vdao = new ViajanteDAO();
	Compras = new Compras();
    
    public CompraServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		switch (action) {
		case "/compra":
			read(request, response);
			break;
		case "/compra-getCreate":
			getCreate(request, response);
			break;
		case "/compra-create":
			create(request, response);
			break;
		case "/compra-edit":
			edit(request, response);
			break;
		case "/compra-update":
			update(request, response);
			break;			
		case "/compra-delete":
			delete(request, response);
			break;
		default:
			response.sendRedirect("index.html");
			break;
		}
	}
	
	protected void read (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<modeloscompras> lista = cdao.read();
		
		request.setAttribute("listaCompras", lista);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/compras/index.jsp");
		rd.forward(request, response);
	}
	
	protected void getCreate (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Destinos> listaDestinos = ddao.read();
		request.setAttribute("listaDestinos", listaDestinos);
		List<Viajantes> listaViajantes = vdao.read();
		request.setAttribute("listaViajantes", listaViajantes);
	
		RequestDispatcher rd = request.getRequestDispatcher("./views/compras/create.jsp");
		rd.forward(request, response);
	
	}
	
	protected void create (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Viajantes viajante = vdao.readById(Integer.parseInt(request.getParameter("viajante")));
		Destinos destino = ddao.readById(Integer.parseInt(request.getParameter("destino")));
		
		String data = request.getParameter("data");
		
		compra = new Compras(data, viajante, destino);
		
		cdao.create(compra);
		response.sendRedirect("compra");
	}
	
	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		compra = cdao.readById(id);
		
		request.setAttribute("compra", compra);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/destinos/update.jsp");
		rd.forward(request, response);
		
	}
		
		
	protected void update (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		compra.setId(Integer.parseInt(request.getParameter("id")));
		compra.setCodigoreserva(request.getParameter("codigo_reserva"));
		compra.setDatacompra(request.getParameter("data_compra"));
		compra.setTotalcompra(request.getParameter("total_compra"));
		
		cdao.update(compra);
		response.sendRedirect("compra");
	}
	
	protected void delete (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter(id));
		cdao.delete(id);
		response.sendRedirect("compra");
	}
}

