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
		<!-- ========================= CSS here ========================= -->
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
		<link rel="stylesheet" href="./assets/css/datatables.min.css" />
		<link rel="stylesheet" href="assets/css/header.css">
		<link rel="stylesheet" href="assets/css/carrouselResponsive.css">
		<!-- ========================= JS here ========================= -->
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
		<script type="text/javascript" src="./assets/js/jquery-3.6.0.min.js"></script>
		<script type="text/javascript" src="./assets/js/datatables.min.js"></script>
	</head>

	<body>
		<c:if test="${(empty currentUser.id) || (currentUser.role.role == 'Client')}">
			<header>
				<nav class="navbar navbar-expand-lg bg-dark bg-body-tertiary ps-3 pe-3" data-bs-theme="dark">
				  <div class="container-fluid">
				  <div  class="me-3">
				    <a class="navbar-brand me-0" href="/Afpazon/"><img class="mt-2" height=50px src="assets/images/logo/Amazon version_blc_logo.svg.png" alt="Logo"></a>
				    <em><a class="nav-link text-warning fs-5 fw-bold text-center">"On vend tout !"</a></em>
				  </div>
				  	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				      <span class="navbar-toggler-icon"></span>
				    </button>
				    <div class="collapse navbar-collapse" id="navbarNav">
				      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
				        <li class="nav-item dropdown ms-3 my-auto" style="z-index: 1050;">
				          <button class="btn btn-success dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
						    Catégories
						  </button>
				          <ul class="dropdown-menu">
				          	<c:forEach items="${categoriesList}" var="category">
					            <li><a class="dropdown-item" href="categories?catID=${category.id}"><c:out value="${category.category}" /></a></li>
							</c:forEach>
				          </ul>
				        </li>
				      </ul>
				      <form class="d-flex" role="search" action="categories">
				      	<select name="categorySearch" class="form-select rounded-end-0" style="z-index: 1050;">
						  <option selected value="0">Toute la boutique</option>
						  <c:forEach items="${categoriesList}" var="category">
						  	  <option value="${category.id}"><c:out value="${category.category}" /></option>
						  </c:forEach>
						</select>
				        <input name="search" class="form-control border-start-0 border-end-0 rounded-start-0 rounded-end-0" type="search" placeholder="Recherchez..." aria-label="Search">
				        <button class="btn btn-outline-success rounded-start-0 rounded-end" type="submit"><i class="bi bi-search"></i></button>
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
							 
							    <c:if test="${not empty cart.getItems() }">
							      <span class="position-absolute top-0 start-100 translate-middle badge rounded-pill bg-danger">
							    	<c:out value="${cart.countProduct() }"/>
							      </span>
							    </c:if>
							  
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
			   <div>
			   
                   <c:if test="${not empty cart.getItems() }">
			  <table class="table text-center">
                <thead>
                    <tr>
                        <th><p class="cartH">visuel </p></th>
                        <th><p class="cartH">Nom produit</p></th>
                        <th><p class="cartH">Quant.</p></th>
                        <th><p class="cartH">Prix unitaire</p></th>
                    </tr>
                </thead>
                <tbody class="align-middle">
            		  <c:forEach items="${cart.getItems()}" var="item">
            	

                    <tr>
                        <td><img height=40 src="assets/products/img/<c:out value="${item.getProduct().getMainPicPath()}"/>"  alt="#"></td>
                        <td><p class="cartD"><c:out value="${item.getProduct().getName()}"/></p></td>
                        <td><p class="cartD"><c:out value="${item.getQuantity()}"/></p></td>
                        <td><p class="cartD"><c:out value="${item.getProduct().getPrice() }"/> &euro; ttc</p></td>
                    </tr>
                    
                	  </c:forEach>
                	  
                	<tr>
                        <td colspan="2"><p class="cartH">Total:</p></td>
                        <td><p class="cartD"><c:out value="${cart.countProduct() }"/></p></td>
                        <td><p class="cartD"><c:out value="${ String.format('%.2f', cart.countPrixProductApresRemise()) }"/> &euro; ttc</p></td>
                    </tr>
                    
                </tbody>
            </table>

                <a href="cart">
                    <button class="btn btn-success" type="submit"><i class="bi bi-eye me-3"></i>Voir Panier</button>
                </a>
            	   </c:if>
            	   <c:if test="${empty cart.getItems() }">
            	     <div><img src="assets/images/logo/paniervide.png" class="imgCart">  </div>
            	     <p class="cartL">Votre panier est vide!!!</p>
            	   </c:if>
            	   
            </div>
			  <div class="align-self-end">
            </div>
			  </div>
			</div>
		</c:if>

		<!-- Header Backoffice -->
		<c:if test="${currentUser.role.role == 'Admin' }">
			<nav class="navbar navbar-expand-lg bg-body-tertiary"
				style="background: #F113DB !important">
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
						<a class=" d-flex nav-link" href="logout"> <img alt=""
							src="assets/images/back_office/logBack.png" width="60">
						</a>
					</div>
				</div>

			</nav>
		</c:if>
