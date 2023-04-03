<script src="assets/js/userReviewsManagement.js"></script>
<div class="container">
	<h3 class="col-12 text-center my-3">
		Gestion avis du produit :
		<c:out value="${product.name}" />
		référence
		<c:out value="${product.reference}" />
	</h3>
	<div class="row">
		<div class="d-flex col-6">
			<div class="w-50 me-3">
				<img src="<c:out value="${product.mainPicPath}" />" alt="#">
			</div>
			<div class="mt-5 ms-3">
				<c:forEach items="${stars_reviews}" var="stars_review"
					varStatus="loop">
					<ul class="d-flex flex-wrap">
						<li><span class="me-2 text-dark"><c:out
									value="${stars_review}" /> avis </span> <c:forEach var="i" begin="1"
								end="${5 - loop.index}">
								<li style="color: #ffa000;"><i class="lni lni-star-filled"></i></li>
							</c:forEach> <c:forEach var="i" begin="1" end="${loop.index }">
								<li style="color: grey;"><i class="lni lni-star"></i></li>
							</c:forEach></li>
					</ul>
				</c:forEach>
			</div>
		</div>
		<div class=" col-6">
			<label class="form-label">Contenu :</label>
			<textarea class="form-control" style="height: 200px;"></textarea>
		</div>
	</div>
	<div class="row">
		<div class="col-6 mt-5">
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
							<td><a href="dashboard?id=${review.id }"><i
									class="bi bi-pencil-square"></i></a></td>
							<td><a href="dashboard?id=${review.id }"><i
									class="bi bi-trash3-fill"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="col-6 mt-5">
			<div class="row w-25 ms-1">
			<label class="form-label">Note :</label>
				<select class="form-select" aria-label="Default select example">
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
			</div>
			<div class="col-6 mt-5 w-100 d-flex justify-content-center">
				<div class="d-flex">
					<button type="submit" class="btn btn-primary mb-2 me-4">
						Ajouter/Modifier</button>
					<button type="submit" class="btn btn-danger mb-2">
						Supprimer</button>
				</div>
			</div>
		</div>
	</div>
</div>