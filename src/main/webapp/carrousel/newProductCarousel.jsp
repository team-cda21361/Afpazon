       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       
             <section>
					<div class="container-fluid">
						<div class="container swiper">
							<div class="slide-container">
								<div class="card-wrapper swiper-wrapper">
									<c:forEach items="${ newProdCarousel }" var="Newproduct" varStatus="status">
										<div class="card swiper-slide">
											<div class="image-box">
												<img class="myImg" src="assets/products/img/<c:out value="${ Newproduct.getMainPicPath() }" />" alt="<c:out value="${ Newproduct.getName() }" />">
											</div>
											<div class="card-body">
												<h3 class="card-title">${ Newproduct.getName() }</h3>
												<div class="product-details">
												<div class="collapse" id="collapse2${status.index}">
										<p class="card-text">${ Newproduct.getDescription() }</p>
									</div>
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
														${ Newproduct.getReference() }</small>
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
			

			