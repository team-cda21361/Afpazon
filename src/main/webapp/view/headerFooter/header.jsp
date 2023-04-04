<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="fr">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="x-ua-compatible" content="ie=edge" />
		<title>Afpazon | Trouvez tout ce qu'il vous faut !</title>
		<meta name="description" content="" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />
		
		<!-- ========================= Carrousel ========================= -->
		<link rel="stylesheet" href="assets/carrousel/css/owl.carousel.min.css">
		<link rel="stylesheet" href="assets/carrousel/css/owl.theme.default.min.carousel.css">
		<link rel="stylesheet" href="assets/carrousel/css/style.carousel.css">
		<script src="assets/carrousel/js/jquery.min.carousel.js"></script>
		<script src="assets/carrousel/js/bootstrap.min.js"></script>
		<script src="assets/carrousel/js/popper.carousel.js"></script>
		<!-- ========================= CSS here ========================= -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<link rel="stylesheet" href="./assets/css/datatables.min.css" />
		<!-- ========================= JS here ========================= -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
		<script type="text/javascript" src="./assets/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="./assets/js/datatables.min.js"></script>
	</head>

	<body>
		<c:if test="${(empty currentUser) || (currentUser.role.role == 'Client')}">
			<header>
				<nav class="navbar navbar-expand-lg bg-dark bg-body-tertiary ps-3 pe-3" data-bs-theme="dark">
				  <div class="container-fluid">
				    <a class="navbar-brand" href="/Afpazon/"><img class="my-2" height=50px src="assets/images/logo/Amazon version_blc_logo.svg.png" alt="Logo"></a>
				  	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
				    <div class="collapse navbar-collapse" id="navbarSupportedContent">
				      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
			          	<li class="nav-item w-60 fs-5 fw-bold"><em><a class="nav-link text-warning">"On vend tout !"</a></em></li>
				        <li class="nav-item dropdown ms-3 my-auto">
				          <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    Catégories
						  </button>
				          <ul class="dropdown-menu">
				            <li><a class="dropdown-item" href="#">Livre</a></li>
							<li><a class="dropdown-item" href="#">Musique</a></li>
							<li><a class="dropdown-item" href="#">Jeux-Vidéo</a></li>
							<li><a class="dropdown-item" href="#">High-tech</a></li>
							<li><a class="dropdown-item" href="#">Electroménager</a></li>
				          </ul>
				        </li>
				      </ul>
				      <form class="d-flex" role="search">
				      	<select class="form-select">
						  <option selected value="0">Toute la boutique</option>
						  <option value="1">Livre</option>
						  <option value="2">Musique</option>
						  <option value="3">Jeux-Vidéo</option>
						  <option value="4">High-tech</option>
						  <option value="5">Electroménager</option>
						</select>
				        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
				        <button class="btn btn-outline-success" type="submit">Search</button>
				      </form>
				      <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
					      <c:if test="${empty currentUser}">
					      	<li class="nav-item mt-auto mb-auto me-3">
					      		<a href="register" class="nav-link d-inline"><i class="bi bi-person-plus"></i> S'inscrire</a><a class="nav-link d-inline"> | </a><a href="login" class="nav-link d-inline"><i class="bi bi-box-arrow-in-right"></i> Se connecter</a>
					      	</li>
					      </c:if>
					      <c:if test="${currentUser.role.role == 'Client'}">
					      	<ul class="navbar-nav me-auto mb-2 mb-lg-0">
						      	<li class="nav-item dropdown me-3">
						          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
						            <i class="bi bi-person-check-fill"></i> Bonjour, <c:out value="${currentUser.getFirstName()}"/>
						          </a>
						          <ul class="dropdown-menu">
						            <li><a class="dropdown-item" href="account"><i class="bi bi-person-vcard"></i> Mon compte</a></li>
									<li><a class="dropdown-item" href="logout"><i class="bi bi-box-arrow-right"></i> Déconnexion</a></li>
						          </ul>
						        </li>
					        </ul>
					      </c:if>
					      <li>
					      	<button type="button" class="btn btn-primary position-relative" data-bs-toggle="offcanvas" data-bs-target="#cartCanvas">
							  <i class="bi bi-cart"></i>
							  <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
							    2
							  </span>
							</button>
						  </li>
				      </ul>
				    </div>
				  </div>
				</nav>
			</header>
			
			<div class="offcanvas offcanvas-end" tabindex="-1" id="cartCanvas" aria-labelledby="cartCanvastLabel">
			  <div class="offcanvas-header">
			    <h5 class="offcanvas-title" id="cartCanvastLabel"><i class="bi bi-cart"></i> Mon panier</h5>
			    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			  </div>
			  <div class="offcanvas-body">
			    ...
			  </div>
			</div>
		</c:if>

		<!-- Header Backoffice -->
		<c:if test="${currentUser.role.role == 'Admin' }">
			<nav class="navbar navbar-expand-lg bg-body-tertiary"
				style="background: #F113DB">
				<div class="container-fluid">
					<a class="navbar-brand" href="#"></a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav me-auto mb-2 mb-lg-0">
							<li class="nav-item"><a class="nav-link active"
								aria-current="page" href="dashboard"> <img
									alt="dashboard image" src="assets/images/back_office/logo.png"
									width="55">
							</a></li>
							<li class="nav-item"><a class="nav-link" href="#"> <img
									alt="" src="assets/images/back_office/Catalogue.png" width="60">
							</a></li>
							<li class="nav-item"><a class="nav-link" href="stockManager">
									<img alt="" src="assets/images/back_office/Stock.png" width="45">
							</a></li>
						</ul>
						<a class=" d-flex nav-link" href="#"> <img alt=""
							src="assets/images/back_office/logBack.png" width="60">
						</a>
					</div>
				</div>
			</nav>
		</c:if>