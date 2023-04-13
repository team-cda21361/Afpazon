 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
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