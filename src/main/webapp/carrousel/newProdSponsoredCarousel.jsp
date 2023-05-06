   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
  
             <section>
				<div class="container-fluid">
					<div class="container swiper">
						<div class="slide-container">
							<div class="card-wrapper swiper-wrapper position-relative">
								<c:forEach items="${ discountsProdSponsoring }" var="product" >
								<c:forEach items="${ product.key }" var="prodkey" >
								
									<div class="card swiper-slide">
								<span class=" position-absolute" id="promo">Promo!</span>
										<div class="image-box">
											<img class="myImg" src="assets/products/img/${prodkey.key.getMainPicPath()}"
												alt="" />
										</div>
									<div class="card-body">
											<h3 class="card-title">${prodkey.key.getName()}</h3>
											
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
											<div class="d-flex">
											<h4 class="card-subtitle mb-2 me-5 text-muted " style="text-decoration:line-through"><strong >Prix :
												</strong>${prodkey.key.getPrice()} &euro;</h4>
												<strong style="color:red; 
												font-size:1.5rem;">${Math.round(prodkey.key.getPrice()*prodkey.value)} &euro; </strong>
											</div>				
											<div class="d-flex justify-content-between align-items-center">
												<div class="btn-group">
													<a href="?idProd=${prodkey.key.getId()}" class="btn btn-primary"><i
															class="bi bi-cart-plus"></i></a>
													<a href="product?id=${prodkey.key.getId()}"
														class="btn btn-success" title="Plus Info"><i
															class="bi bi-plus-circle"></i></a>
												</div>
												<small class="text-muted"><strong>Code de réduction :</strong>
													${prodkey.key.getReference()}</small>
											</div>
										</div>
									</div>
									</c:forEach>
								</c:forEach>
							</div>
							<div class="swiper-button-next swiper-navBtn"></div>
							<div class="swiper-button-prev swiper-navBtn"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</section>