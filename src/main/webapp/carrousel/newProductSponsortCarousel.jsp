 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
             <section>
					<div class="container-fluid"> 
						<div class="container swiper">
							<div class="slide-container">
								<div class="card-wrapper swiper-wrapper">
								
								
									<c:forEach items="${newProdSponsored}" var="product" varStatus="status">
										<div class="card swiper-slide">
											<div class="image-box">
										
												<img class="myImg" src="assets/products/img/<c:out value="${ product.key.getMainPicPath() }" />" alt="<c:out value="${ product.key.getName() }" />">
											</div>
											<div class="card-body">
												<h3 class="card-title">${product.key.getName()}</h3>
												
													<div class="collapse" id="collapse3${status.index}">
													<p class="card-text">${product.key.getDescription()}</p>
												</div>
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
											<h4 class="card-subtitle mb-2 text-muted"><strong>Prix :
													</strong>${product.key.getPrice()} &euro;</h4>
												<div class="d-flex justify-content-between align-items-center">
													<div class="btn-group">
														<a href="?idProd=${product.key.getId()}" class="btn btn-primary"><i
																class="bi bi-cart-plus"></i></a>
														<a href="product?id=${product.key.getId()}"
															class="btn btn-success" title="Plus Info"><i
																class="bi bi-plus-circle"></i></a>
													</div>
													<small class="text-muted"><strong>Code de Reference :</strong>
														${product.key.getReference()}</small>
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