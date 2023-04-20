<script src="./assets/js/backoffice.js"></script>

	<div class="backContainer ">
	  <!--message d'erreur  -->
	   <c:if test="${not empty error }">
	   <div class="alert alert-danger" role="alert">
	 	<c:out value="${error }"></c:out>
	   </div>
	   </c:if>
		<h1 class="backTitle"><c:out value="${titleEdit }" default="Ajout"></c:out> de promotion</h1>
		<!-- body start -->
		<div class="row justify-content-around">
			<div class="col-5">
			<div>
				<form method="post" id="me">
				<label for="oldProduct">Catégories concerné :</label><br>
				  <select class="form-select" aria-label="Default select example" name="selectCat" style="width: 20em">
					  <option selected>Choisir une catégorie</option>
					  <c:forEach items="${categoryList }" var="category">
					  <option value="${category.id }"><c:out value="${category.category }"></c:out></option>
					  </c:forEach>
				  </select>
				  <div>
					<br>
					<button class="hiddenBtn" type="submit" style="border:none;"><img alt="" src="assets/images/back_office/plus.png" width="20"></button>
					<label> > Ajout des produits de toute la catégorie </label>
				</div>
				</form>
				<!--  add old products to be developped later -->
				<form >
				<label for="oldProduct" >Nombre des plus vieilles références concernées:</label><br>
				<input type="number" name="oldProducts" readonly>
				  <div>
					<br>
					<button class="hiddenBtn" type="submit" style="border:none;"><img alt="" src="assets/images/back_office/plus.png" width="20"></button>
					<label> > Ajout des produits les plus anciens </label>
				</div>
				</form>
			</div>
				<div>
				  <table class="table table-bordered tableManager">
					<thead class="table-active">
						<tr>
							<th scope="col">Nom</th>
							<th scope="col">Reference</th>
							<th scope="col">Supprimmer</th>
						</tr>
					</thead>
					<tbody>
					 <c:forEach items="${productList }" var="product">
						<tr>
							<th scope="row"><c:out value="${product.name }"></c:out></th>
							<td><c:out value="${product.reference }"></c:out></td>
							<td class="text-center"><a href="discount?deleteId=${product.id }"><img alt="Icon check" src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
						</tr>
					  </c:forEach>
					</tbody>
				  </table>
				  <form action="discount" method="post">
				 <button class="btn btn-primary float-end" name="empty">Vider</button>
				  </form>
				</div>
				<!-- Button trigger modal -->
				<div>
					<br>
					<a  data-bs-toggle="modal" data-bs-target="#exampleModal"><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
					<label> > Ajout un produit via la référence </label>
				</div>
				<!-- add product on discount modal -->
			
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalLabel">Ajout de produit en promotion</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					      	<form method="post" id="addProductForm">
						        <div class="container justify-content-center">
						        	<label for="reference">
						        		<input type="text" name="addProductRef">
						        	</label>
						        </div>
						     </form>
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
					        <button form ="addProductForm" type="submit" class="btn btn-primary">Ajouter le produit</button>
					      </div>
					    </div>
					  </div>
					</div>
					<!-- end Modal -->
				</div>
			<c:if test="${not empty productList || not empty discountEdit}">	
				<div class="col-5">
					<form method="post">
					  <div class="mb-3">
					    <label for="exampleInputEmail1" class="form-label">Date de début</label>
					    <input type="date" class="form-control" id="dateDebutId" aria-describedby="emailHelp" name="startDate" 
					    value="<c:if test="${not empty discountEdit }">${discountEdit.startDate }</c:if>" required>
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputPassword1" class="form-label">Date de fin</label>
					    <input type="date" class="form-control" id="dateEndId"  name="endDate" 
					    value="<c:if test="${not empty discountEdit }">${discountEdit.endDate }</c:if>" required>
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputPassword1" class="form-label">Code</label>
					    <input type="text" class="form-control" id="codeId"  name="voucher" 
					    value="<c:if test="${not empty discountEdit }">${discountEdit.voucher }</c:if>" required>
					  </div>
					  <div class="mb-3">
					    <label for="exampleInputPassword1" class="form-label">Pourcentage</label>
					    <input type="text" class="form-control" id="percentId"  name="percent" value="<c:if test="${not empty discountEdit }">${discountEdit.percent }</c:if>" required>
					  </div>
					  <div class="mb-3">
					    <label for="discountId" class="form-label">Pourcentage</label>
					    <input type="hidden" class="form-control" id="discountId"  name="discountId" value="<c:if test="${not empty discountEdit }">${discountEdit.id }</c:if>">
					  </div>
						<c:if test="${not empty discountEdit }">
					  	 <button id="formBtn" type="submit" class="btn btn-primary" name="updateDiscount">Mettre à jour</button>
					    </c:if>
					    <c:if test="${empty discountEdit && not empty productList}">
					 	 <button id="formBtn" type="submit" class="btn btn-primary" name="createDiscount">Créer</button>
					    </c:if>
					</form>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>