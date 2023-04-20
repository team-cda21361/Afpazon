
<script defer src="assets/js/orderManagement.js"></script>
<div class="container w-75">
	<h1 class="col-12 text-center mt-5">
		<c:if test="${order.status.status == 'Commande livrée'}">
			<c:out value="Affichage " />
		</c:if>
		<c:if test="${order.status.status != 'Commande livrée'}">
			<c:out value="Modification " />
		</c:if>
		de commande
	</h1>
	<c:if test="${not empty error }">
		<div class="alert alert-danger" role="alert">
	 		<c:out value="${error }"></c:out>
		</div>
	</c:if>
	<c:if test="${not empty success }">
		<div class="alert alert-success" role="alert">
	 		<c:out value="${success }"></c:out>
		</div>
	</c:if>
	<form id="orderForm" class="w-100 " action="order-management?orderId=${order.id }" method="post">
		<div class="d-flex justify-content-around mt-5">
			<div class="col-4 mb-1">
				<label class="form-label">Id commande :</label> <input type="text"
					class="form-control" name="id_order" value="${order.id }" readonly>
			</div>
			<div class="col-4 mb-1">
				<label class="form-label">Date de la commande :</label>
				<input type="text" class="form-control" name="order_date" value="${order.date }" readonly>
			</div>
		</div>
		<div class="row justify-content-center mt-5">
			<div class="w-75">
				<h4>Liste des produits :</h4>
				<table id="orderDetails" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Nom</th>
							<th>Référence</th>
							<th>Prix</th>
							<th>TVA</th>
							<th>Quantité</th>
							<c:if test="${order.status.status != 'Commande livrée'}">
							<th>Supprimer</th>
							</c:if>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${orderProd}" var="product">
							<tr>
								<td>${product.product.name }</td>
								<td>${product.product.reference }</td>
								<td>${product.price }</td>
								<td>${product.product.vat.value }</td>
								<td>${product.quantity }</td>
								<c:if test="${order.status.status != 'Commande livrée'}">
									<td>
										<a class="toModal" href="order-management?deleteOption=1&orderProdId=${product.id }&orderId=${order.id}" data-bs-toggle="modal" data-bs-target="#exampleModal">
										<img alt="Icon check" src="assets/images/back_office/deleteIcon.png" width="20">
										</a>
									</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col-4 mb-1">
				<label class="form-label">Transporteur :</label> <input type="text"
					class="form-control" name="id_order" value="DHL" readonly>
			</div>
			<div class="col-4 mb-1">
				<label class="form-label">Numéro de suivi :</label> <input
					type="text" class="form-control" name="first_name" value="${order.trackingNumber}" readonly>
			</div>
			<div class="col-4 mb-1">
				<label class="form-label">Status</label> 
					<input type="text" class="form-control" value="<c:out value="${order.status.status }"></c:out>" readonly>
				
			</div>
		</div>

		<div class="row d-flex justify-content-center mt-5 ms-5">
			<c:if test="${order.status.status != 'Commande livrée'}">
				<!-- Button trigger modal -->
				<div class="col-5">
					<a id="toModal" href="order-management?deleteAllOption=1&orderId=${order.id }" data-bs-toggle="modal" data-bs-target="#exampleModal">
						<button type="button" class="btn btn-danger w-50 mb-2">Supprimer</button>
					</a>
				</div>			</c:if>
		</div>
	</form>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Effacement</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
      Êtes-vous sûr(e) de vouloir continuer?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <a id="modal" href=""><button type="button" class="btn btn-primary">Je suis sûr(e)</button></a>
      </div>
    </div>
  </div>
</div>
</div>