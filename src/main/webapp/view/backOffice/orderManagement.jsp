<script src="assets/js/orderManagement.js"></script>
<div class="container w-75">
	<h3 class="col-12 text-center mt-5">
		<c:if test="${action == 'add'}">
			<c:out value="Ajout " />
		</c:if>
		<c:if test="${action == 'update'}">
			<c:out value="Modification " />
		</c:if>
		de commande
	</h3>

	<form class="w-100 ">
		<div class="row mt-5">
			<div class="col-4 mb-1">
				<label class="form-label">Id commande :</label> <input type="text"
					class="form-control" name="id_order" value="${order.id }">
			</div>
			<div class="col-4 mb-1">
				<label class="form-label">Date de la commande :</label> <input
					type="text" class="form-control" name="order_date" value="${order.date }">
			</div>
			<div class="col-4 mb-1">
				<label class="form-label">Total (TVA incluse) : </label> <input
					type="email" class="form-control" name="total" value="20">
			</div>
		</div>
		<div class="row justify-content-center mt-5">
			<div class="w-75">
				<h4>Liste des produits :</h4>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Nom</th>
							<th>Référence</th>
							<th>Prix</th>
							<th>Quantité</th>
							<th>Promo</th>
							<th>Sélectionner</th>
							<th>Supprimer</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${products}" var="product">
							<tr>
								<td>${product.name }</td>
								<td>${product.reference }</td>
								<td>${product.price }</td>
								<td>2</td>
								<td>20%</td>
								<td><a href="dashboard?id=${product.id }"><i
										class="bi bi-pencil-square"></i></a></td>
								<td><a href="dashboard?id=${product.id }"><i
										class="bi bi-trash3-fill"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-4 mb-1">
				<label class="form-label">Transporteur :</label> <input type="text"
					class="form-control" name="id_order" value="DHL">
			</div>
			<div class="col-4 mb-1">
				<label class="form-label">Numéro de suivi :</label> <input
					type="text" class="form-control" name="first_name" value="${order.trackingNumber}">
			</div>
			<div class="col-4 mb-1">
				<label class="form-label">Status</label> <select class="form-select"
					aria-label="Default select example">
					<c:forEach items="${status }" var="statu">
						<option value="<c:out value="${statu.id}"></c:out>"><c:out
								value="${statu.status}"></c:out></option>
					</c:forEach>
				</select>
			</div>
		</div>

		<div class="row d-flex justify-content-around mt-5 ">
			<button type="submit" class="btn btn-primary w-25 mb-2">
				<c:if test="${action == 'add'}">
					<c:out value="Ajouter " />
				</c:if>
				<c:if test="${action == 'update'}">
					<c:out value="Modifier " />
				</c:if>
			</button>
			<button type="submit" class="btn btn-danger w-25 mb-2"
				<c:if test="${action == 'add'}">
						<c:out value="disabled " />
					</c:if>>Supprimer
			</button>
		</div>
	</form>
</div>