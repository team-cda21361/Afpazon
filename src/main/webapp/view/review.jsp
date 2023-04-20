<script type="text/javascript" src="./assets/js/review.js"></script>

<c:if test="${not empty message}">
	<c:choose>
		<c:when test="${fn:contains(message, 'Erreur')}">
			<div class="sticky-top messageToUser errorMessage">
				<c:out value="${message}"/>
			</div>
		</c:when>
		<c:otherwise>
			<div class="sticky-top messageToUser">
				<c:out value="${message}"/>
			</div>
		</c:otherwise>
	</c:choose>
</c:if>

<section class="container-account my-5">
	<h1 class="text-center"><i class="bi bi-star-half"></i> Laisser un avis</h1>
	<div class="row my-3">
		<img class="productIMG" alt="..." src="./assets/products/img/${selectedProduct.mainPicPath}">
	</div>
	<div class="row my-3 mx-auto text-center">
		<h5 class="text-center mb-0"><c:out value="${selectedProduct.name}" /></h5>
		<div class="itemRef opacity-50 mb-3">Référence : <c:out value="${selectedProduct.reference}" /></div>
		<div class="container-description">
			<div class="text-center opacity-75 fw-bold">DESCRIPTION DU PRODUIT :</div>
			<div class="text-center"><c:out value="${selectedProduct.description}" /></div>
		</div>
	</div>
	<form method="post">
		<c:if test="${not empty review}">
			<input type="hidden" class="form-control" id="reviewAction" name="reviewAction" value="update">
		</c:if>
		<c:if test="${empty review}">
			<input type="hidden" class="form-control" id="reviewAction" name="reviewAction" value="create">
		</c:if>
		<input type="hidden" class="form-control" id="reviewID" name="reviewID" value="${review.id}">
		<input type="hidden" class="form-control" id="productID" name="productID" value="${selectedProduct.id}">
		<div class="mb-3">
			<div class="row">
				<label for="starsRating" class="form-label text-center mb-0">Note sur 5</label>
				<c:if test="${not empty review}">
					<input type="range" class="rating rating--nojs mx-auto" value="${review.stars}" max="5" step="1" oninput="this.style.setProperty('--value', this.value)" id="starsRating" name="starsRating">
				</c:if>
				<c:if test="${empty review}">
					<input type="range" class="rating rating--nojs mx-auto" value="0" max="5" step="1" oninput="this.style.setProperty('--value', this.value)" id="starsRating" name="starsRating">
				</c:if>
			</div>
			<div class="form-floating mx-auto mt-3 w-50">
				<textarea class="form-control" placeholder="Laissez un avis" id="reviewTextarea" name="reviewTextarea" style="height:150px"><c:out value="${review.content}" default=""/></textarea>
				<label for="reviewTextarea">Votre avis :</label>
			</div>
		</div>
		<div class="mb-3 text-center">
			<button type="submit" class="btn btn-primary">
				<c:if test="${not empty review}">
					Mettre à jour mon avis
				</c:if>
				<c:if test="${empty review}">
					Laisser un avis
				</c:if>
			</button>
		</div>
	</form>
</section>