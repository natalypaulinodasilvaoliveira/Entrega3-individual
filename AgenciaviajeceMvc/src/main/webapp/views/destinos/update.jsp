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
<title>Viaje-CE | Atualizar Destino</title>
</head>
<body>
	<main>
		<header class="header">
			<h1>Atualizar Destino</h1>
		</header>
		
		<jsp:include page="../../components/menu.jsp">
			<jsp:param name="home" value="../../index.jsp" />
			<jsp:param name="destinos" value="destino" />
		</jsp:include>
		
		<div class="container py-3">
            <form action="./destino-update">
	            <h2 class="text-center">Atualizar</h2>
	            <input type="hidden" id="id" name="id" class="form-control" value="${destino.id}" />
	            <div class="form-group mb-3">
	                 <label for="destino" class="form-label">
             	        Destino
	                </label>
	                <input type="text" id="nome" name="nome" class="form-control" value="${d.destino}" />
	            </div>
	            
	            <div class="form-group mb-3">
	                <label for="dataentrada" class="form-label">
	                    Data entrada
	                </label>
	                <input type="text" id="entrada" name="entrada" class="form-control" value="${d.data_entrada}" />
	            </div>
	            <div class="form-group mb-3">
	                <label for="email" class="form-label">
	                    Data saída
	                </label>
	                <input type="text" id="editora" name="editora" class="form-control" value="${d.data_saida}" />
	            </div>
	            
	            <div class="form-group mb-3">
	                <label for="preco" class="form-label">
	                    Valor compra
	                </label>
	                <input type="number" id="preco" name="preco" class="form-control" step="0.01" value="${d.valor_compra}" />
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