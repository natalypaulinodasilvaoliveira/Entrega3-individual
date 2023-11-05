<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon" href="./assets/img/logo.jpg" type="image/jpg" />
<link rel="stylesheet" href="./assets/css/style.css" />
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" />
<title>Viaje-CE | Atualizar Compra</title>
</head>
<body>
	<main>
		<header class="header">
			<h1>Atualizar Compra</h1>
		</header>
		
		<jsp:include page="../../components/menu.jsp">
			<jsp:param name="home" value="../../index.jsp" />
			<jsp:param name="compras" value="compra" />
		</jsp:include>
		
		<div class="container py-3">
            <form action="./compra-update">
	            <h2 class="text-center">Atualizar</h2>
	            <input type="hidden" id="id" name="id" class="form-control" value="${compra.id}" />

	            <div class="form-group mb-3">
	                <label for="codigoreserva" class="form-label">
	                    Codigo Reserva
	                </label>
	                <input type="text" id="codigoreserva" name="codigoreserva" class="form-control" value="${c.codigo_reserva}" />
	            </div>
	            <div class="form-group mb-3">
	                <label for="email" class="form-label">
	                    Data Compra 
	                </label>
	                <input type="text" id="editora" name="editora" class="form-control" value="${c.data_compra}" />
	            </div>
	            
	            <div class="form-group mb-3">
	                <label for="senha" class="form-label">
	                    Valor compra
	                </label>
	            	<input type="number" id="preco" name="preco" class="form-control" step="0.01" value="" />
	            </div>
	            <button type="submit" class="btn btn-primary">
	                Enviar
	            </button>
	            <a href="./usuario" class="btn btn-danger" style="margin-left: 10px">
	                Cancelar
	            </a>
            </form>
        </div>
		
    </main>
    
	<footer>
		<img
			src="./assets/img/logo.jpg"
			alt="Viaje-CE" />
	</footer>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
</body>
</html>