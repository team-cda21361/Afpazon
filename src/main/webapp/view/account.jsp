<script type="text/javascript" src="./assets/js/account.js"></script>

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

<section class="container-account">
	<h1><i class="bi bi-person-vcard"></i> Mon compte</h1>
	
	<div>Compte <c:out value="${fn:toLowerCase(currentUser.role.role)}" /> créé le <fmt:formatDate type="date" value="${currentUser.registrationDate}" />.</div>
	<div>Numéro client : <c:out value="${currentUser.id}" /></div>
	<div id="accountNav" class="sticky-top">
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
	<form method="post">
		<input type="hidden" class="form-control" name="formSubmitted" value="accountInfo">
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
	<form method="post">
		<input type="hidden" class="form-control" name="formSubmitted" value="accountPassword">
		<div class="mb-3">
			<div class="row">
				<div class="col">
					<label for="oldPwd" class="form-label">Ancien</label>
					<input type="password" class="form-control" id="oldPwd" name="oldPwd">
				</div>
				<div class="col">
					<label for="newPwd" class="form-label">Nouveau</label>
					<input type="password" class="form-control" id="newPwd" name="newPwd">
				</div>
				<div class="col">
					<label for="confPwd" class="form-label">Confirmation</label>
					<input type="password" class="form-control" id="confPwd" name="confPwd">
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Sauvegarder les modifications</button>
	</form>
	
	<hr id="accountDelivery">
	<h3 class="text-secondary"><i class="bi bi-envelope"></i> Mes adresses</h3>
	<c:if test="${deliveryAddressesCounter > 0}">
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
					<c:if test="${address.address_type.type == 'livraison'}">
						<tr>
							<td><c:out value="${address.address}" /></td>
							<td><c:out value="${address.zipCode}" /></td>
							<td><c:out value="${address.city}" /></td>
							<td class="text-center"><a type="button" id="${address.id}" class="editBtn editAddress"><i class="bi bi-pencil-fill"></i></a></td>
							<td class="text-center"><a type="button" href="?deleteAddress=${address.id}" id="${address.id}" class="deleteBtn"><i class="bi bi-trash3-fill"></i></a></td>
						</tr>
					</c:if>
				</c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${deliveryAddressesCounter == 0}">
		<h3 class="text-center mb-3">Aucune adresse renseignée</h3>
	</c:if>
	<form method="post">
		<input type="hidden" class="form-control" name="formSubmitted" value="accountDelivery">
		<input type="hidden" class="form-control" id="deliveryAddressAction" name="deliveryAddressAction" value="create">
		<input type="hidden" class="form-control" id="deliveryAddressID" name="deliveryAddressID">
		<div class="mb-3">
			<div class="row">
				<div class="col-6">
					<label for="inputStreet" class="form-label">Voie</label>
					<input type="text" class="form-control" id="inputStreet" name="inputStreet">
				</div>
				<div class="col">
					<label for="inputZipCode" class="form-label">Code Postal</label>
					<input type="text" class="form-control col-5" id="inputZipCode" name="inputZipCode">
				</div>
				<div class="col">
					<label for="inputCity" class="form-label">Ville</label>
					<input type="text" class="form-control col-5" id="inputCity" name="inputCity">
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary" id="addressBtn">Ajouter</button>
	</form>
	
	<hr id="accountBilling">
	<h3 class="text-secondary"><i class="bi bi-receipt"></i> Mon adresse de facturation</h3>
	<form method="post">
		<input type="hidden" class="form-control" name="formSubmitted" value="accountBilling">
		<input type="hidden" class="form-control" id="billingAddressAction" name="billingAddressAction" value="create">
		<input type="hidden" class="form-control" id="billingAddressID" name="billingAddressID">
		<div class="mb-3">
			<div class="row">
				<div class="col-6">
					<label for="inputBillingStreet" class="form-label">Voie</label>
					<input type="text" class="form-control" id="inputBillingStreet" name="inputBillingStreet">
				</div>
				<div class="col">
					<label for="inputBillingZipCode" class="form-label">Code Postal</label>
					<input type="text" class="form-control col-5" id="inputBillingZipCode" name="inputBillingZipCode">
				</div>
				<div class="col">
					<label for="inputBillingCity" class="form-label">Ville</label>
					<input type="text" class="form-control col-5" id="inputBillingCity" name="inputBillingCity">
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary">Mettre à jour</button>
	</form>
	
	<hr>
	<div class="text-end">
		<h5 class="text-secondary"><i class="bi bi-person-fill-dash text-danger"></i> Désactiver mon compte</h5>
		<button type="submit" class="btn btn-sm btn-outline-danger" data-bs-toggle="modal" data-bs-target="#deactivateModal">Je désactive mon compte</button>
	</div>
</section>

<!-- Modal de désactivation de compte -->
<div class="modal fade" id="deactivateModal" tabindex="-1" aria-labelledby="deactivateModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content border-3 border-danger">
      <div class="modal-header">
        <h1 class="modal-title fs-5 text-danger" id="deactivateModalLabel">Désactivation de compte</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <div class="text-danger fw-bold">Êtes-vous sûr de vouloir désactiver votre compte ?</div>
        <div class="text-danger opacity-75">Si oui, veuillez confirmer votre décision en saisissant votre mot de passe :</div>
        <form id="deactivateForm" method="post">
        	<input type="hidden" class="form-control" name="formSubmitted" value="accountDeactivation">
			<input type="hidden" class="form-control" id="userIDtoDeactivate" name="userIDtoDeactivate">
	        <input type="password" class="form-control mt-3" id="pwdForDeactivation" name="pwdForDeactivation" placeholder="Saisissez votre mot de passe">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <button type="submit" form="deactivateForm" class="btn btn-outline-danger">Désactiver mon compte</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal des détails de commande -->
<div class="modal fade" id="orderDetailModal" tabindex="-1" aria-labelledby="orderDetailModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="orderDetailModalLabel"><i class="bi bi-box-seam"></i> Détails de la commande n°<c:out value="${orderSelected.id}" /></h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
		<div class="mb-3">
			<div class="row">
				<div class="col">
					<div class="row">
						<h5 class="text-center">Contenu de la commande</h5>
						<hr class="superCompactHR">
					</div>
					<c:if test="${not empty productsList}">
						<c:forEach items="${productsList}" var="product">
							<div class="row">
								<img class="productIMG" alt="..." src="./assets/products/img/${product.product.mainPicPath}">
								<div class="col">
									<div class="row">
										<h5><c:out value="${product.product.name}" /></h5>
									</div>
									<div class="row">
										<div>Prix unitaire : <c:out value="${product.price}" />&euro;  |  Quantité : <c:out value="${product.quantity}" /></div>
									</div>
									<div class="row">
										<div class="col">
											<div class="itemRef opacity-50">Référence : <c:out value="${product.product.reference}" /></div>
										</div>
										<div class="col text-end">
											<a class="btn btn-warning reviewButton" href="review?productID=${product.product.id}" role="button"><i class="bi bi-star-half"></i> Laisser un avis</a>
										</div>
									</div>
								</div>
							</div>
							<hr class="compactHR">
						</c:forEach>
					</c:if>
				</div>
					<div class="col col-4">
						<div class="row mb-3">
							<h5>Adresse de livraison</h5>
							<div id="orderAddress"></div>
							<div id="orderZipCodeAndCity"></div>
						</div>
						<div class="row mb-3">
							<h5>Adresse de facturation</h5>
							<div id="orderBillingAddress"></div>
							<div id="orderBillingZipCodeAndCity"></div>
						</div>
						<div class="row mb-3">
							<h5>Informations</h5>
							<div>Passée le : <fmt:formatDate type="date" value="${orderSelected.date}" /></div>
							<div>Total payé : <span id="orderTotalPrice"></span>&euro;</div>
							<div>Etat : <span id="orderState"></span></div>
							<c:if test="${not empty orderSelected.trackingNumber}">
								<div>Suivi : <span id="orderTrackingNumber"></span></div>
							</c:if>
						</div>
						<div class="row mb-3">
							<div class="dropdown mx-auto">
								<button class="btn btn-danger dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
									<i class="bi bi-file-earmark-pdf-fill"></i> Facture
								</button>
								<ul class="dropdown-menu">
									<li><a class="dropdown-item" href="printOrderBill?orderID=${orderSelected.id}&sendTo=download"><i class="bi bi-arrow-down-circle"></i> Télécharger</a></li>
									<li><a class="dropdown-item" href="printOrderBill?orderID=${orderSelected.id}&sendTo=email"><i class="bi bi-envelope-at"></i> Recevoir par email</a></li>

								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
      </div>
    </div>
  </div>
</div>

<c:if test="${not empty orderSelected}">
	<script type="text/javascript">
		$(window).on('load', function() {
			$('#orderAddress').html("${orderSelected.address_delivery.address},");
			$('#orderZipCodeAndCity').html("${orderSelected.address_delivery.zipCode} ${orderSelected.address_delivery.city}");
			$('#orderBillingAddress').html("${orderSelected.address_billing.address},");
			$('#orderBillingZipCodeAndCity').html("${orderSelected.address_billing.zipCode} ${orderSelected.address_billing.city}");
			$('#orderTotalPrice').html("${orderSelected.totalPrice}");
			$('#orderState').html("${orderSelected.status.status}");
			$('#orderTrackingNumber').html("${orderSelected.trackingNumber}");
			$('#orderDetailModal').modal('show');
		});
	</script>
</c:if>

<c:forEach items="${addressesList}" var="address">
	<c:if test="${address.address_type.type == 'facturation'}">
		<script type="text/javascript">
			$(window).on('load', function() {
				$('#billingAddressAction').attr("value", "update");
				$('#billingAddressID').attr("value", "${address.id}");
				$('#inputBillingStreet').val("${address.address}");
				$('#inputBillingZipCode').val("${address.zipCode}");
				$('#inputBillingCity').val("${address.city}");
			});
		</script>
	</c:if>
</c:forEach>

<script type="text/javascript">
	$(window).on('load', function() {
		$('#userTitle').val("${currentUser.gender}");
		$('#userLastName').val("${currentUser.lastName}");
		$('#userFirstName').val("${currentUser.firstName}");
		$('#userEmail').val("${currentUser.email}");
		$('#userPhone').val("${currentUser.phone}");
	});
</script>

<script type="text/javascript">
	$(".editAddress").on('click', function() {
		$('#deliveryAddressAction').attr("value", "update");
		$('#deliveryAddressID').attr("value", $(this).attr("id"));
		$('#inputStreet').val($(this).parent().siblings().eq(0).html());
		$('#inputZipCode').val($(this).parent().siblings().eq(1).html());
		$('#inputCity').val($(this).parent().siblings().eq(2).html());
		$('#addressBtn').text("Mettre à jour");
	});
</script>

<c:if test="${not empty backToPage}">
	<script type="text/javascript">
		$(window).on('load', function() {
			var goTo = $("${backToPage}");
			$('html,body').animate({scrollTop: goTo.offset().top},'slow');
		});
	</script>
</c:if>