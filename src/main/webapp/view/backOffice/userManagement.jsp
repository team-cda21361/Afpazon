<div class="container w-75">
	<h3 class="col-12 text-center mt-2">
		<c:if test="${action == 'add'}">
			<c:out value="Ajout " />
		</c:if>
		<c:if test="${action == 'update'}">
			<c:out value="Modification " />
		</c:if>
		d'utilisateur
	</h3>
	<div class="form-check form-switch d-flex justify-content-center mt-2">
		<label class="form-check-label me-5" >Compte actif :</label>
		<input class="form-check-input" type="checkbox">
	</div>
	<div class="row">
		<div class="col-6 mt-5 align-items-end">
			<label class="form-label">Rôle</label> 
			<select class="form-select" aria-label="Default select example">
				<option selected>Sélectionner un rôle</option>
				<c:forEach items="${roles }" var="role">
					<option value="<c:out value="${role.id}"></c:out>"><c:out value="${role.role}"></c:out></option>
				</c:forEach>
			</select> 
			<label class="form-label">Civilités</label> 
			<select
				class="form-select" aria-label="Default select example">
				<option selected>Sélectionner une civilité</option>
				<c:forEach items="${genders }" var="gender">
					<option value="<c:out value="${gender}"></c:out>"><c:out value="${gender}"></c:out></option>
				</c:forEach>
			</select> 
			<label class="form-label">Adresses de livraison</label>
			<select class="form-select" aria-label="Default select example">
				<option selected>Sélectionner une adresse</option>
				<c:forEach items="${deliveryAdresses }" var="deliveryAdress">
					<option value="<c:out value="${deliveryAdress.id}"></c:out>">
						<c:out value="${deliveryAdress.address} ${deliveryAdress.zipCode} ${deliveryAdress.city}"></c:out>
					</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-6 mt-5">
			<form>
				<div class="mb-1">
					<label class="form-label">Nom :</label> 
					<input type="text" class="form-control" name="last_name">
				</div>
				<div class="mb-1">
					<label class="form-label">Prénom :</label> 
					<input type="text" class="form-control" name="first_name">
				</div>
				<div class="mb-1">
					<label class="form-label">Email : </label> 
					<input type="email" class="form-control" name="email">
				</div>
				<div class="mb-1">
					<label class="form-label">Téléphone</label> 
					<input type="text" class="form-control" name="phone_number"></div>
				<div class="mb-1">
					<label class="form-label">Adresse facturation</label> 
					<input type="text" class="form-control" name="billing_address">
				</div>
				<div class="row mb-1">
					<div class="w-25">
						<label class="form-label">Code postal</label> 
						<input type="text" class="form-control" name="billing_zip_code">
					</div>
					<div class="w-75">
						<label class="form-label">Ville</label> 
						<input type="text" class="form-control" name="billing_city">
					</div>
				</div>
				<div class="mb-1">
					<label class="form-label">Adresse livraison</label> 
					<input type="text" class="form-control" name="delivery_address">
				</div>
				<div class="row mb-1">
					<div class="w-25">
						<label class="form-label">Code postal</label> 
						<input type="text" class="form-control" name="delivery_zip_code">
					</div>
					<div class="w-75">
						<label class="form-label">Ville</label> 
						<input type="text" class="form-control" name="delivery_city">
					</div>
				</div>
				<div class="mb-1">
					<label class="form-label">Mot de passe</label> 
					<input type="password" class="form-control" name="password">
				</div>
				<div class="mb-3">
					<label class="form-label">Confirmation mot de passe</label> 
					<input type="password" class="form-control" name="PasswordR">
				</div>
				<div class="row d-flex justify-content-around">
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
	</div>
</div>