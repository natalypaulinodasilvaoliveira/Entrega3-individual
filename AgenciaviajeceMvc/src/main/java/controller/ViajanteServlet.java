package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ViajanteDAO;
import modelos.modelosviajantes;
import modelos.modelosviajantes.Viajantes;

@WebServlet(urlPatterns = {"/viajante", "/viajante-create", "/viajante-edit", "/viajante-update", "/viajante-delete"})
public class ViajanteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ViajanteDAO vdao = new ViajanteDAO(); 
    Viajantes viajante = new Viajantes();
    
    public ViajanteServlet() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		switch (action) {
		case "/usuario":
			read(request, response);
			break;
		case "/usuario-create":
			create(request, response);
			break;
		case "/usuario-edit":
			edit(request, response);
			break;
		case "/usuario-update":
			update(request, response);
			break;			
		case "/usuario-delete":
			delete(request, response);
			break;
		default:
			response.sendRedirect("index.html");
			break;
		}
	}
	
	protected void read (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<modelosviajantes> lista = vdao.read();
		
		request.setAttribute("listaViajantes", lista);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/viajantes/index.jsp");
		rd.forward(request, response);
	}
	
	protected void create (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		viajante.setNome(request.getParameter("nome,"));
		viajante.setEmail(request.getParameter("email"));
		viajante.setSenha(request.getParameter("senha"));
		
		vdao.create(viajante);
		response.sendRedirect("viajante");
	}
	
	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		viajante = vdao.readById(id);
		
		request.setAttribute("viajante", viajante);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/viajantes/update.jsp");
		rd.forward(request, response);
		
	}
		
		
	protected void update (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		viajante.setId(Integer.parseInt(request.getParameter("id")));
		viajante.setNome(request.getParameter("nome,"));
		viajante.setEmail(request.getParameter("email"));
		viajante.setSenha(request.getParameter("senha"));
		
		vdao.update(viajante);
		response.sendRedirect("viajante");
	}
	
	protected void delete (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter(id));
		vdao.delete(id);
		response.sendRedirect("viajante");
	}
}
