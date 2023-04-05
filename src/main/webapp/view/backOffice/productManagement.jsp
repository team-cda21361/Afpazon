<!-- ****************************************** TITRE ************************************************************** -->
<form method="post">
<h2 class="backTitle text-center">Gestion produit </h2>

	<%-- <h2 class="col-12 text-center my-5">
		<c:if test="${action == 'add'}">
			<c:out value="Ajout " />
		</c:if>
		<c:if test="${action == 'update'}">
			<c:out value="Modification " />
		</c:if>
		d'utilisateur
	</h2> --%>
	
<!-- ******************** VA ET VIENS ****************************	 -->

<div class="d-flex flex-row justify-content-center mt-5 pl-5">

	<div class="form-check form-switch mt-2">
		<label class="form-check-label me-5" >Present dans le carrousel</label>
		<input class="form-check-input" type="checkbox">
		</div>
		<div class="form-check form-switch mt-2">
		<label class="form-check-label me-5 ml-5" >Produit actif</label>
		<input class="form-check-input" type="checkbox">
	</div>
</div>


	<div class="row justify-content-center">
	
<!-- ****************************************** PREMIERE DIV ******************************************************* -->
		<div class="col-7 mt-5">
		
			<div class="d-flex flex-row justify-content-between">
			
			<div class="column text-center">
				<label class="form-label">Categories</label> 
				<select class="form-select mb-3" aria-label="Default select example">
					<option selected>Sélectionner une categorie</option>
					<c:forEach items="${categorys }" var="category">
						<option value="<c:out value="${category.category}"></c:out>"><c:out value="${category.category}"></c:out></option>
					</c:forEach>
				</select>
			</div>
	
			<div class="column text-center">
				<label class="form-label">Garantie (en années)</label> 
				<select class="form-select mb-3" aria-label="Default select example">
					<option selected>Sélectionner une gantantie</option>
					<c:forEach items="${products }" var="product">
						<option value="<c:out value="${product.garanty}"></c:out>"><c:out value="${product.garanty}"></c:out></option>
					</c:forEach>
				</select> 
			</div>
	
	
			<div class="column text-center">
				<label for="exampleFormControlSponsoring" class="form-label">Poids publicitaire (1-100) :</label>
	  			<input type="number" min="1" max="100" class="form-control mb-3" id="exampleFormControlSponsoring" name="sponsoring">
			</div>
				
			</div>
			
			
			<label class="form-label">Promotion :
					<a href=""><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
			</label> 
			<select class="form-select mb-3" aria-label="Default select example">
				<option selected>Sélectionner une promotion</option>
				<c:forEach items="${discounts }" var="discount">
					<option value="<c:out value="${discount.id}"></c:out>"><c:out value="${discount.id}"></c:out></option>
				</c:forEach>
			</select>
			
			<div class="tablePane mt-3 border mb-3" style="height:20vh">
		<table class="table table-bordered">
				<thead class="table-active">
					<tr>
						<th scope="col">Code</th>
						<th scope="col">%</th>
						<th scope="col">Date début</th>
						<th scope="col">Date fin</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${discountList }" var="discount">
						<tr>
							<th><c:out value="${discount.voucher }"></c:out></th>
							<td><c:out value="${discount.value }"></c:out></td>
							<td><c:out value="${discount.startDate }"></c:out></td>
							<td><c:out value="${discount.endDate }"></c:out></td>
						</tr>
				 	 </c:forEach>
				</tbody>
			</table>
		</div>

			<div class="d-flex flex-row justify-content-between">

					<div class="column ">
						<label class="form-label">Cliquer sur image pour ajouter/changer :</label> 
	  					<input type="image" class="form-control mb-3" src=""  name="image">
	  					<label class="form-label">
	  						<a href=""><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
	  						Ajouter des images compémentaires :
	  					</label>
						
					</div>

				<div class="column ">
					<label class="form-label">Cliquer sur video pour ajouter/changer :</label> 
	  				<input type="image" class="form-control mb-3" src=""  name="image">
				</div>

			</div>

		</div>
		
<!-- ****************************************** DEUXIEME DIV ******************************************************* -->
		<div class="col-4 mt-5 mr-3">
			<div class="d-flex flex-row justify-content-between">
				<div class="m-auto">
					<label for="exampleFormControlReference" class="form-label">Reference :</label>
				</div>
				<div>
					<input type="text" class="form-control mb-3 "id="exampleFormControlReference" name="reference">
				</div>
			</div>
			<div class="d-flex flex-row justify-content-between">
				<div class="m-auto">
					<label for="exampleFormControlName" class="form-label">Name :</label>
				</div>
				<div>
					<input type="text" class="form-control mb-3" id="exampleFormControlName" name="name">
				</div>
			</div>
			<div class="d-flex flex-row justify-content-between">
				<div class="m-auto">
					<label for="exampleFormControlDescription" class="form-label">Description :</label>
				</div>
				<div>
					<textarea class="form-control mb-3" id="exampleFormControlDescription" rows="3" name="description"></textarea>
				</div>
			</div>
			<div class="d-flex flex-row justify-content-between">
				<div class="m-auto">
					<label for="exampleFormControlColor" class="form-label">Size</label>
				</div>
				<div>
					<input type="text" class="form-control mb-3" id="exampleFormControlColor" name="color">
				</div>
			</div>
			<div class="d-flex flex-row justify-content-between">
				<div class="m-auto">
					<label for="exampleFormControlColor" class="form-label">Color :</label>
				</div>
				<div>
					<input type="text" class="form-control mb-3" id="exampleFormControlColor" name="color">
				</div>
			</div>
			<div class="d-flex flex-row justify-content-between">
				<div class="m-auto">
					<label for="exampleFormControlWeight" class="form-label">Weight (kg) :</label>
				</div>
				<div>
					<input type="number" min="1" step="0.1" class="form-control mb-3" id="exampleFormControlWeight" name="weight">
				</div>
			</div>
			<div class="d-flex flex-row justify-content-between">
				<div class="m-auto">
					<label class="form-label">Price :</label> 
				</div>
				<div>
					<input type="number" min="1" max="100" class="form-control mb-3 w-40" id="exampleFormControlSize" name="price">
				</div>
				<div class="m-auto">
					<label class="form-label">TVA :</label> 
				</div>
				<div>
					<select class="form-select mb-3" aria-label="Default select example">
						<option selected>%</option>
						<c:forEach items="${vats }" var="vat">
							<option value="<c:out value="${vat.value}"></c:out>"><c:out value="${vat.value}"></c:out></option>
						</c:forEach>
					</select>
				</div>
			</div>
		</div>
</div>
		
		<div class="d-flex flex-row justify-content-around py-3">
					<button type="button" class="btn btn-primary">Gestion des avis</button>
					<button type="submit" class="btn btn-primary">Ajouter</button>
					<button type="submit" class="btn btn-danger">Supprimer</button>
					<%-- <button type="submit" class="btn btn-primary w-25 mb-2">
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
					</button> --%>
				</div>
			
</form>
	
