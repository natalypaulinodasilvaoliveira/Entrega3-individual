<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="./assets/img/logo.jpg" type="image/jpg" />
<link rel="stylesheet" href="./assets/css/style.css" />
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
<title>Viaje-CE | Criar Compra</title>
</head>
<body>
	<main>
		<header class="header">
			<h1>Criar Compra</h1>
		</header>

		<jsp:include page="../../components/menu.jsp">
			<jsp:param name="home" value="./index.jsp" />
			<jsp:param name="viajantes" value="viajante" />
			<jsp:param name="destinos" value="destino" />
			<jsp:param name="compras" value="compra" />
		</jsp:include>

		<div class="container py-3">
			<form action="compra-create">
				<h2 class="text-center">Criar</h2>
				<div class="form-group mb-3">
					<label for="data" class="form-label"> Data </label> <input
						type="text" id="data" name="data" class="form-control" value="" />
				</div>

				<div class="form-group mb-3">
					<label for="destino" class="form-label"> Destino </label> 
					<select id="destino" name="destino" class="form-control">
						<option value="DEFAULT">Escolha um detino</option>
						<jstl:forEach items="${listaDestinos}" var="l">
							<option value="${d.id}">${d.data_entrada}</option>
						</jstl:forEach>
					</select>
				</div>
				<div class="form-group mb-3">
					<label for="viajante" class="form-label"> Viajante </label> 
					<select id="viajante" name="viajante" class="form-control">
						<option value="DEFAULT">Escolha um Viajante</option>
						<jstl:forEach items="${listaViajantes}" var="u">
							<option value="${v.id}">${v.nome}</option>
						</jstl:forEach>
					</select>
				</div>
				
				<button type="submit" class="btn btn-primary">Enviar</button>
				<a href="./compra" class="btn btn-danger"
					style="margin-left: 10px"> Cancelar </a>
			</form>
		</div>

	</main>

	<footer>
		<img src="./webapp/assets/img/logo.jpg" alt="Viaje-CE" />
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>