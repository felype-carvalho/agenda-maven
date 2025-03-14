<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Adiciona contato</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" rel="stylesheet">
<link href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" rel="stylesheet">
</head>
<body>

<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
	<h5 class="my-0 mr-md-auto font-weight-normal">Agenda</h5>
	<nav class="my-2 my-md-0 mr-md-3">
		<a class="p-2 text-dark" href="index.jsp">Home</a>
		<a class="p-2 text-dark" href="adiciona-contato.jsp">Cadastrar</a>
		<a class="p-2 text-dark" href="busca-contatos">Listar</a>
	</nav>
</div>

	<div class="container ">
	
		<div class="text-center">
			<h1 class="display-4">Formulário de cadastro</h1>
	    </div>
		
		<form action="cadastra-usuario" id="form-produto">
		
			<input type="hidden" id="id" name="id" value="${param.id}">
			<input type="hidden" id="id_endereco" name="id_endereco" value="${param.id_endereco}">
			
			<div class="card">
				<div class="card-body">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="nome">Nome</label> 
							<input type="text" value="${param.nome}" class="form-control" id="name" name="nome" placeholder="Nome" >
						</div>
						<div class="form-group col-md-6">
							<label for="nome">Nascimento</label> 
							<input type="date" value="${param.dataNascimento}" class="form-control" id="dataNascimento" name="dataNascimento" placeholder="Nascimento" >
						</div>
					</div>
				</div>
			</div>
			<br>
			<div class="card">
				<div class="card-body">
					<div class="form-group col-md-3">
						<label for="tel">Telefone</label> 
						<input type="text" value="${param.telefone}" class="form-control" id="tel" name="telefone" placeholder="Telefone" data-mask="(99) 9999-9999">
					</div>

					<div class="form-group col-md-3">
						<label for="email">E-mail</label> 
						<input type="email" value="${param.email}" class="form-control" id="email" name="email" placeholder="E-mail">
					</div>
				</div>
			</div>
			<br>
			<div class="card">
				<div class="card-body">
					<div class="form-group col-md-6">
						<label for="end">Logradouro</label> 
						<input type="text" value="${param.logradouro}" class="form-control" id="logradouro" name="logradouro" placeholder="Logradouro">
					</div>
					<div class="form-group col-md-6">
						<label for="end">CEP</label> 
						<input type="text" value="${param.cep}" class="form-control" id="cep" name="cep" placeholder="CEP" data-mask="99999-999">
					</div>
				</div>
			</div>
			<br>
			
			<div>
				<button class="btn btn-success" id="btnSalvar" type="submit">Salvar</button>
			</div>
				
		</form>
	</div>

	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/bootstrap.js" type="text/javascript"></script>
	<script src="js/inputMask.js"></script>
</body>
</html>