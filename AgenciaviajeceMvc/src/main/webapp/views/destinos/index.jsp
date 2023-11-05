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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/remixicon@2.5.0/fonts/remixicon.css"
	rel="stylesheet">
<title>Viaje-CE | Destinos</title>
</head>
<body>
	<main>
		<header class="header">
			<h1>Destinos</h1>
		</header>

		<jsp:include page="../../components/menu.jsp">
			<jsp:param name="home" value="./index.jsp" />
			<jsp:param name="viajantes" value="viajante" />
			<jsp:param name="destinos" value="destino" />
			<jsp:param name="compras" value="compra" />
		</jsp:include>

		<section class="container">

			<div class="p-4">
				<button data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-primary mb-2 botao1"> Novo Destino </button>
					
				<table class="table table-responsive table-hover">
					<thead class="table-dark">
						<tr>
							<th scope="col">id</th>
							<th scope="col">Destino</th>
							<th scope="col">Data entrada</th>
							<th scope="col">Data saida</th>
							<th scope="col">Valor compra</th>
						</tr>
					</thead>
					<tbody>

						<jstl:forEach items="${listaDestinos}" var="l">
							<tr>
								<td>${d.id}</td>
								<td>${d.destino}</td>
								<td>${d.data_entrada}</td>
								<td>${d.data_saida}</td>
								<td>${d.valor_compra}</td>
								<td>
									<div class="d-flex">
										<button data-bs-toggle="modal"
											data-bs-target="#exampleModal${d.id}" class="mx-1" title="Editar">
											<i class="ri-file-edit-line"></i>
										</button> <a href="destino-delete?id=${d.id}" class="mx-1"
											title="Cancelar"
											onclick="return confirm('Deseja excluir o destino ${d.destino}.')">
											<i class="ri-delete-bin-2-line"></i>
										</a>
										
										<!-- Modal -->
										<div class="modal fade" id="exampleModal${d.id}" tabindex="-1"
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
														<form action="destino-update">
												            <h2 class="text-center">Atualizar</h2>
												            <input type="hidden" id="id" name="id" class="form-control" value="${d.id}" />
												            <div class="form-group mb-3">
												                <label for="nome" class="form-label">
												                    Destino
												                </label>
												                <input type="text" id="destino" name="destino" class="form-control" value="${d.destino}" />
												            </div>
												            
												            <div class="form-group mb-3">
												                <label for="dataentrada" class="form-label">
												                    Data entrada
												                </label>
												                <input type="text" id="entrada" name="entrada" class="form-control" value="${d.data_entrada}" />
												            </div>
												            <div class="form-group mb-3">
												                <label for="datasaida" class="form-label">
												                    Data saída
												                </label>
												                <input type="text" id="saida" name="saida" class="form-control" value="${d.data_saida}" />
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
						<form action="destino-create">
				            <h2 class="text-center">Atualizar</h2>
				            <input type="hidden" id="id" name="id" class="form-control" value="" />
				            <div class="form-group mb-3">
				                <label for="destino" class="form-label">
	                	                Destino
					                </label>
					                <input type="text" id="destino" name="destino" class="form-control" value="${d.destino}" />
					            </div>
					            
					            <div class="form-group mb-3">
					                <label for="dataentrada" class="form-label">
					                    Data entrada
					                </label>
					                <input type="text" id="entrada" name="entrada" class="form-control" value="${d.data_entrada}" />
					            </div>
					            <div class="form-group mb-3">
					                <label for="datasaida" class="form-label">
					                    Data saída
					                </label>
					                <input type="text" id="saida" name="saida" class="form-control" value="${d.data_saida}" />
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
				            <a href="./livro" class="btn btn-danger" style="margin-left: 10px">
				                Cancelar
				            </a>
			            </form>
					</div>
					
				</div>
			</div>
		</div>

	</main>
	<footer>
		<img src="./assets/img/logo.jpg" alt="Viaje-CE" />
	</footer>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"></script>
</body>
</html>