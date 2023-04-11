<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<script defer type="text/javascript" src="./assets/js/product.js"></script>
<script type="text/javascript" src="./assets/jQuery/jquery-3.6.2.min.js"></script>


<main>
	<br>
	

	<!-- Start Item Details -->
	<section class="item-details section">
		<div class="container">
			<div class="top-area">
				<div class="row align-items-center">
					<div class="col-lg-6 col-md-12 col-12">
						<div class="product-images">
							<main id="gallery">
								<div class="main-img">
									<div class="img-div-current">
										<img
											src="assets/images/product-details/<c:out value="${ product.getMainPicPath() }" />"
											id="current" alt="#" class="img">
									</div>
								</div>
								<div class="images">
									<div class="img-div">
										<img
											src="assets/images/product-details/<c:out value="${ product.getMainPicPath() }" />"
											alt="#" class="img">
									</div>

									<c:forEach items="${ images }" var="images" varStatus="status">
										<div class="img-div">
											<img
												src="assets/images/product-details/<c:out value="${ images.getPicPath() }" />"
												class="img" alt="#">
										</div>
									</c:forEach>

								</div>
							</main>
						</div>
					</div>
					<div class="col-lg-6 col-md-12 col-12">
						<div class="product-info">
							
							
							<h2 class="title">
								<c:out value="${ product.getName() }" />
							</h2>
							<p class="category">
								<i class="lni lni-tag"></i> Categorie:<a href="javascript:void(0)">Categorie product</a>
							</p>
							
							
						    <c:if test="${empty discount }">		
								<h3 class="price">
									<c:out value="${ discount.getProduct().getPrice() }" />
									&euro; <span>-</span>
								</h3>
							</c:if>
							
						    <c:if test="${not empty discount }">		
								<h3 class="price"><c:out value="${ discount.getProduct().getPrice()-(discount.getProduct().getPrice()*discount.getDiscount().getPercent())  }" />
									
									&euro; <span><c:out value="${ discount.getProduct().getPrice() }" /> &euro; </span>
								</h3>
							</c:if>
							
							
							<p class="info-text">
								<c:out value="${ product.getDescription() }" />
							</p>
							<div class="row">
								<div class="col-lg-4 col-md-4 col-12">
									<div class="form-group">
										<h6>Choose color</h6>
										<div class="single-checkbox checkbox-style-1">
											<p><c:out value="${ product.getColor() }" /></p>
										</div>

									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-12">
									<div class="form-group ">
										<h6>Cantite</h6>
										<div class="cantite">
										<form method="post">
											<button type="submit" class="btn btn-light" name="plus"
												value="<c:out value="${ cantite }" />">
												<i class="bi bi-plus-circle"></i>
											</button>
										</form>
										<p> <c:out value=" ${ cantite } " /> </p>
										<form method="post">
											<button type="submit" class="btn btn-light" name="minus"
												value="<c:out value="${ cantite }" />">
												<i class="bi bi-dash-circle"></i>
											</button>
										</form>
										</div>
									</div>
								</div>
								
								
								<div class="col-lg-4 col-md-4 col-12">
									<div class="form-group ">
								
										<div class="stars">
									    <input type="hidden" name="startProm" id="startProm" value="<c:out value="${ startP }" />">
							
											<div class="stars-outer">
									          <div class="stars-inner">
									          </div>
									        </div>
								      		<c:if test="${ reviewTP != 0 }">
									    		<c:out value="${ reviewTP }" />
									    	</c:if>	
			
										</div>
										
									</div>
								</div>
								
							</div>
							
							<div class="bottom-content">
								<div class="row align-items-end">
									<div class="col-lg-4 col-md-4 col-12">
										<div class="button cart-button">
											<button class="btn btn-primary" style="width: 100%;"><i
												class="bi bi-cart-plus"></i> Ajouter</button>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-12">
										<div class="button cart-button">
											<button type="button" class="btn btn-success"
												data-bs-toggle="modal" data-bs-target="#exampleModal">
												Me prevenir</button>
										</div>
									</div>
									<div class="col-lg-4 col-md-4 col-12">
										<div class="wish-button">
											
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="product-details-info">
				<div class="single-block">
					<div class="row">
						<div class="col-lg-6 col-12">
							<div class="info-body custom-responsive-margin">
								<h4>Details</h4>
								<p>	<c:out value="${ product.getDescription() }" /></p>
								<h4>Caractéristiques</h4>
								<ul class="features">
								<li><strong>Size:</strong>
									<c:out value="${ product.getSize() }" /></li>
									<li><strong>Weihgt:</strong>
									<c:out value="${ product.getWeight() }" /></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-6 col-12">
							<div class="info-body" id="list-Reviews">
								<h4><c:if test="${reviewTP != 0 }"> <c:out value="${reviewTP }" /> </c:if> Commentaires</h4>
								<hr>
								<c:if test="${not empty review }">
								<c:forEach items="${ review }" var="review" varStatus="status">
										<div class="justify-content-center  border-left border-right">
											<div class="d-flex justify-content-center py-1">
												<div class="second py-2 px-2">
													<span class="text1"><c:out value="${ review.getContent() }" /> </span>
													
													<div class="d-flex justify-content-between py-1 pt-2">
														<div>
															<i class="bi bi-person-circle"></i><span class="text2"><c:out value="${ review.getUser().getFirstName() }" /> <c:out value="${ review.getUser().getLastName() }" /></span>
														</div>
														<div>
															<span class="text3"> </span>
															
															<c:forEach var = "i" begin = "1" end = "5">											
																<c:if test="${ i <= review.getStars() }">
																 	<i class="bi bi-star-fill text3o"></i>
																</c:if>
																<c:if test="${ i > review.getStars() }">
																 	<i class="bi bi-star text3o"></i> 
																</c:if>
																
															</c:forEach>
															<span class="text4">
														    <c:out value="${ review.getStars() }" /></span>
														</div>
													</div>
												</div>
											</div>
									</c:forEach>

<!-- 
											<button type="submit" class="btn btn-primary" class="show_more" name="show_more" id="show_more"  value="<c:out value="${ lastIdReview }" />">
												Voir plus
											</button>
 -->
									
											
									</c:if>
									<c:if test="${empty review }">
									<p class="commentaire">Ce produit n'a pas été noté ni commenté.</p>
									</c:if>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End Item Details -->
	



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Modal
						title</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">...</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>


</main>
