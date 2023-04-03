<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dashboard</title>
</head>
<body>
<!--start Navbar -->
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
						aria-current="page" href="dashboard"><img alt="dashboard image"
							src="assets/images/back_office/logo.png" width="55"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><img
							alt="" src="assets/images/back_office/Catalogue.png" width="60"></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"> <img
							alt="" src="assets/images/back_office/Stock.png" width="45">
					</a></li>
				</ul>
				<a class=" d-flex nav-link" href="#"> <img alt=""
					src="assets/images/back_office/logBack.png" width="60">
				</a>
			</div>
		</div>
	</nav>
<!--end Navbar -->
	<div class="backContainer">
		<!-- start user -->
		<div class="d-flex justify-content-between dashBoardLine">
			<div>
				<div class="d-flex justify-content-between">
					<h4>Utilisateurs</h4>
					<form class="d-flex" role="search" method="post">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" name="userSearch">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div class ="tablePane" >
					<table class="table table-bordered">
						<thead class="table-active">
							<tr>
								<th scope="col">Nom</th>
								<th scope="col">Prenom</th>
								<th scope="col">Email</th>
								<th scope="col">Rôle</th>
								<th scope="col">Actif</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
						  <c:forEach items="${userList }" var="user">
							<tr>
								<th scope="row"><c:out value="${user.lastName }"></c:out></th>
								<td><c:out value="${user.firstName }"></c:out></td>
								<td><c:out value="${user.email }"></c:out></td>
								<td><c:out value="${user.role.role }"></c:out></td>
								<td>
								<c:if test="${user.isActive() == true}"><c:out value="OUI"></c:out></c:if>
								<c:if test="${user.isActive() == false}"><c:out value="NON"></c:out></c:if>
								</td>
								<td><a href="dashboard?id=${user.id }"><i class="bi bi-pencil-square"></i></a></td>
								<td><a href="dashboard?id=${user.id }"><i class="bi bi-trash3-fill"></i></a></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div>
				<c:if test="${not empty criticalStock }">
					<div class="alert alert-danger" role="alert">
						<c:out value="${criticalStock }"></c:out>
					</div>
				</c:if>
			</div>
		</div>
		<!-- end user -->
		
		<!-- start product -->
		<div class="d-flex justify-content-between dashBoardLine">
			<div>
				<div class="d-flex justify-content-between">
					<h4>Produits</h4>
					<form class="d-flex" role="search" method="post">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" name="productSearch">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div class="tablePane">
					<table class="table table-bordered">
						<thead class="table-active">
							<tr>
								<th scope="col">Nom</th>
								<th scope="col">référence</th>
								<th scope="col">Prix</th>
								<th scope="col">Quantité</th>
								<th scope="col">Actif</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
 						 <c:forEach items="${stockList }" var="stock">
							<tr>
								<th scope="row"><c:out value="${stock.product.name }"></c:out></th>
								<td><c:out value="${stock.product.reference }"></c:out></td>
								<td><c:out value="${stock.product.price }"></c:out></td>
								<td><c:out value="${stock.quantity }"></c:out></td>
								<td>
								<c:if test="${stock.product.isActive() == true}"><c:out value="OUI"></c:out></c:if>
								<c:if test="${stock.product.isActive() == false}"><c:out value="NON"></c:out></c:if>
								</td>
								<td><a href="dashboard?id=${stock.id }"><i class="bi bi-pencil-square"></i></a></td>
								<td><a href="dashboard?id=${stock.id }"><i class="bi bi-trash3-fill"></i></a></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<!-- end product -->
			<!-- Start discount -->
			<div>
				<div class="d-flex justify-content-between">
					<h4>Promotion</h4>
					<form class="d-flex" role="search" method="post">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" name="discountSearch">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div class="tablePane">
					<table class="table table-bordered">
						<thead class="table-active">
							<tr>
								<th scope="col">Code voucher</th>
								<th scope="col">Pourcentage</th>
								<th scope="col">Date de début</th>
								<th scope="col">Date de fin</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
						 <c:forEach items="${discountList }" var="discount">
							<tr>
								<th scope="row"><c:out value="${discount.voucher }"></c:out></th>
								<td><c:out value="${discount.percent }"></c:out></td>
								<td><c:out value="${discount.startDate }"></c:out></td>
								<td><c:out value="${discount.endDate }"></c:out></td>
								<td><a href="dashboard?id=${discount.id }"><i class="bi bi-pencil-square"></i></a></td>
								<td><a href="dashboard?id=${discount.id }"><i class="bi bi-trash3-fill"></i></a></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	
	<!-- end discount -->
	<!-- Start commande -->
		<div class="d-flex justify-content-between dashBoardLine">
			<div>
				<div class="d-flex justify-content-between">
					<h4>Commande</h4>
					<form class="d-flex" role="search" method="post">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search" name="orderSearch">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div class ="tablePane" >
					<table class="table table-bordered">
						<thead class="table-active">
							<tr>
								<th scope="col">id commmande</th>
								<th scope="col">Email du client</th>
								<th scope="col">date</th>
								<th scope="col">status de livraison</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
						  <c:forEach items="${orderList }" var="order">
							<tr>
								<th scope="row"><c:out value="${order.id }"></c:out></th>
								<td><c:out value="${order.user.email }"></c:out></td>
								<td><c:out value="${order.date }"></c:out></td>
								<td><c:out value="${order.status.status }"></c:out></td>
								<td><a href="dashboard?id=${order.id }"><i class="bi bi-pencil-square"></i></a></td>
								<td><a href="dashboard?id=${order.id }"><i class="bi bi-trash3-fill"></i></a></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- end order -->
		
				<!-- start  -->
		<div class="d-flex justify-content-between dashBoardLine">
			<div>
				<div class="d-flex justify-content-between">
					<h4>F.A.Q.</h4>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div class="">
					<table class="table table-bordered">
						<thead class="table-active">
							<tr>
								<th scope="col">Nom</th>
								<th scope="col">référence</th>
								<th scope="col">Prix</th>
								<th scope="col">Quantité</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
 						 
						</tbody>
					</table>
				</div>
			</div>
			<!-- end stock -->
			<!-- Start discount -->
			<div>
				<div class="d-flex justify-content-between">
					<h4>Newsletter</h4>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div class="">
					<table class="table table-bordered">
						<thead class="table-active">
							<tr>
								<th scope="col">Code voucher</th>
								<th scope="col">Pourcentage</th>
								<th scope="col">Date de début</th>
								<th scope="col">Date de fin</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
						 
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<!-- end FAQ and Newsletter -->
	</div>
</body>
</html>