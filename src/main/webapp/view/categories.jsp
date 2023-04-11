<div class="container">


	<!-- /************************/
	/*  Caroussel a ajouter */
	/************************/ -->

	<section class="trending-product section" style="margin-top: 12px;">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="section-title">
						<h2>
							Produits catégorie :
							<c:out value="${categorie}" />
						</h2>
					</div>
				</div>
			</div>
			<div class="d-flex flex-wrap m-4">
				<c:forEach items="${products}" var="product">
					<div class="m-3 ">
						<!-- Start Single Product -->
						<div class="card" style="width: 16rem">
								<img class="card-img-top" src="<c:out value="${product.mainPicPath}" />" alt="#">
							<div class="card-body d-flex flex-column">
									<h4 class="title text-center">
										<a class="text-decoration-none text-dark" href="product?id=${product.id }">
											<c:out value="${product.name }" />
										</a>
									</h4>
								<ul class="review d-flex flex-wrap list-group-flush">
									<c:forEach var="i" begin="1" end="${moyen_note }">
										<li class="list-group-item"><i class="bi bi-star-fill text-warning"></i></li>
										<p>
									</c:forEach>
									<c:forEach var="i" begin="1" end="${5 - moyen_note }">
										<li class="list-group-item"><i class="bi bi-star"></i></li>
										<p>
									</c:forEach>
									<li class="list-group-item"><span class="mx-2"><c:out value="${number_of_review}" />
											Avis</span></li>
								</ul>
								<div class="price text-center">
									<span class="fw-bold fs-4 text-primary">Prix: <c:out value="${product.price }" /> &euro; TTC</span>
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