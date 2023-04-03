<!-- ****************************************** TITRE ************************************************************** -->
<div class="container w-75">
<h1 class="backTitle">Gestion produit </h1>

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

<div class="d-flex row">
	<div class="form-check form-switch d-flex justify-content-center mt-2">
		<label class="form-check-label me-5" >Present dans le carrousel :</label>
		<input class="form-check-input" type="checkbox">
		</div>
		<div class="form-check form-switch d-flex justify-content-center mt-2">
		<label class="form-check-label me-5 ml-5" >Produit actif :</label>
		<input class="form-check-input" type="checkbox">
	</div>
</div>


	
<!-- ****************************************** PREMIERE DIV ******************************************************* -->
	<div class="row">
		<div class="col-8 mt-5">

			<label class="form-label">Categories</label> 
			<select class="form-select mb-3" aria-label="Default select example">
				<option selected>Sélectionner une categorie</option>
				<c:forEach items="${categorys }" var="category">
					<option value="<c:out value="${category.category}"></c:out>"><c:out value="${category.category}"></c:out></option>
				</c:forEach>
			</select>

			<label class="form-label">Garantie (en années)</label> 
			<select class="form-select mb-3" aria-label="Default select example">
				<option selected>Sélectionner une gantantie</option>
				<c:forEach items="${products }" var="product">
					<option value="<c:out value="${product.garanty}"></c:out>"><c:out value="${product.garanty}"></c:out></option>
				</c:forEach>
			</select> 


			<label for="exampleFormControlSponsoring" class="form-label">Poids publicitaire (1-100) :</label>
  			<input type="number" min="1" max="100" class="form-control mb-3" id="exampleFormControlSponsoring" name="sponsoring">
			
			<label class="form-label">TVA :</label> 
			<select class="form-select mb-3" aria-label="Default select example">
				<option selected>%</option>
				<c:forEach items="${vats }" var="vat">
					<option value="<c:out value="${vat.value}"></c:out>"><c:out value="${vat.value}"></c:out></option>
				</c:forEach>
			</select>
			
			<label class="form-label">Promotion :</label> 
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
			

			

		</div>
		
		
<!-- ****************************************** DEUXIEME DIV ******************************************************* -->
		<div class="col-4 mt-5">
			 <div>
				<label for="exampleFormControlReference"class="form-label">Reference :</label> 
				<input type="text" class="form-control mb-3" id="exampleFormControlReference" name="reference">
				
				<label for="exampleFormControlName" class="form-label">Name :</label>
  				<input type="text" class="form-control mb-3" id="exampleFormControlName" name="name">
  				
				<label for="exampleFormControlDescription" class="form-label">Description :</label>
  				<textarea class="form-control mb-3" id="exampleFormControlDescription" rows="3" name="description"></textarea>
  				
				<label for="exampleFormControlPrice" class="form-label">Price (€) :</label>
  				<input type="number" step="0.01" min="0.01" class="form-control mb-3" id="exampleFormControlPrice" name="price">
  				
				<label for="exampleFormControlColor" class="form-label">Color :</label>
  				<input type="text" class="form-control mb-3" id="exampleFormControlColor" name="color">
  				
				<label for="exampleFormControlWeight" class="form-label">Weight (kg) :</label>
  				<input type="number" min="1" step="0.1" class="form-control mb-3" id="exampleFormControlWeight" name="weight">
  				
				<label for="exampleFormControlSize" class="form-label">Size :</label>
  				<input type="number" min="1" max="100" class="form-control mb-3" id="exampleFormControlSize" name="size">
				
				
				
				
				
				
				
				
			
			
			</div>
			
	
		</div>
		
		<div class="row d-flex justify-content-around py-3">
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
</div>



 