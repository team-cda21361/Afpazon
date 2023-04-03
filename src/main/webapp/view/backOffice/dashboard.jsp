<script src="./assets/js/backoffice.js"></script>

	<div class="backContainer">
		<!-- start user -->
		<div class="row ">
			<div class="col-8">
				<div class="d-flex justify-content-between">
					<h4>Utilisateurs</h4>
				</div>
					<table class="table table-bordered tableManager">
						<thead class="table-active">
							<tr>
								<th scope="col">Nom</th>
								<th scope="col">Prenom</th>
								<th scope="col">Email</th>
								<th scope="col">Rôle</th>
								<th scope="col">Actif</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
						  <c:forEach items="${userList }" var="user">
							<tr>
								<th scope="row"><c:out value="${user.lastName }"></c:out></th>
								<td><c:out value="${user.firstName }"></c:out></td>
								<td><c:out value="${user.email }"></c:out></td>
								<td><c:out value="${user.role.role }"></c:out></td>
								<td class="text-center">

								<c:if test="${user.isActive() == true}"><img alt="Icon check" src="assets/images/back_office/checkIcon.png" width="25"></c:if>
								<c:if test="${user.isActive() == false}"><img alt="Icon check" src="assets/images/back_office/falseIcon.png" width="20"></c:if>
								</td>
								<td class="text-center"><a href="dashboard?id=${user.id }"><img alt="Icon check" src="assets/images/back_office/editIcon.png" width="20"></a></td>
								<td class="text-center"><a href="dashboard?id=${user.id }"><img alt="Icon check" src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
					<div>
					<a href=""><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
					</div>
			</div>
			<div class="col-4">
				<c:if test="${not empty criticalStock }">
					<div class="alert alert-danger" role="alert">
						<p><c:out value="${criticalStock }"></c:out> <a href="stockManager"><img alt="Icon check" src="assets/images/back_office/editIcon.png" width="20"></a></p>
					</div>
				</c:if>
			</div>
		</div>
		<!-- end user -->
		
		<!-- start product -->
		<div class="row ">
			<div class = col-6>
				<div class="d-flex justify-content-between">
					<h4>Produits</h4>
				</div>
					<table class="table table-bordered tableManager">
						<thead class="table-active">
							<tr>
								<th scope="col">Nom</th>
								<th scope="col">référence</th>
								<th scope="col">Prix</th>
								<th scope="col">Quantité</th>
								<th scope="col">Actif</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
 						 <c:forEach items="${stockList }" var="stock">
							<tr>
								<th scope="row"><c:out value="${stock.product.name }"></c:out></th>
								<td><c:out value="${stock.product.reference }"></c:out></td>
								<td><c:out value="${stock.product.price }"></c:out></td>
								<td><c:out value="${stock.quantity }"></c:out></td>
								<td class="text-center">
								<c:if test="${stock.product.isActive() == true}"><img alt="Icon check" src="assets/images/back_office/checkIcon.png" width="25"></c:if>
								<c:if test="${stock.product.isActive() == false}"><img alt="Icon check" src="assets/images/back_office/falseIcon.png" width="20"></c:if>
								</td>
								<td class="text-center"><a href="dashboard?id=${stock.id }"><img alt="Icon check" src="assets/images/back_office/editIcon.png" width="20"></a></td>
								<td class="text-center"><a href="dashboard?id=${stock.id }"><img alt="Icon check" src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
					<div>
						<a href="stockManager"><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
					</div>
				</div>
				<!-- end product -->
			<!-- Start discount -->
			<div class="col-5">
				<div class="d-flex justify-content-between">
					<h4>Promotion</h4>
				</div>
					<table class="table table-bordered tableManager">
						<thead class="table-active">
							<tr>
								<th scope="col">Code voucher</th>
								<th scope="col">Pourcentage</th>
								<th scope="col">Date de début</th>
								<th scope="col">Date de fin</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
						 <c:forEach items="${discountList }" var="discount">
							<tr>
								<th scope="row"><c:out value="${discount.voucher }"></c:out></th>
								<td><c:out value="${discount.percent }"></c:out></td>
								<td><c:out value="${discount.startDate }"></c:out></td>
								<td><c:out value="${discount.endDate }"></c:out></td>
								<td class="text-center"><a href="dashboard?id=${discount.id }"><img alt="Icon check" src="assets/images/back_office/editIcon.png" width="20"></a></td>
								<td class="text-center"><a href="dashboard?id=${discount.id }"><img alt="Icon check" src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
					<div>
						<a href=""><img alt="discountManagement" src="assets/images/back_office/plus.png" width="20"></a>
					</div>
			</div>
		</div>
	<!-- end discount -->
	<!-- Start commande -->
		<div class="row ">
			<div class="col-10">
				<div class="d-flex justify-content-between">
					<h4>Commande</h4>
				</div>
					<table class="table table-bordered tableManager">
						<thead class="table-active">
							<tr>
								<th scope="col">id commmande</th>
								<th scope="col">Email du client</th>
								<th scope="col">date</th>
								<th scope="col">status de livraison</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
						  <c:forEach items="${orderList }" var="order">
							<tr>
								<th scope="row"><c:out value="${order.id }"></c:out></th>
								<td><c:out value="${order.user.email }"></c:out></td>
								<td><c:out value="${order.date }"></c:out></td>
								<td><c:out value="${order.status.status }"></c:out></td>
								<td class="text-center"><a href="dashboard?id=${order.id }"><img alt="Icon check" src="assets/images/back_office/editIcon.png" width="20"></a></td>
								<td class="text-center"><a href="dashboard?id=${order.id }"><img alt="Icon check" src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
							</tr>
						  </c:forEach>
						</tbody>
					</table>
					<div>
						<a href=""><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
					</div>
			</div>
		</div>
		<!-- end order -->
		
				<!-- start  -->
		<div class="row dashBoardLine">
			<div class="col-5">
				<div class="d-flex justify-content-between">
					<h4>F.A.Q.</h4>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div class="">
					<table class="table table-bordered">
						<thead class="table-active">
							<tr>
								<th scope="col">Sujet</th>
								<th scope="col">Date de création</th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
 						 
						</tbody>
					</table>
				</div>
				<div>
					<a href=""><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
				</div>
			</div>
			<!-- end stock -->
			<!-- Start discount -->
			<div class="col-5">
				<div class="d-flex justify-content-between">
					<h4>Newsletter</h4>
					<form class="d-flex" role="search">
						<input class="form-control me-2" type="search"
							placeholder="Search" aria-label="Search">
						<button class="btn btn-outline-success" type="submit">Search</button>
					</form>
				</div>
				<div class="">
					<table class="table table-bordered">
						<thead class="table-active">
							<tr>
								<th scope="col">Titre</th>
								<th scope="col">Date de création </th>
								<th scope="col">Editer</th>
								<th scope="col">Supprimmer</th>
							</tr>
						</thead>
						<tbody>
						 
						</tbody>
					</table>
				</div>
				<div>
					<a href=""><img alt="" src="assets/images/back_office/plus.png" width="20"></a>
				</div>
			</div>
		</div>
		<!-- end FAQ and Newsletter -->
	</div>
</body>
</html>