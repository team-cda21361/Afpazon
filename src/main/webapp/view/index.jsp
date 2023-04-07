	<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" %>
			<script defer src="./assets/js/swiper-bundle.min.js"></script>
			<script defer src="./assets/js/slider.js"></script>

			
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 col-md-6 col-12">
					<div class="nav-inner">
						<!-- Start Navbar -->
						<nav class="navbar navbar-expand-lg">
							<button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
								aria-expanded="false" aria-label="Toggle navigation">
								<span class="toggler-icon"></span> <span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item"><a href="index.html" class="nav-link"
											aria-label="Toggle navigation">Promotion</a></li>
									<li class="nav-item"><a href="index.html" class="nav-link"
											aria-label="Toggle navigation">Nouveauter</a></li>
									<li class="nav-item"><a href="contact.html" class="nav-link"
											aria-label="Toggle navigation">Contactez nous</a></li>
								</ul>
							</div>
							<!-- navbar collapse -->
						</nav>
						<!-- End Navbar -->
					</div>
				</div>
			</div>
		</div>
		<hr>
		<h3>Carousel produits discounts</h3>
		<hr>
			<section>
				<div class="container-fluid">
					<div class="container swiper">
						<div class="slide-container">
							<div class="card-wrapper swiper-wrapper">
								<c:forEach items="${ newProdSponsored }" var="productSponsored" varStatus="status">
									<div class="card swiper-slide">
										<div class="image-box">
											<img src="assets/products/img/${productSponsored.getProduct().getMainPicPath()}"
												alt="" />
										</div>
										<div class="card-body">
											<h3 class="card-title">${productSponsored.getProduct().getName()}</h3>
												<div class="collapse" id="collapse5${status.index}">
										<p class="card-text">${productSponsored.getProduct().getDescription()}</p>
									</div>
									<button class="btn btn-link text-primary btn-toggle-details"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#collapse5${status.index}" aria-expanded="false"
										aria-controls="collapse${status.index}">Voir plus</button>
											<h4 class="card-subtitle mb-2 text-muted"><strong>Prix :
												</strong>${productSponsored.getProduct().getPrice()} &euro;</h4>
											<div class="d-flex justify-content-between align-items-center">
												<div class="btn-group">
													<a href="#" class="btn btn-primary"><i
															class="bi bi-cart-plus"></i></a>
													<a href="product?id=${productSponsored.getProduct().getId()}"
														class="btn btn-success" title="Plus Info"><i
															class="bi bi-plus-circle"></i></a>
												</div>
												<small class="text-muted"><strong>Code de réduction :</strong>
													${productSponsored.getDiscount().getPercent()}</small>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
							<div class="swiper-button-next swiper-navBtn"></div>
							<div class="swiper-button-prev swiper-navBtn"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</section>
		<hr>
		
			<%-- <c:import url="carousel/slider.jsp"></c:import> --%>
		<h3>Carousel New produit</h3>
		<hr>

				<section>
					<div class="container-fluid">
						<div class="container swiper">
							<div class="slide-container">
								<div class="card-wrapper swiper-wrapper">
									<c:forEach items="${discountsProdSponsoring}" var="productDiscount" varStatus="status">
										<div class="card swiper-slide">
											<div class="image-box">
												<img class="myImg" src="assets/products/img/<c:out value="${ productDiscount.getProduct().getMainPicPath() }" />" alt="<c:out value="${ productDiscount.getProduct().getName() }" />">
											</div>
											<div class="card-body">
												<h3 class="card-title">${productDiscount.getProduct().getName()}</h3>
												
													<div class="collapse" id="collapse3${status.index}">
										<p class="card-text">${productDiscount.getProduct().getDescription()}</p>
									</div>
									<button class="btn btn-link text-primary btn-toggle-details"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#collapse3${status.index}" aria-expanded="false"
										aria-controls="collapse${status.index}">Voir plus</button>
							
													<h4 class="card-subtitle mb-2 text-muted"><strong>Prix :
														</strong>${productDiscount.getProduct().getPrice()} &euro;</h4>
													<div class="d-flex justify-content-between align-items-center">
														<div class="btn-group">
															<a href="#" class="btn btn-primary"><i
																	class="bi bi-cart-plus"></i></a>
															<a href="product?id=${productDiscount.getId()}"
																class="btn btn-success" title="Plus Info"><i
																	class="bi bi-plus-circle"></i></a>
														</div>
														<small class="text-muted"><strong>Code de Reference :</strong>
															${productDiscount.getProduct().getReference()}</small>
													</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="swiper-button-next swiper-navBtn"></div>
								<div class="swiper-button-prev swiper-navBtn"></div>
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</section>
			<hr>

			<h3>Carousel New Sponsort</h3>

			<hr>
				<section>
					<div class="container-fluid">
						<div class="container swiper">
							<div class="slide-container">
								<div class="card-wrapper swiper-wrapper">
									<c:forEach items="${newProdCarousel }" var="Newproduct" varStatus="status">
										<div class="card swiper-slide">
											<div class="image-box">
												<img class="myImg" src="assets/products/img/<c:out value="${ Newproduct.getMainPicPath() }" />" alt="<c:out value="${ Newproduct.getName() }" />">
											</div>
											<div class="card-body">
												<h3 class="card-title">${Newproduct.getName()}</h3>
												<div class="product-details">
												<div class="collapse" id="collapse2${status.index}">
										<p class="card-text">${Newproduct.getDescription()}</p>
									</div>
									<button class="btn btn-link text-primary btn-toggle-details"
										type="button" data-bs-toggle="collapse"
										data-bs-target="#collapse2${status.index}" aria-expanded="false"
										aria-controls="collapse${status.index}">Voir plus</button>
												</div>
												<h4 class="card-subtitle mb-2 text-muted"><strong>Prix :
													</strong>${Newproduct.getPrice()} &euro;</h4>
												<div class="d-flex justify-content-between align-items-center">
													<div class="btn-group">
														<a href="#" class="btn btn-primary"><i
																class="bi bi-cart-plus"></i></a>
														<a href="product?id=${Newproduct.getId()}"
															class="btn btn-success" title="Plus Info"><i
																class="bi bi-plus-circle"></i></a>
													</div>
													<small class="text-muted"><strong>Code de Reference :</strong>
														${Newproduct.getReference()}</small>
												</div>
											</div>
										</div>
									</c:forEach>
								</div>
								<div class="swiper-button-next swiper-navBtn"></div>
								<div class="swiper-button-prev swiper-navBtn"></div>
								<div class="swiper-pagination"></div>
							</div>
						</div>
					</div>
				</section>
			<hr>
				
				
		<hr>
			<section id="section4">
					<div class="container">
						<h2 class="text-center mb-4">Témoignages de nos clients</h2>
						<div class="row">
							<div class="col-md-6 col-lg-4">
								<div class="card mb-4">
									<div class="card-header bg-white text-center">
										<i class="bi bi-chat-right-quote-fill text-muted fs-2"></i>
									</div>
									<div class="card-body">
										<p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
											Sed euismod rhoncus tellus nec varius. Duis a eros quis sapien iaculis
											accumsan. In malesuada vulputate quam, quis finibus turpis maximus eget."
										</p>
										<p class="card-text text-end"><small class="text-muted">- John Doe</small></p>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4">
								<div class="card mb-4">
									<div class="card-header bg-white text-center">
										<i class="bi bi-chat-right-quote-fill text-muted fs-2"></i>
									</div>
									<div class="card-body">
										<p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
											Sed euismod rhoncus tellus nec varius. Duis a eros quis sapien iaculis
											accumsan. In malesuada vulputate quam, quis finibus turpis maximus eget."
										</p>
										<p class="card-text text-end"><small class="text-muted">- Jane Doe</small></p>
									</div>
								</div>
							</div>
							<div class="col-md-6 col-lg-4">
								<div class="card mb-4">
									<div class="card-header bg-white text-center">
										<i class="bi bi-chat-right-quote-fill text-muted fs-2"></i>
									</div>
									<div class="card-body">
										<p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
											Sed euismod rhoncus tellus nec varius. Duis a eros quis sapien iaculis
											accumsan. In malesuada vulputate quam, quis finibus turpis maximus eget."
										</p>
										<p class="card-text text-end"><small class="text-muted">- Bob Smith</small></p>
									</div>
								</div>
							</div>
						</div>
						<div class="text-center">
							<a href="#" class="btn btn-lg btn-primary">Voir plus de témoignages</a>
						</div>
					</div>
				</section>
<!-- The Modal -->
<div id="myModal" class="modal">
  <span class="close">&times;</span>
  <img class="modal-content" id="img01">
  <div id="caption"></div>
</div>
				
				<br>
<!-- ---------------------------------------------------End CAROURSEL -------------------------->
				