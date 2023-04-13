<!-- ****************************************** TITRE ************************************************************** -->
<h2 class="col-12 text-center mt-5">
	<c:if test="${action == 'add'}">
		<c:out value="Ajout " />
	</c:if>
	<c:if test="${action == 'update'}">
		<c:out value="Modification " />
	</c:if>
	produit
</h2>

<div class="row justify-content-center">
	<!-- ****************************************** PREMIERE DIV ******************************************************* -->
	<div class="col-7">
		<div
			class="row <c:if test="${empty product.id }"><c:out value="d-none"></c:out></c:if>">
			<div class="w-25">
				<form method="get" action="actions">
					<input type="hidden" name="id-product" value=${product.id }>
					<input type="hidden" name="action" value="add-category-to-product">
					<label class="form-label">Ajouter une categorie</label> <select
						class="form-select mb-1" aria-label="Default select example"
						name="id">
						<option selected>Choisissez une categorie</option>
						<c:forEach items="${categories }" var="category">
							<option value="${category.id}"><c:out
									value="${category.category}"></c:out></option>
						</c:forEach>
					</select>
					<button class="btn btn-success d-flex flex-row align-items-end"
						type="submit">
						<i class="bi bi-plus-circle"></i>
					</button>

				</form>
			</div>
			<div class="w-50">
				<form method="get" action="actions">

					<input type="hidden" name="id-product" value=${product.id }>
					<input type="hidden" name="action" value="add-discount-to-product">
					<label class="form-label">Ajouter une promotion :</label> <select
						class="form-select mb-1" aria-label="Default select example"
						name="id">
						<option selected>Choisissez une promotion</option>
						<c:forEach items="${discounts }" var="discount">
							<option value="${discount.id}"><c:out
									value="${discount.voucher} --- ${discount.percent}% --- ${discount.startDate} --- ${discount.endDate}"></c:out></option>
						</c:forEach>
					</select>
					<button class="btn btn-success d-flex flex-row align-items-end"
						type="submit">
						<i class="bi bi-plus-circle"></i>
					</button>
				</form>
			</div>
		</div>

		<div
			class="row mt-3 <c:if test="${empty product.id }"><c:out value="d-none"></c:out></c:if>">
			<div class="w-25">
				<table id="tableCategory" class="table table-bordered">
					<caption class="h6">Catégorie(s) appliquée(s)</caption>
					<thead class="bg-secondary sticky-top">
						<tr>
							<th scope="col">Catégorie</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${categories_product }" var="categorie_product">
							<tr>
								<td><c:out value="${categorie_product.category}"></c:out></td>
								<td class="text-center"><a
									href="actions?action=delete-category-from-product&id=${categorie_product.id }&id-product=${product.id}"><img
										alt="Icon check"
										src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
      
			<!-- <div class="tablePane mb-3 border" style="height:30vh"> -->
			<div class="w-75">
				<table id="tablePromo" class="table table-bordered">
					<caption class="h6">Promotion(s) appliquée(s)</caption>
					<thead class="bg-secondary sticky-top">
						<tr>
							<th scope="col">Code</th>
							<th scope="col">%</th>
							<th scope="col">Date début</th>
							<th scope="col">Date fin</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${discounts_product }" var="discount_product">
							<tr>
								<td><c:out value="${discount_product.voucher}"></c:out></td>
								<td><c:out value="${discount_product.percent}"></c:out></td>
								<td><c:out value="${discount_product.startDate}"></c:out></td>
								<td><c:out value="${discount_product.endDate}"></c:out></td>
								<td class="text-center"><a
									href="actions?action=delete-discount-from-product&id=${discount_product.id }&id-product=${product.id}"><img
										alt="Icon check"
										src="assets/images/back_office/deleteIcon.png" width="20"></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<div
			class="d-flex flex-row justify-content-between mt-3 <c:if test="${empty product.id }"><c:out value="d-none"></c:out></c:if>">
			<div class="column w-50 m-3">
				<form method="post" enctype="multipart/form-data">
					<input type="hidden" name="action" value="add-image"> <input
						type="hidden" name="id-product" value=${product.id }> <input
						type="file" id="download_img" class="form-control" name="image"
						accept=".jpg,.png">
					<button class="btn btn-success d-flex flex-row align-items-end"
						type="submit">
						<i class="bi bi-plus-circle"></i>
					</button>
					<input type="image" class="form-control mb-3"
						src="<c:if test="${not empty product.mainPicPath }">
								<c:out value="assets/products/img/${product.mainPicPath }" default=""/>
							</c:if>
							<c:if test="${empty product.mainPicPath }"><c:out value="assets/products/img/image_placeholder.png" default=""/>
							</c:if>
							"
						name="image">

				</form>
			</div>
			<div
				class="column w-50 m-3 <c:if test="${empty product.id }"><c:out value="d-none"></c:out></c:if>">
				<form method="post" enctype="multipart/form-data">
					<input type="hidden" name="action" value="add-video"> <input
						type="hidden" name="id-product" value=${product.id }> <input
						type="file" class="form-control" name="video" accept=".mp4">
					<button class="btn btn-success d-flex flex-row align-items-end"
						type="submit">
						<i class="bi bi-plus-circle"></i>
					</button>
					<video controls class="w-100">
						<source
							src="<c:if test="${not empty product.videoPath }">
								<c:out value="assets/products/vid/${product.videoPath}" default=""/>
							</c:if>
							<c:if test="${empty product.videoPath }">
								<c:out value="assets/products/vid/video_placeholder.png" default=""/>
							</c:if>"
							type="video/mp4">
					</video>
				</form>
			</div>
		</div>
	</div>
	<div
		class="<c:if test="${empty product.id }"><c:out value="col-10 w-50"></c:out></c:if> 
		<c:if test="${not empty product.id }"><c:out value="col-4 mt-5 mr-3"></c:out></c:if>">
		<form method="post">
			<input type="hidden" name="id-product" value=${product.id }>
			<input type="hidden" name="action" value="add-product"> <input
				type="hidden" name="main-pic-path" value=${product.mainPicPath }>
			<input type="hidden" name="video-path" value=${product.videoPath }>

			<!-- ****************************************** DEUXIEME DIV ******************************************************* -->
			<div class="row">
				<div class="w-75">
					<label>Présent dans le carrousel : </label>
				</div>
				<div
					class="w-25 form-check form-switch d-flex justify-content-end mb-3">
					<input class="form-check-input" name="in-caroussel" type="checkbox"
						<c:if test="${product.isInCarousel()}"> <c:out value="checked"/>
					</c:if>>
				</div>
			</div>
			<div class="row ">
				<div class="w-75 ">
					<label for="exampleFormControlSponsoring" class="form-label">Poids
						publicitaire (1-100) :</label>
				</div>
				<div class="w-25">
					<input type="number" min="1" max="100"
						class="form-control mb-3 border border-warning"
						id="exampleFormControlSponsoring" name="sponsoring"
						value="<c:out value="${product.sponsoring}" default=""/>">
				</div>
			</div>
			<div class="row">
				<div class="w-25">
					<label>Reference:</label>
				</div>
				<div class="w-75">
					<input type="text" maxlength="30" class="form-control mb-3"
						name="reference"
						value="<c:out value="${product.reference }" default=""/>">
				</div>
			</div>
			<div class="row">
				<div class="w-75">
					<label>Garantie (en années):</label>
				</div>
				<div class="w-25">
					<select class="form-select mb-3"
						aria-label="Default select example" name="warranty">
						<option selected value=<c:out value="${product.warranty }"/>>
							<c:out value="${product.warranty }"
								default="Choisissez une garantie" /></option>
						<c:forEach items="${warranties }" var="warranty">
							<option value="${warranty }"><c:out value="${warranty}"></c:out></option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="row">
				<div class="w-25">
					<label>Nom :</label>
				</div>
				<div class="w-75">
					<textarea maxlength="150" class="form-control mb-3" name="name"><c:out
							value="${product.name }" default="" /></textarea>
				</div>
			</div>
			<div class="row">
				<div class="w-25">
					<label class="form-label">Description:</label>
				</div>
				<div class="w-75">
					<textarea class="form-control mb-3"
						id="exampleFormControlDescription" rows="3" name="description"><c:out
							value="${product.description }" default="" /></textarea>
				</div>
			</div>

			<div class="row">
				<div class="w-25">
					<label class="form-label">Taille :</label>
				</div>
				<div class="w-25">
					<input type="text" maxlength="30" class="form-control mb-3"
						name="size" value="<c:out value="${product.size }" default=""/>">
				</div>

				<div class="w-25 text-end">
					<label class="form-label">Poids (kg) :</label>
				</div>
				<div class="w-25">
					<input type="number" min="1" step="0.1" class="form-control mb-3"
						name="weight"
						value="<c:out value="${product.weight}" default=""/>">
				</div>
			</div>


			<div class="row">
				<div class="w-25">
					<label class="form-label">Couleur:</label>
				</div>
				<div class="w-75">
					<input type="text" maxlength="30" class="form-control mb-3"
						name="color" value="<c:out value="${product.color}" default=""/>">
				</div>
			</div>

			<div class="row">
				<div class="w-25">
					<label class="form-label">Prix :</label>
				</div>
				<div class="w-25">
					<input type="number" min="1" step="0.01"
						class="form-control mb-3 w-40" id="exampleFormControlSize"
						name="price" value="<c:out value="${product.price}" default=""/>">
				</div>
				<div class="w-25  text-end">
					<label class="form-label">TVA :</label>
				</div>

				<div class="w-25">
                    <select class="form-select mb-3"
                        aria-label="Default select example" name="TVA">
                        <option selected value=<c:out value="${product.vat.id }"/>>
                            <c:out value="${product.vat.value }" default="%" /></option>
                        <c:forEach items="${vats }" var="vat">
                            <option value=<c:out value="${vat.id }"/>><c:out
                                    value="${vat.value}"></c:out></option>
                        </c:forEach>
                    </select>
                </div>
			</div>

			<div class="row justify-content-around mt-5">
				<div class="w-50">
					<a
						class="<c:if test="${empty product.id }"><c:out value="d-none"></c:out></c:if>"
						href="user-reviews-management?productId=${product.id }">
						<button type="button" class="btn btn-primary">Gestion des
							avis</button>
					</a>
				</div>
				<div class="w-50">
					<button type="submit" id="submit-product" class="btn btn-primary <c:if test="${empty product.id }"><c:out value="mb-5"></c:out></c:if>">
						<c:if test="${action == 'add'}">
							<c:out value="Ajouter " />
						</c:if>
						<c:if test="${action == 'update'}">
							<c:out value="Modifier " />
						</c:if>
					</button>
				</div>
			</div>
		</form>
	</div>
</div>
<div class="col-6 ms-5 <c:if test="${empty product.id }"><c:out value="d-none"></c:out></c:if>">
	<form method="post" class="w-50" enctype="multipart/form-data">
		<label class="form-label"> Ajouter des images compl�mentaires
		</label> <input type="hidden" name="action" value="add-more-image"> <input
			type="hidden" name="id-product" value=${product.id }> <input
			type="file" id="download_img" class="form-control" name="image"
			accept=".jpg,.png">
		<button class="btn btn-success d-flex flex-row align-items-end"
			type="submit">
			<i class="bi bi-plus-circle"></i>
		</button>
	</form>
	<div class="w-50">
		<table id="tableCategory" class="table table-bordered">
			<thead class="bg-secondary sticky-top">
				<tr>
					<th scope="col">Image(s) compl�mentaire(s)</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${complementary_images }"
					var="complementary_image">
					<tr>
						<td><c:out value="${complementary_image.picPath}"></c:out></td>
						<td class="text-center"><a
							href="actions?action=delete-image-complementaire-from-product&id=${complementary_image.picPath}&id-product=${product.id}"><img
								alt="Icon check" src="assets/images/back_office/deleteIcon.png"
								width="20"></a></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>