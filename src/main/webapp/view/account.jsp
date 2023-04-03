<script type="text/javascript" src="./assets/plugins/jQuery/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./assets/plugins/DataTables/datatables.min.js"></script>
<script type="text/javascript" src="./assets/js/account.js"></script>

<section class="container-account">
	<h1><i class="bi bi-person-vcard"></i> Mon compte</h1>
	
	<div>Compte <c:out value="${fn:toLowerCase(currentUser.role.role)}" />, identifiant <c:out value="${currentUser.id}" />, créé le <fmt:formatDate type="date" value="${currentUser.registrationDate}" /></div>
	<div id="accountNav">
		<a class="btn btn-primary" href="#accountOrders" role="button"><i class="bi bi-box-seam"></i> Commandes</a>
		<a class="btn btn-primary" href="#accountInfo" role="button"><i class="bi bi-person-badge"></i> Infos</a>
		<a class="btn btn-primary" href="#accountPassword" role="button"><i class="bi bi-three-dots"></i> Mot de passe</a>
		<a class="btn btn-primary" href="#accountDelivery" role="button"><i class="bi bi-envelope"></i> Adresses</a>
		<a class="btn btn-primary" href="#accountBilling" role="button"><i class="bi bi-receipt"></i> Facturation</a>
	</div>
	
	<hr id="accountOrders">
	<h3 class="text-secondary"><i class="bi bi-box-seam"></i> Mes commandes</h3>
	<c:if test="${not empty ordersList}">
		<table class="table table-striped" id="ordersTable">
			<thead>
				<tr>
					<th scope="col" class="w-20">#</th>
					<th scope="col" class="w-25">Date</th>
					<th scope="col" class="w-25">Total</th>
					<th scope="col" class="w-25">État</th>
					<th scope="col" class="w-5 text-center">Info</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${ordersList}" var="order">
					<tr>
						<td class="align-middle"><c:out value="${order.id}" /></td>
						<td class="align-middle"><fmt:formatDate type="date" value="${order.date}" /></td>
						<td class="align-middle"><c:out value="${order.totalPrice}" />&euro;</td>
						<td class="align-middle"><c:out value="${order.status.status}" /></td>
						<td class="text-center align-middle"><a type="button" href="?showOrderID=${order.id}" class="fs-5"><i class="bi bi-card-list"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${empty ordersList}">
		<h3 class="text-center mb-3">Aucune commande pour le moment</h3>
		<a class="btn btn-lg btn-success" href="/Afpazon" role="button" id="toShop">Préparer ma première commande</a>
	</c:if>
	
	<hr id="accountInfo">
	<h3 class="text-secondary"><i class="bi bi-person-badge"></i> Mes informations personnelles</h3>
	<form>
		<div class="mb-3">
			<div class="row">
				<div class="col">
					<label for="userTitle" class="form-label col-3">Civilité</label>
					<select class="form-select" id="userTitle" name="userTitle">
						<option selected>Choisir</option>
						<option value="M.">M.</option>
						<option value="Mme.">Mme.</option>
						<option value="Autre">Autre</option>
					</select>
				</div>
				<div class="col">
					<label for="userLastName" class="form-label">Nom</label>
					<input type="text" class="form-control" id="userLastName" name="userLastName">
				</div>
				<div class="col">
					<label for="userFirstName" class="form-label">Prénom</label>
					<input type="text" class="form-control" id="userFirstName" name="userFirstName">
				</div>
			</div>
			<div class="spacer"></div>
			<div class="row">
				<div class="col">
					<label for="userEmail" class="form-label">Email</label>
					<input type="email" class="form-control" id="userEmail" name="userEmail">
				</div>
				<div class="col">
					<label for="userPhone" class="form-label">Téléphone</label>
					<input type="tel" class="form-control" id="userPhone" name="userPhone">
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Sauvegarder les modifications</button>
	</form>
	
	<hr id="accountPassword">
	<h3 class="text-secondary"><i class="bi bi-three-dots"></i> Mon mot de passe</h3>
	<form>
		<div class="mb-3">
			<div class="row">
				<div class="col">
					<label for="oldPwd" class="form-label">Ancien</label>
					<input type="password" class="form-control" id="oldPwd" name="oldPwd">
				</div>
				<div class="col">
					<label for="newPwd" class="form-label">Nouveau</label>
					<input type="password" class="form-control col-5" id="newPwd" name="newPwd">
				</div>
				<div class="col">
					<label for="confPwd" class="form-label">Confirmation</label>
					<input type="password" class="form-control col-5" id="confPwd" name="confPwd">
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Sauvegarder les modifications</button>
	</form>
	
	<hr id="accountDelivery">
	<h3 class="text-secondary"><i class="bi bi-envelope"></i> Mes adresses</h3>
	<c:if test="${not empty addressesList}">
		<table class="table table-striped">
			<thead>
				<tr>
					<th scope="col" class="w-50">Voie</th>
					<th scope="col" class="w-10">Code Postal</th>
					<th scope="col" class="w-30">Ville</th>
					<th scope="col" class="w-5 text-center">Edit</th>
					<th scope="col" class="w-5 text-center">Supp</th>
				</tr>
			</thead>
			<tbody class="table-group-divider">
				<c:forEach items="${addressesList}" var="address">
					<tr>
						<td><c:out value="${address.address}" /></td>
						<td><c:out value="${address.zipCode}" /></td>
						<td><c:out value="${address.city}" /></td>
						<td class="text-center"><a type="button" id="${address.id}" class="editBtn"><i class="bi bi-pencil-fill"></i></a></td>
						<td class="text-center"><a type="button" id="${address.id}" class="deleteBtn"><i class="bi bi-trash3-fill"></i></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${empty addressesList}">
		<h3 class="text-center mb-3">Aucune adresse renseignée</h3>
	</c:if>
	<form>
		<div class="mb-3">
			<div class="row">
				<div class="col-6">
					<label for="inputStreet" class="form-label">Voie</label>
					<input type="password" class="form-control" id="inputStreet" name="inputStreet">
				</div>
				<div class="col">
					<label for="inputZipCode" class="form-label">Code Postal</label>
					<input type="password" class="form-control col-5" id="inputZipCode" name="inputZipCode">
				</div>
				<div class="col">
					<label for="inputCity" class="form-label">Ville</label>
					<input type="password" class="form-control col-5" id="inputCity" name="inputCity">
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Ajouter</button>
	</form>
	
	<hr id="accountBilling">
	<h3 class="text-secondary"><i class="bi bi-receipt"></i> Mon adresse de facturation</h3>
	<form>
		<div class="mb-3">
			<div class="row">
				<div class="col-6">
					<label for="inputStreet" class="form-label">Voie</label>
					<input type="password" class="form-control" id="inputStreet" name="inputStreet">
				</div>
				<div class="col">
					<label for="inputZipCode" class="form-label">Code Postal</label>
					<input type="password" class="form-control col-5" id="inputZipCode" name="inputZipCode">
				</div>
				<div class="col">
					<label for="inputCity" class="form-label">Ville</label>
					<input type="password" class="form-control col-5" id="inputCity" name="inputCity">
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Mettre à jour</button>
	</form>
	
	<hr>
	<div class="text-end">
		<h5 class="text-secondary"><i class="bi bi-person-fill-dash text-danger"></i> Désactiver mon compte</h5>
		<button type="submit" class="btn btn-sm btn-outline-danger">Je désactive mon compte</button>
	</div>
</section>

<!-- Modal des détails de commande -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="orderDetailModalLabel"><i class="bi bi-box-seam"></i> Détails de la commande n°<c:out value="${showOrderID}" /></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div class="mb-3">
			<div class="row">
				<div class="col">
					<h5>Adresse de livraison</h5>
					<p id="orderAddress"></p>
					<p id="orderZipCodeAndCity"></p>
				</div>
				<div class="col">
					<h5>Adresse de facturation</h5>
					<p id="orderBillingAddress"></p>
					<p id="orderBillingZipCodeAndCity"></p>
				</div>
				<div class="col">
					<h5>Informations de commande</h5>
					<p>Total payé : <span id="orderTotalPrice"></span>&euro;</p>
					<p>Etat : <span id="orderState"></span></p>
					<c:if test="${not empty orderSelected.trackingNumber}">
						<p>Suivi : <span id="orderTrackingNumber"></span></p>
					</c:if>
				</div>
			</div>
		</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<c:if test="${not empty showOrderID}">
	<script type="text/javascript">
		$(window).on('load', function() {
			$('#orderAddress').html("${orderSelected.address_delivery.address},");
			$('#orderZipCodeAndCity').html("${orderSelected.address_delivery.zipCode} ${orderSelected.address_delivery.city}");
			$('#orderBillingAddress').html("${orderSelected.address_delivery.address},");
			$('#orderBillingZipCodeAndCity').html("${orderSelected.address_delivery.zipCode} ${orderSelected.address_delivery.city}");
			$('#orderTotalPrice').html("${orderSelected.totalPrice}");
			$('#orderState').html("${orderSelected.status.status}");
			$('#orderTrackingNumber').html("${orderSelected.trackingNumber}");
			$('#orderDetailModal').modal('show');
		});
	</script>
</c:if>

<script type="text/javascript">
	$(window).on('load', function() {
			$('#userTitle').val("${currentUser.gender}");
			$('#userLastName').val("${currentUser.lastName}");
			$('#userFirstName').val("${currentUser.firstName}");
			$('#userEmail').val("${currentUser.email}");
			$('#userPhone').val("${currentUser.phone}");
	});
</script>