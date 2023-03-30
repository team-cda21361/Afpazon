<script src="./assets/js/account.js"></script>

<section class="container-account">
	<h1><i class="bi bi-person-vcard"></i> Mon compte</h1>
	
	<div>Compte <c:out value="${fn:toLowerCase(currentUser.role.role)}" />, identifiant <c:out value="${currentUser.id}" />, créé le <fmt:formatDate type="date" value="${currentUser.registrationDate}" /></div>
	<div id="accountNav">
		<a class="btn btn-primary" href="#accountInfo" role="button"><i class="bi bi-person-badge"></i> Infos</a>
		<a class="btn btn-primary" href="#accountPassword" role="button"><i class="bi bi-three-dots"></i> Mot de passe</a>
		<a class="btn btn-primary" href="#accountDelivery" role="button"><i class="bi bi-envelope"></i> Adresses</a>
		<a class="btn btn-primary" href="#accountBilling" role="button"><i class="bi bi-receipt"></i> Facturation</a>
	</div>
	
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