<div class="container">


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
					<div class="m-3 ">
						<!-- Start Single Product -->

						<div class="card h-100"  style="width: 16rem">
						<div class="img-top"> <img class="card-img-top img-fluid" src="assets/products/img/<c:out value="${product.key.mainPicPath}" />" alt="#"></div>
					 
								

							<div class="card-body d-flex flex-column">
									<h4 class="title text-center">
										<a class="text-decoration-none text-dark" href="product?id=${product.key.id }">
											<c:out value="${product.key.name }" />
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
								
								<div class="price text-center">
									<span class="fw-bold fs-4 text-primary">Prix: <c:out value="${product.key.price }" /> &euro; TTC</span>
								</div>
								<div class="button btn btn-success align-self-end mt-3">
									<a href="product-details.html" class="text-light text-decoration-none">
									<i class="bi bi-cart4"></i></a>
								</div>
							</div>
							
						</div>
						<!-- End Single Product -->
					</div>

				</c:forEach>
			</div>
		</div>
	</section>
</div>