
<!-- <script src="./assets/js/backoffice.js"></script> -->
<script defer src="assets/js/userReviewsManagement.js"></script>
<div class="container">
	<h3 class="col-12 text-center my-3">
		Gestion avis du produit :
		<c:out value="${product.name}" />
		référence
		<c:out value="${product.reference}" />
	</h3>
	<c:if test="${not empty error }">
		<div class="alert alert-danger" role="alert">
	  		<c:out value="${error }"></c:out>
		</div>
	</c:if>
	<div class="row mt-5">
		<div class="col-6 mt-5">
			<div class="row">
			<div class="col-8 ">
				<img class="backReviewImage" src="assets/products/img/<c:out value="${product.mainPicPath}" />" alt="${product.mainPicPath}" >
			</div>
			<div class="col-4">
				<c:forEach items="${stars_reviews}" var="stars_review" varStatus="loop">
					<ul class="d-flex flex-wrap">
						<li ><span class="me-2 text-dark"><c:out value="${stars_review}" /> avis </span> 
						<c:forEach var="i" begin="1" end="${5 - loop.index}">
								<li style="color: #ffa000;" class="reviewStar"><i class="bi-star-fill"></i></li>
						</c:forEach>
						 <c:forEach var="i" begin="1" end="${loop.index }">
								<li style="color: grey;" class="reviewStar"><i class="bi bi-star"></i></li>
						</c:forEach>
						</li>
					</ul>
				</c:forEach>
			</div>
		</div>
		  <div class="mt-5">
			<h4>Liste des avis :</h4>
			<table id="example" class="display" style="width: 100%">
				<thead>
					<tr>
						<th>Contenu</th>
						<th>Note</th>
						<th>Sélectionner</th>
						<th>Supprimer</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${reviews}" var="review">
						<tr>
							<td>${review.content }</td>
							<td>${review.stars }</td>
							<td><a href="user-reviews-management?editOption=1&id=${review.id }&productId=${product.id}"><img alt="" src="assets/images/back_office/editIcon.png" width="20"></a></td>
							<td><a class="toModal" href="user-reviews-management?deleteOption=1&id=${review.id }&productId=${product.id}" data-bs-toggle="modal" data-bs-target="#exampleModal"><img alt="" src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		  </div>
		</div>
		<div class=" col-6 mt-5">
			<form method="post" action="user-reviews-management?productId=${product.id}">
				<label class="form-label">Contenu :</label>
				<textarea name="review" class="form-control" style="height: 200px; " required><c:if test="${not empty editReview.content }"><c:out value="${editReview.content }"/></c:if></textarea>
				<input type="hidden" name="reviewId"  value="${editReview.id }" readonly>
			<div class=" w-25 ms-1 mt-5">
			<label class="form-label">Note :</label>
				<select class="form-select" aria-label="Default select example" name="stars" >
					<option ${editReview.stars=="1"?"selected":""} value="1">1</option>
					<option ${editReview.stars=="2"?"selected":""} value="2">2</option>
					<option ${editReview.stars=="3"?"selected":""} value="3">3</option>
					<option ${editReview.stars=="4"?"selected":""} value="4">4</option>
					<option ${editReview.stars=="5"?"selected":""} value="5">5</option>
				</select>
			</div>
			<div class="d-flex justify-content-end mt-2">
					<c:if test="${not empty editReview}">
						<button name="editBtn" type="submit" class="btn btn-primary mb-2 me-4">Modifier</button>
					</c:if>
					<c:if test="${empty editReview}">
						<button name="addBtn" type="submit" class="btn btn-primary mb-2 me-4">Ajouter</button>
					</c:if>
				</div>
			</form>
		</div>
			
			<!-- Modal -->
		<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
			 <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalLabel">Effacer</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			      </div>
			      <div class="modal-body">
			       Voulez-vous vraiment effacer  cet avis?
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
			        <a href="" id="modal">
			        <button type="button" class="btn btn-primary">Effacer</button>
			        </a>
			      </div>
			    </div>
			 </div>
		</div>
	</div>
</div>