<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<script defer type="text/javascript" src="./assets/js/cart.js"></script>
<script type="text/javascript" src="./assets/jQuery/jquery-3.6.2.min.js"></script>
<div class="container">
<c:if test="${msnType.equals('OK')}">
		<div class="alert alert-success timer" role="alert">
			<c:out value="${msn }"></c:out>
		</div>
</c:if>
<c:if test="${msnType.equals('KO')}">
		<div class="alert alert-danger timer" role="alert">
			<c:out value="${msn }"></c:out>
		</div>
</c:if>

	<!-- /************************/
	/*  Caroussel a ajouter */
	/************************/ -->

	<section class="trending-product section" style="margin-top: 12px;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<c:if test="${not empty category }">
							<h2>
								Produits catégorie :
								<c:out value="${category.category}" />
							</h2>
						</c:if>
						<c:if test="${empty category }">
							<h2>
								Résultat de votre recherche :
							</h2>
						</c:if>
					</div>
				</div>
			</div>
			<div class="d-flex flex-wrap m-4 py-2">
				<c:forEach items="${catProducts}" var="product">
				<c:forEach items="${ product.key }" var="prodkey" >
								
					<div class="m-3 ">
						<!-- Start Single Product -->
						<div class="card h-100"  style="width: 16rem">
							<c:if test="${prodkey.value >0}">
							<span class=" position-absolute" id="promo">Promo!</span>
							</c:if>
						<div class="img-top"> <img class="card-img-top img-fluid" src="assets/products/img/<c:out value="${prodkey.key.mainPicPath}" />" alt="#"></div>
					 
								

							<div class="card-body d-flex flex-column justify-content-between">
									<h4 class="title text-center">
										<a class="text-decoration-none text-dark" href="product?id=${prodkey.key.id }">
											<c:out value="${prodkey.key.name }" />
										</a>
									</h4>
								<ul class="review d-flex flex-wrap list-group-flush">
								
								<c:forEach items="${product.value }" var="prod">
									<c:forEach var="i" begin="1" end="${prod.key }">
										<li class="list-group-item"><i class="bi bi-star-fill text-warning"></i></li>
									</c:forEach>
									
									
									<c:forEach var="i" begin="1" end="${5-prod.key }">
										<li class="list-group-item"><i class="bi bi-star"></i></li>
										<p>
									</c:forEach>

									
									
									<li class="list-group-item"><span class="mx-2"><c:out value="${prod.value}" />

											Avis</span></li>
								</c:forEach>
								</ul>
								<c:if test="${prodkey.value >0}">
									<div class="d-flex">
									<h4 class="card-subtitle mb-2 me-5 text-muted " style="text-decoration:line-through">Prix :
										${prodkey.key.getPrice()}&euro;</h4>
										<strong style="color:red; 
										font-size:1.5rem;">${Math.round(prodkey.key.getPrice()*prodkey.value)}&euro; </strong>
									</div>
								</c:if>
								<c:if test="${prodkey.value ==0}">
								<div class="price text-center">
									<span class="fw-bold fs-4 text-primary">Prix: <c:out value="${prodkey.key.price }" /> &euro; TTC</span>
								</div>
								</c:if>
								<div  class="align-self-end mt-3" style="display: inline-flex;">
						
								<form method="post">
									<div class="mx-auto p-1">
										<button type="submit" class="btn btn-primary" style="width: 100%;"><i class="bi bi-cart-plus"></i></button>
									</div>
								
										<input type="hidden" name="idProd" value="<c:out value="${ prodkey.key.id }" />">
								</form>	
								  <div class="mx-auto p-1">
									<a href="product?id=${prodkey.key.id }" class="btn btn-success" title="Plus Info" ><i class="bi bi-plus-circle"></i></a>
								  </div>
								</div>
							</div>
							
						</div>
						<!-- End Single Product -->
					</div>

				</c:forEach>
				</c:forEach>
			</div>
		</div>
	</section>
</div>