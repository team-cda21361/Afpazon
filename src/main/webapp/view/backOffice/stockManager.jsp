<h1 class="backTitle">Gestion stock</h1>
<div class="backContainer d-flex justify-content-around">
	<div class="tablePane" style="height:50vh">
		<table class="table table-bordered">
				<thead class="table-active">
					<tr>
						<th scope="col">Nom</th>
						<th scope="col">r�f�rence</th>
						<th scope="col">Quantit�</th>
						<th scope="col">Editer</th>
						<th scope="col">Supprimmer</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${stockList }" var="stock">
						<tr>
							<th scope="row"><c:out value="${stock.product.name }"></c:out></th>
							<td><c:out value="${stock.product.reference }"></c:out></td>
							<td><c:out value="${stock.quantity }"></c:out></td>
							<td><a href="stockManager?id=${stock.id }"><img alt="Icon check" src="assets/images/back_office/editIcon.png" width="20"></a></td>
							<td><a href="stockManager?id=${stock.id }"><img alt="Icon check" src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
						</tr>
				 	 </c:forEach>
				</tbody>
			</table>
		</div>
	<div>
		<form>
		  <div class="mb-3">
		    <label for="" >Fournisseur</label>
		    <input type="text" class="form-control" id="exampleInputEmail1" name="provider" value="${stockEdit.product.name }">
		  </div>
		  <div class="mb-3">
		    <label for="reference" class="form-label">R�f�rence</label>
		    <input type="text" class="form-control" id="idRef" name="reference" value="${stockEdit.product.reference }">
		  </div>
		  <div class="mb-3">
		    <label for="reference" class="form-label">Quantit�</label>
		    <input type="number" class="form-control" id="idRef" name="quantity">
		  </div>
		  <button type="submit" class="btn btn-outline-primary">Commander <img alt="" src="assets/images/back_office/send.png" width="35"></button>
		</form>
	</div>
</div>
</body>
</html>