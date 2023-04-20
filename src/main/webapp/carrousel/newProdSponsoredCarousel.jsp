   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
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
													${productSponsored.getProduct().getReference()}</small>
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