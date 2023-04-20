<script defer src="./assets/js/backoffice.js"></script>
<h1 class="backTitle">Gestion stock</h1>
<div class="backContainer ">
<c:if test="${not empty error }">
<div class="alert alert-danger" role="alert">
  <c:out value="${error }"></c:out>
</div>
</c:if>
<c:if test="${not empty success }">
<div class="alert alert-danger" role="alert">
  <c:out value="${success }"></c:out>
</div>
</c:if>
	<div class="row justify-content-center">
		<div class="col-8" >
			<table class="table table-bordered tableManager">
				<thead class="table-active">
					<tr>
						<th scope="col">Nom</th>
						<th scope="col">référence</th>
						<th scope="col">Quantité</th>
						<th scope="col">Commander</th>
						<th scope="col">Supprimmer</th>
					</tr>
				</thead>
				<tbody>
					 <c:forEach items="${stockList }" var="stock">
						<tr>
							<th scope="row"><c:out value="${stock.product.name }"></c:out></th>
							<td><c:out value="${stock.product.reference }"></c:out></td>
							<td><c:out value="${stock.quantity }"></c:out></td>
							<td><a href="stock-management?idEdit=${stock.id }"><img alt="Icon check" src="assets/images/back_office/editIcon.png" width="20"></a></td>
							<td><a class="toModal" href="stock-management?idDelete=${stock.id }" data-bs-toggle="modal" data-bs-target="#exampleModal"><img alt="Icon check" src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
						</tr>
				 	 </c:forEach>
				</tbody>
			</table>
			 <div>
				<a href=""><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
			 </div>
		</div>
<!-- **************************************** FORMULAIRE ************************************************************ -->
		<div class="col-3">
			<form method="post" action="stock-management">
			  <div class="mb-3">
			    <label for="" >Nom</label>
			    <input type="text" class="form-control" id="exampleInputEmail1" name="name" value="${stockEdit.product.name }">
			  </div>
			  <div class="mb-3">
			    <label for="reference" class="form-label">Référence</label>
			    <input type="text" class="form-control" id="idRef" name="reference" value="${stockEdit.product.reference }"required>
			  </div>
			  <div class="mb-3">
			    <label for="reference" class="form-label">Quantité</label>
			    <input type="number" class="form-control" id="idRef" name="quantity" required>
			  </div>
			  <button type="submit" class="btn btn-outline-primary" name="sendForStock">Commander <img alt="" src="assets/images/back_office/send.png" width="35"></button>
			</form>
		</div>
</div>
</div>
<!-- **************************************** MODAL ************************************************************ -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Suppression</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        Voulez-vous vraiment supprimer la ligne du stock ?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
        <a href="" id="modal">
        <button type="button" class="btn btn-primary">Supprimer</button>
        </a>
      </div>
    </div>
  </div>
</div>
</body>
</html>