<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<script defer type="text/javascript" src="./assets/js/product.js"></script>
<script type="text/javascript" src="./assets/jQuery/jquery-3.6.2.min.js"></script>
<br>
<c:if test="${msnType.equals('OK')}">
		<div class="alert alert-success timer" role="alert">
			<c:out value="${msn }"></c:out>
		</div>
</c:if>
<c:if test="${msnType.equals('KO')}">
		<div class="alert alert-danger timer" role="alert">
			<c:out value="${msn }"></c:out>
		</div>
</c:if>

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
											src="assets/products/img/<c:out value="${ product.getMainPicPath() }" />"
											id="current" alt="#" class="img">
									</div>
								</div>
								<div class="images">
									<div class="img-div">
										<img
											src="assets/products/img/<c:out value="${ product.getMainPicPath() }" />"
											alt="#" class="img">
									</div>

									<c:forEach items="${ images }" var="images" varStatus="status">
										<div class="img-div">
											<img
												src="assets/products/img/<c:out value="${ images.getPicPath() }" />"
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
								<c:out value="${ product.getName()}"/>
							</h2>
							<p class="category">
								<c:if test="${not empty category }">
									<i class="bi bi-link-45deg"></i> Categorie:<a href="categories?catID=<c:out value="${category.getId()}"/>"><c:out value="${category.getCategory()}"/></a>
								</c:if>
								<c:if test="${empty category }">
									<i class="bi bi-link-45deg"></i> Categorie: Non disponible.
								</c:if>
							</p>
							

							
							
						    <c:if test="${empty discount }">		
								<h3 class="price">
									<c:out value="${ product.getPrice() }" />
									&euro; <span></span>
								</h3>
							</c:if>
							
						    <c:if test="${not empty discount }">		
								<h3 class="price"><c:out value="${ String.format( '%.2f', discount.getProduct().getPrice()-(discount.getProduct().getPrice()*discount.getDiscount().getPercent()))  }" />
									
									&euro; <span><c:out value="${ discount.getProduct().getPrice() }" /> &euro; </span>
								</h3>
								<p id="prom">Produit en promotion <c:out value="${ String.format( '%.2f', discount.getDiscount().getPercent()*100) }" /> %</p>
							</c:if>
							
							
							<p class="info-text">
								<c:out value="${ product.getDescription() }" />
							</p>
							<div class="row">
								<div class="col-lg-4 col-md-4 col-12">
									<div class="form-group">
										<h6>Couleur</h6>
										<div class="single-checkbox checkbox-style-1">
									<c:if test="${ not empty product.getColor()  }">
									    <p><c:out value="${ product.getColor()  }" /></p> 
									</c:if>	
									<c:if test="${ empty product.getColor()  }">
									    <p> Non spécifié. </p>
									</c:if>
									
									
						
										</div>

									</div>
								</div>
								<div class="col-lg-4 col-md-4 col-12">
									<div class="form-group ">
										<h6>Quantité</h6>
										<div class="cantite">
										<form method="post">
											<button type="submit" class="btn btn-light" name="minus"
												value="<c:out value="${ cantite }" />">
												<i class="bi bi-dash-circle"></i>
											</button>
										</form>
										<p> <c:out value=" ${ cantite } " /> </p>
										<form method="post">
											<button type="submit" class="btn btn-light" name="plus"
												value="<c:out value="${ cantite }" />">
												<i class="bi bi-plus-circle"></i>
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
									    		<a href="#refstars" ><c:out value="${ reviewTP }" /> Avis</a>
									    	</c:if>	
			
										</div>
										
									</div>
								</div>
								
							</div>
							
							<div class="bottom-content">
								<div class="row align-items-end">
									<div class="col-lg-4 col-md-4 col-12">
									<form method="post">
										<div class="button cart-button">
											<button type="submit" class="btn btn-primary" style="width: 100%;"><i
												class="bi bi-cart-plus"></i> Ajouter</button>
										</div>
										<input type="hidden" name="idProd" value="<c:out value="${ product.getId() }" />">
										<input type="hidden" name="cantiteProd" value="<c:out value="${ cantite }" />">
									</form>	
									</div>
									<div class="col-lg-4 col-md-4 col-12">
										<div class="button cart-button">
											
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
							  <c:if test="${ not empty product.getVideoPath() }">	
								<h4>Video</h4>							
								<video controls class="video">
								  <source src="assets/products/vid/<c:out value="${ product.getVideoPath() }" />" type="video/mp4">
								  <source src="assets/products/vid/<c:out value="${ product.getVideoPath() }" />" type="video/webm">
								  <p>Votre navigateur ne prend pas en charge les vidéos HTML5.
								     Voici <a href="assets/products/vid/<c:out value="${ product.getVideoPath() }" />">un lien pour télécharger la vidéo</a>.</p>
								</video>
							  </c:if>
								
								<h4>Details</h4>
								<p>	<c:out value="${ product.getDescription() }" /></p>
								<h4>Caractéristiques</h4>
								<ul class="features">
								    <li><strong>Taille:</strong>  
								    <c:if test="${ not empty product.getSize() }">
									    <c:out value="${ product.getSize() }" />
									</c:if>	
									<c:if test="${ empty product.getSize() }">
									    Non spécifié.
									</c:if>
	 
									</li>
									<li><strong>Poids: </strong>
									<c:if test="${ not empty product.getWeight() }">
									    <c:out value="${ product.getWeight() }" /> Kg.
									</c:if>	
									<c:if test="${ empty product.getWeight() }">
									    Non spécifié.
									</c:if>
									</li>							
									<li><strong>Garantie: </strong> 
									
									<c:if test="${ not empty product.getWarranty() }">
									    <c:out value="${ product.getWarranty() }" /> an/ans.
									</c:if>	
									<c:if test="${ empty product.getWarranty() }">
									    Non spécifié.
									</c:if>

									</li>
									<li><strong>Référence: </strong> 
									
									<c:if test="${ not empty product.getReference() }">
									    <c:out value="${ product.getReference() }" /> 
									</c:if>	
									<c:if test="${ empty product.getReference() }">
									    Non spécifié.
									</c:if>
									 <li><strong>Stock:</strong>  
								    <c:if test="${ not empty stock }">
									    <c:out value="${ stock }" />
									</c:if>	
									<c:if test="${ empty stock }">
									    Non spécifié.
									</c:if>
									
									
									</li>
								</ul>
								

							</div>
						</div>
						<div class="col-lg-6 col-12">
							<div class="info-body" id="list-Reviews">
								<a name="refstars"></a>
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

	

</main>
