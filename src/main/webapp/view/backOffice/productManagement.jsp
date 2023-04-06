<script src="assets/js/productManagement.js"></script>
<!-- ****************************************** TITRE ************************************************************** -->
<form method="post">
<h2 class="backTitle text-center mt-3">Gestion produit</h2>

	<%-- <h2 class="col-12 text-center my-5">
		<c:if test="${action == 'add'}">
			<c:out value="Ajout " />
		</c:if>
		<c:if test="${action == 'update'}">
			<c:out value="Modification " />
		</c:if>
		d'utilisateur
	</h2> --%>
	
	
<!-- ******************** SWITCH ****************************	 -->

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
					<option selected>Choisissez une catégorie</option>
					<c:forEach items="${categoryList }" var="category">
						<option><c:out value="${category.category}"></c:out></option>
					</c:forEach>
				</select>
			</div>
	
			<div class="column text-center">
				<label class="form-label">Garantie (en années)</label> 
				<select class="form-select mb-3" aria-label="Default select example">
					<option selected>Choisissez une garantie</option>
					<c:forEach items="${productList }" var="product">
						<option><c:out value="${product.warranty}"></c:out></option>
					</c:forEach>
				</select> 
			</div>
	
	
			<div class="column text-center">
				<label for="exampleFormControlSponsoring" class="form-label">Poids publicitaire (1-100) :</label>
	  			<input type="number" min="1" max="100" class="form-control mb-3" id="exampleFormControlSponsoring" name="sponsoring">
			</div>
				
			</div>
			
			
			<label class="form-label">Promotion :</label> 
			<select class="form-select mb-3" aria-label="Default select example">
				<option selected>Choisissez une promotion</option>
				<c:forEach items="${discountList }" var="discount">
					<option value="${discount.id}"><c:out value="${discount.voucher} --- ${discount.percent}% --- ${discount.startDate} --- ${discount.endDate}"></c:out></option>
				</c:forEach>
			</select>
	
				<button class="btn btn-success d-flex flex-row align-items-end" type="button" onclick="adddiscount()">
					<i   class="bi bi-plus-circle"></i>
				</button>
			
			
			
			<!-- <div class="tablePane mb-3 border" style="height:30vh"> -->
			<div>
		<table id="tableProduct" class="table table-bordered">
				<thead class="bg-secondary sticky-top">
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
							<th><c:out value=""></c:out></th>
							<td><c:out value=""></c:out></td>
							<td><c:out value=""></c:out></td>
							<td><c:out value=""></c:out></td>
						</tr>
				 	 </c:forEach>
				</tbody>
			</table>
		</div>

			<div class="d-flex flex-row justify-content-between mt-3">

					<div class="column ">
						<label class="form-label">Cliquer sur image pour ajouter/changer :</label> 
	  					<input type="image" class="form-control mb-3" src=""  name="image">
	  					<label class="form-label">
	  						<a href=""><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
	  						Ajouter des images complémentaires :
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
						<c:forEach items="${vatList }" var="vat">
							<option><c:out value="${vat.value}"></c:out></option>
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
	
