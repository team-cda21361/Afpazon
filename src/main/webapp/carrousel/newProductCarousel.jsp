       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       
             <section>
					<div class="container-fluid">
						<div class="container swiper">
							<div class="slide-container">
								<div class="card-wrapper swiper-wrapper">
									<c:forEach items="${ newProdCarousel }" var="Newproduct" varStatus="status">
										<div class="card swiper-slide">
											<div class="image-box">
												<img class="myImg" src="assets/products/img/<c:out value="${ Newproduct.key.getMainPicPath() }" />" alt="<c:out value="${ Newproduct.key.getName() }" />">
											</div>
											<div class="card-body">
												<h3 class="card-title">${ Newproduct.key.getName() }</h3>
												<div class="product-details">
												<div class="collapse" id="collapse2${status.index}">
										<p class="card-text">${ Newproduct.key.getDescription() }</p>
									</div>
											</div>
											<ul class="review d-flex flex-wrap list-group-flush">
												<c:forEach items="${Newproduct.value }" var="prod">
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
												<h4 class="card-subtitle text-muted"><strong>Prix :
													</strong>${Newproduct.key.getPrice()} &euro;</h4>
												<div class="d-flex justify-content-between align-items-center">
													<div class="btn-group">
														<a href="?idProd=${Newproduct.key.getId()}" class="btn btn-primary"><i
																class="bi bi-cart-plus"></i></a>
														<a href="product?id=${Newproduct.key.getId()}"
															class="btn btn-success" title="Plus Info"><i
																class="bi bi-plus-circle"></i></a>
													</div>
													<small class="text-muted"><strong>Code de Reference :</strong>
														${ Newproduct.key.getReference() }</small>
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
			

			