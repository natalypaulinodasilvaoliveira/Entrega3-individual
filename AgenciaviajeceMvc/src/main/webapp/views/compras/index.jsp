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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css" rel="stylesheet">
<title>Viaje-CE | Compras</title>
</head>
<body>
	<main>
		<header class="header">
			<h1>Compras</h1>
		</header>

		<jsp:include page="../../components/menu.jsp">
			<jsp:param name="home" value="./index.jsp" />
			<jsp:param name="viajantes" value="viajante" />
			<jsp:param name="destinos" value="destino" />
			<jsp:param name="compras" value="compra" />
		</jsp:include>

		<section class="container">

			<div class="p-4">
				<a href= "compra-getCreate" class= "btn btn-primary mb-2 botao1">Nova Compra</a>
				<table class="table table-responsive table-hover">
					<thead class="table-dark">
						<tr>
						<tr>
							<th scope="col">id</th>
							<th scope="col">Codigo reserva</th>
							<th scope="col">Data compra</th>
							<th scope="col">Total compra </th>
						</tr>
					</thead>
					<tbody>

						<jstl:forEach items="${listaCompra" var="c">
							<tr>
								<td>${c.id}</td>
								<td>${c.codigo_reserva}</td>
								<td>${c.data_compra}</td>
								<td>${c.total_compra}</td>
								<td>${c.viajante.nome}</td>
								
								<td>
									<div class="d-flex">
										<button data-bs-toggle="modal"
											data-bs-target="#exampleModal${c.id}" class="mx-1" title="Editar">
											<i class="ri-file-edit-line"></i>
										</button> <a href="compra-delete?id=${c.id}" class="mx-1"
											title="Cancelar"
											onclick="return confirm('Deseja excluir a compra ${c.codigo_reserva}.')">
											<i class="ri-delete-bin-2-line"></i>
										</a>
										
										<!-- Modal -->
										<div class="modal fade" id="exampleModal${c.id}" tabindex="-1"
											aria-labelledby="exampleModalLabel" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
															title</h1>
														<button type="button" class="btn-close" data-bs-dismiss="modal"
															aria-label="Close"></button>
													</div>
													<div class="modal-body">
														<form action="compra-update">
												            <h2 class="text-center">Atualizar</h2>
												            <input type="hidden" id="id" name="id" class="form-control" value="${c.id}" />
												            <div class="form-group mb-3">
												                <label for="codigoreserva" class="form-label">
												                    Codigo Reserva
												                </label>
												                <input type="text" id="codigoreserva" name="codigoreserva" class="form-control" value="${c.codigo_reserva}" />
												            </div>
												            
												            <div class="form-group mb-3">
												                <label for="datacompra" class="form-label">
												                    Data Compra 
												                </label>
												                <input type="text" id="datacompra" name="datacompra" class="form-control" value="${c.data_compra}" />
												            </div>
												            
												            <div class="form-group mb-3">
												                <label for="totalcompra" class="form-label">
												                    Total compra
												                </label>
												                <input type="number" id="preco" name="preco" class="form-control" step="0.01" value="${c.total_compra}" />
												            </div>
												
												            <button type="submit" class="btn btn-primary">
											              			Enviar
												            </button>
												            <a href="./livro" class="btn btn-danger" style="margin-left: 10px">
												                	Cancelar
												            </a>
											            </form>
													</div>
													
												</div>
											</div>
										</div>
										
									</div>
								</td>
							</tr>
						</jstl:forEach>

					</tbody>
				</table>
			</div>
		</section>
		
		<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
							title</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<form action="compra-create">
				            <h2 class="text-center">Atualizar</h2>
				            <input type="hidden" id="id" name="id" class="form-control" value="" />
				            <div class="form-group mb-3">
				                 <label for="codigoreserva" class="form-label">
					                    Codigo Reserva
					             </label>
					             <input type="text" id="codigoreserva" name="codigoreserva" class="form-control" value="${c.codigo_reserva}" />
					         </div>
					            
					         <div class="form-group mb-3">
					              <label for="datacompra" class="form-label">
					                    Data Compra 
					              </label>
					              <input type="text" id="datacompra" name="datacompra" class="form-control" value="${c.data_compra}" />
					         </div>
					            
					         <div class="form-group mb-3">
					              <label for="totalcompra" class="form-label">
					                    Total compra
					              </label>
					              <input type="number" id="preco" name="preco" class="form-control" step="0.01" value="${c.total_compra}" />
					         </div>

				            <button type="submit" class="btn btn-primary">
				                Enviar
				            </button>
				            <a href="./destino" class="btn btn-danger" style="margin-left: 10px">
				                Cancelar
				            </a>
			            </form>
					</div>
					
				</div>
			</div>
		</div>

	</main>
	<footer>
		<img src="./assets/img/recode.svg" alt="Viaje-CE" />
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"></script>
</body>
</html>