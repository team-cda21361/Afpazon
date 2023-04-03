<div class="container w-75 d-flex justify-content-center align-items-center ">
	<div>
		<h2 class="col-12 text-center mt-2">Génération des catalogues</h2>
		<div class="col-12  d-flex flex-row justify-content-center mt-2 mb-5">
			<label class="form-check-label me-2">Inclure les nouveautés :</label>
			<div class="form-check form-switch me-5">
				<input class="form-check-input" type="checkbox">
			</div>
			<label class="form-check-label ms-5 me-2">Ordre des prix :</label>
			<div class="form-check me-2">
				<input class="form-check-input" type="checkbox" value=""
					id="flexCheckDefault"> <label class="form-check-label"
					for="flexCheckDefault"> croissant </label>
			</div>
			<div class="form-check">
				<input class="form-check-input" type="checkbox" value="" checked>
				<label class="form-check-label"> decroissant </label>
			</div>
		</div>
		<div class="row my-5">
			<div class="col-4 align-items-end">
				<label class="form-label">Catégories <a href=""><i
						class="ms-1 bi bi-plus-circle"></i></a></label> <select class="form-select"
					aria-label="Default select example">
					<option selected>Sélectionner une catégorie</option>
					<c:forEach items="${categories }" var="categorie">
						<option value="<c:out value="${categorie.id}"></c:out>"><c:out
								value="${categorie.category}"></c:out></option>
					</c:forEach>
				</select>
			</div>
			<div class="col-4 align-items-end">
				<label class="form-label">Promotions <a href=""><i
						class="ms-1 bi bi-plus-circle"></i></a></label> <select class="form-select"
					aria-label="Default select example">
					<option selected>Sélectionner une promotion</option>
					<c:forEach items="${discounts }" var="discount">
						<option value="<c:out value="${discount.id}"></c:out>"><c:out
								value="début: ${discount.startDate} | fin:${discount.endDate} | %: ${discount.percent}"></c:out></option>
					</c:forEach>
				</select>
			</div>
			<div class="col-4 ">
				<label class="form-label">Quantité d'articles dans le
					catalogue :</label> <input type="number" class="form-control"
					name="number_of_articles" min="1" value="1">
			</div>
		</div>
		<div class="row my-5">
			<div class="col-4">
				<h4 class="mb-2">Catégories ajoutées :</h4>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Catégorie</th>
							<th>Supp.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>"High tech"</td>
							<td><a href=""><i class="bi bi-trash3-fill"></i></a></td>
						</tr>
						<tr>
							<td>"Camping"</td>
							<td><a href=""><i class="bi bi-trash3-fill"></i></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="col-6">
				<h4 class="mb-2">Promos ajoutées :</h4>
				<table id="example" class="display" style="width: 100%">
					<thead>
						<tr>
							<th>Code</th>
							<th>%</th>
							<th>Date de début</th>
							<th>Date de fin</th>
							<th>Supp.</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>PromoMai20</td>
							<td>20</td>
							<td>2023-05-01</td>
							<td>2023-05-02</td>
							<td><a href=""><i class="bi bi-trash3-fill"></i></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="row mt-5 ">
				<div class="col-12 d-flex justify-content-end">
					<button class="btn btn-primary">
						Générer le catalogue
						<svg width="48" height="48" fill="currentColor"
							class="bi bi-file-earmark-pdf" viewBox="0 0 16 16">
  					<path
								d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2zM9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5v2z" />
  					<path
								d="M4.603 14.087a.81.81 0 0 1-.438-.42c-.195-.388-.13-.776.08-1.102.198-.307.526-.568.897-.787a7.68 7.68 0 0 1 1.482-.645 19.697 19.697 0 0 0 1.062-2.227 7.269 7.269 0 0 1-.43-1.295c-.086-.4-.119-.796-.046-1.136.075-.354.274-.672.65-.823.192-.077.4-.12.602-.077a.7.7 0 0 1 .477.365c.088.164.12.356.127.538.007.188-.012.396-.047.614-.084.51-.27 1.134-.52 1.794a10.954 10.954 0 0 0 .98 1.686 5.753 5.753 0 0 1 1.334.05c.364.066.734.195.96.465.12.144.193.32.2.518.007.192-.047.382-.138.563a1.04 1.04 0 0 1-.354.416.856.856 0 0 1-.51.138c-.331-.014-.654-.196-.933-.417a5.712 5.712 0 0 1-.911-.95 11.651 11.651 0 0 0-1.997.406 11.307 11.307 0 0 1-1.02 1.51c-.292.35-.609.656-.927.787a.793.793 0 0 1-.58.029zm1.379-1.901c-.166.076-.32.156-.459.238-.328.194-.541.383-.647.547-.094.145-.096.25-.04.361.01.022.02.036.026.044a.266.266 0 0 0 .035-.012c.137-.056.355-.235.635-.572a8.18 8.18 0 0 0 .45-.606zm1.64-1.33a12.71 12.71 0 0 1 1.01-.193 11.744 11.744 0 0 1-.51-.858 20.801 20.801 0 0 1-.5 1.05zm2.446.45c.15.163.296.3.435.41.24.19.407.253.498.256a.107.107 0 0 0 .07-.015.307.307 0 0 0 .094-.125.436.436 0 0 0 .059-.2.095.095 0 0 0-.026-.063c-.052-.062-.2-.152-.518-.209a3.876 3.876 0 0 0-.612-.053zM8.078 7.8a6.7 6.7 0 0 0 .2-.828c.031-.188.043-.343.038-.465a.613.613 0 0 0-.032-.198.517.517 0 0 0-.145.04c-.087.035-.158.106-.196.283-.04.192-.03.469.046.822.024.111.054.227.09.346z" />
  				</svg>
					</button>
				</div>
			</div>
		</div>
	</div>
</div>