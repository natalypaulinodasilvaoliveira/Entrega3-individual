<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<ul class="nav justify-content-center">
	<li class="nav-item"><a class="nav-link active"
		aria-current="page" href="<%=request.getParameter("home")%>">Home</a></li>
	<li class="nav-item"><a class="nav-link" href="<%=request.getParameter("viajantes")%>">Viajantes</a>
	</li>
	<li class="nav-item"><a class="nav-link" href="<%=request.getParameter("destinos")%>">Destinos</a></li>
	<li class="nav-item"><a class="nav-link" href="<%=request.getParameter("compras")%>">Compras</a></li>
</ul>
