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
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Start Single Product -->
						<div class="single-product">
							<div class="product-image">
								<img src="<c:out value="${product.mainPicPath}" />" alt="#">
								<div class="button">
									<a href="product-details.html" class="btn"><i
										class="lni lni-cart"></i> Add to Cart</a>
								</div>
							</div>
							<div class="product-info">
								<h4 class="title">
									<a href="product-grids.html"><c:out
											value="${product.name }" /></a>
								</h4>
								<ul class="review d-flex flex-wrap">
									<c:forEach var="i" begin="1" end="${moyen_note }">
										<li><i class="lni lni-star-filled"></i></li>
										<p>
									</c:forEach>
									<c:forEach var="i" begin="1" end="${5 - moyen_note }">
										<li><i class="lni lni-star"></i></li>
										<p>
									</c:forEach>
									<li><span><c:out value="${number_of_review}" />
											Avis</span></li>
								</ul>
								<div class="price">
									<span><c:out value="${product.price }" /></span>
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