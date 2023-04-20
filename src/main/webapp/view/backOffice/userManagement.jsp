<script src="assets/js/userManagement.js"></script>
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
	<form method="post">
		<c:if test="${not empty error}">
			<div class="alert alert-danger">
				<c:out value="${error }" />
			</div>
		</c:if>
		<c:if test="${not empty error1}">
			<div class="alert alert-danger">
				<c:out value="${error1 }" />
			</div>
		</c:if>
		<c:if test="${not empty error2}">
			<div class="alert alert-danger">
				<c:out value="${error2 }" />
			</div>
		</c:if>
		<c:if test="${not empty errorBillingAddress}">
			<div class="alert alert-danger">
				<c:out value="${errorBillingAddress }" />
			</div>
		</c:if>
		<c:if test="${not empty errorDeliveryAddress}">
			<div class="alert alert-danger">
				<c:out value="${errorDeliveryAddress }" />
			</div>
		</c:if>
		<div class="row">
			<div class="col-6 mt-5 align-items-end">
				<label class="form-label">Rôle</label> <select id="select-role"
					class="form-select" aria-label="Default select example" name="role">
					<option selected value=<c:out value="${user.role.id }"/>>
					<c:out value="${user.role.role }"
							default="Sélectionner un rôle" /></option>
					<c:forEach items="${roles }" var="role">
						<option value="<c:out value="${role.id}"></c:out>"><c:out
								value="${role.role}"></c:out></option>
					</c:forEach>
				</select> <label class="form-label">Civilités</label> <select
					id="select-gender" class="form-select"
					aria-label="Default select example" name="gender">
					<option selected value=<c:out value="${user.gender }"/>>
					<c:out value="${user.gender }"
							default="Sélectionner une civilité" /></option>
					<c:forEach items="${genders }" var="gender">
						<option value="<c:out value="${gender}"></c:out>"><c:out
								value="${gender}"></c:out></option>
					</c:forEach>
				</select> <label class="form-label">Adresses de livraison</label> <select
					id="select-delivery-address" class="form-select"
					aria-label="Default select example" name="select-delivery-address">
					<c:forEach items="${delivery_addresses }" var="delivery_address"
						varStatus="loop">
						<c:if test="${loop.index !=0 }">
							<option value="<c:out value="${delivery_address.id}"></c:out>">
								<c:out
									value="${delivery_address.address} ${delivery_address.zipCode} ${delivery_address.city}"></c:out>
							</option>
						</c:if>
					</c:forEach>
				</select>
			</div>
			<div class="col-6 mt-5">
				<div class="mb-1">
					<input type="hidden" class="form-control" name="user_id"
						value="<c:out value="${user.id }" default=""/>">
				</div>
				<div class="mb-1">
					<label class="form-label">Nom :</label> <input type="text"
						class="form-control" name="last_name" required
						value="<c:out value="${user.lastName }" default=""/>">
				</div>
				<div class="mb-1">
					<label class="form-label">Prénom :</label> <input type="text"
						class="form-control" name="first_name" required
						value="<c:out value="${user.firstName }" default=""/>">
				</div>
				<div class="mb-1">
					<label class="form-label">Email : </label> <input type="email"
						class="form-control" name="email" required
						value="<c:out value="${user.email }" default=""/>">
				</div>
				<div class="mb-1">
					<label class="form-label">Téléphone</label> <input type="text"
						class="form-control" name="phone_number"
						value="<c:out value="${user.phone }" default=""/>">
				</div>
				<div class="mb-1">
					<input type="hidden" class="form-control" name="billing_adress_id"
						value="<c:out value="${billing_address.id }" default=""/>">
				</div>
				<div class="mb-1">
					<label class="form-label">Adresse facturation</label> <input
						type="text" class="form-control" name="billing_address"
						value="<c:out value="${billing_address.address }" default=""/>">
				</div>
				<div class="row mb-1">
					<div class="w-25">
						<label class="form-label">Code postal</label> <input type="text"
							class="form-control" name="billing_zip_code"
							value="<c:out value="${billing_address.zipCode }" default=""/>">
					</div>
					<div class="w-75">
						<label class="form-label">Ville</label> <input type="text"
							class="form-control" name="billing_city"
							value="<c:out value="${billing_address.city }" default=""/>">
					</div>
				</div>
				<div class="mb-1">
					<input type="hidden" class="form-control" name="delivery_adress_id"
						value="<c:out value="${delivery_addresses[0].id }" default=""/>">
				</div>
				<div class="mb-1">
					<label class="form-label">Adresse livraison</label> <input
						type="text" class="form-control" name="delivery_address"
						value="<c:out value="${delivery_addresses[0].address  }" default=""/>">
				</div>
				<div class="row mb-1">
					<div class="w-25">
						<label class="form-label">Code postal</label> <input type="text"
							class="form-control" name="delivery_zip_code"
							value="<c:out value="${delivery_addresses[0].zipCode }" default=""/>">
					</div>
					<div class="w-75">
						<label class="form-label">Ville</label> <input type="text"
							class="form-control" name="delivery_city"
							value="<c:out value="${delivery_addresses[0].city }" default=""/>">
					</div>
				</div>
				<div class="mb-1">
					<label class="form-label">Mot de passe</label> <input
						type="password" class="form-control" name="password" required>
				</div>
				<div class="mb-3">
					<label class="form-label">Confirmation mot de passe</label> <input
						type="password" class="form-control" name="PasswordR" required>
				</div>
				<div class="row d-flex justify-content-around">
					<button id="btn-add-update" type="submit"
						class="btn btn-primary w-25 mb-2">
						<c:if test="${action == 'add'}">
							<c:out value="Ajouter " />
						</c:if>
						<c:if test="${action == 'update'}">
							<c:out value="Modifier " />
						</c:if>
					</button>
				</div>
			</div>
		</div>
	</form>
</div>
