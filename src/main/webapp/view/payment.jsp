<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<script defer type="text/javascript" src="./assets/js/payment.js"></script>
<script type="text/javascript" src="./assets/jQuery/jquery-3.6.2.min.js"></script>
<section>
<c:if test="${msnType.equals('OK')}">
		<div class="alert alert-success timer" role="alert">
			<c:out value="${msn }"></c:out>
		</div>
</c:if>
<c:if test="${msnType.equals('KO')}">
		<div class="alert alert-danger timer" role="alert">
			<c:out value="${msn }"></c:out>
		</div>
</c:if>

<h1 class="text-center text-dark my-3"><i class="bi bi-cash-coin me-3"></i> Paiement</h1>
<c:if test="${not empty cart.getItems() }">

<div class="container-fluid">
	<div class="row">
		<aside class="col-lg-9">
			<div class="card">
			    <h1>Recapitulatif commande</h1>
				<hr>
				<div class="table-responsive">
					<table class="table text-center">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">Nom produit</th>
								<th scope="col">Prix unitaire</th>
								<th scope="col">Remise</th>
								<th scope="col">Quantite</th>
								<th scope="col">TTC</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cart.getItems()}" var="item">
								<tr>
									<td><img height=40
										src="assets/products/img/<c:out value="${item.getProduct().getMainPicPath()}"/>"
										alt="#"></td>
									<td>
										<div class="price-wrap">
											<p class="cartD">
												<c:out value="${item.getProduct().getName()}" />
											</p>
										</div>
									</td>
									<td>
										<div class="price-wrap">
											<p class="cartD">
												<c:out value="${String.format('%.2f', item.getProduct().getPrice() )}" /> &euro; ttc
											</p>
										</div>
									</td>
									<td>
										<div class="price-wrap">
											<c:if test="${not empty item.getDiscount()  }">
												<c:forEach items="${item.getDiscount() }" var="itemD">
													<c:if test="${not empty itemD.getPercent()  }">
														<p class="cartD"> <c:out value="${String.format('%.2f', (itemD.getPercent()*100)) }" /> %</p>
													</c:if>
													<c:if test="${empty itemD.getPercent()}">	
														<p class="cartD">0.00 %</p>
													
													</c:if>
												</c:forEach>
											</c:if>
			
										</div>
									</td>

									<td>
										<div style="display: inline-flex;">
											<span ><c:out value="${item.getQuantity()}" /></span>
										</div>


									</td>

									<td>
										<div class="price-wrap">
											<p class="cartD">
												<c:out value="${ String.format('%.2f', item.getPrixR()*item.getQuantity()) }" /> &euro;
											</p>
										</div>
									</td>
	

								</tr>
							</c:forEach>
								<tr>
								<td colspan="4"><p class="total">TOTAL:</p></td>
	
	
								<td><p class="cartH">
										<c:out value="${cart.countProduct() }" />
									</p></td>
	
	
								<td class="backTotal"><p class="cartH">
										<c:out value="${String.format('%.2f', cart.countPrixProductApresRemise()) }" />
										&euro;
									</p></td>
	
							   </tr>
							
							
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="card">
				<div class="container">
				<h1>Recapitulatif client</h1>
				<hr>
				<c:if test="${empty currentUser}">
				<p class="loginConnect">Pour continuer la transaction de paiement, vous devez être connecté..</p>
				<div class="row" >
					<div class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12 shadow p-3 mb-5 bg-body rounded" >
						<div class="register-form">
							<h3>Se Connecter</h3>
							<hr>
							<div class="row">
								<div class="mb-3 w-50">
									<img src="assets/images/login.jpg" class="imgv">
								</div>
								<div class="mb-3 w-50">
								
									<form method="post" onsubmit="checkformML(event)" name="formML">
										<div class="mb-3">
											<label class="form-label">*Email</label> <input type="text"
												class="form-control form-controlV" placeholder="Email" id="email" name="email">
											<p class="erroremail error"></p>
										</div>
			
										<div class="mb-3 lab1">
											<label class="form-label">*Password</label> <input
												type="password" class="form-control form-controlV" placeholder="Password"	id="password" name="password">
											<p class="errorpassword error"></p>
											
										</div>
			
			
										<button type="submit" class="btn btn-primary envformL">Se connecter</button>
			
			
									</form>
			
								</div>
							</div>
						</div>
					</div>
					</div>

				</c:if>
				<c:if test="${not empty currentUser}">
				<div class="container">
					<div class="col-8 ml-3">
						  <form class="row g-3" method="post">
						  <div class="col-md-6">
						    <label for="inputFirstName" class="form-label"><strong>Nom:</strong></label>
						    <input type="text" class="form-control" id="inputFirstName" value="<c:out value="${currentUser.getFirstName() }"/>" name="firstName" disabled>
						  </div>
						  <div class="col-md-6">
						    <label for="inputLastName" class="form-label"><strong>Prenom:</strong></label>
						    <input type="text" class="form-control" id="inputLastName" value="<c:out value="${currentUser.getLastName() }"/>" name="lastName" disabled>
						  </div>
						  <div class="col-12">
						  	<h3 class="text-secondary"><i class="bi bi-telephone"></i>Mon Téléphone *</h3><hr>
						  	<c:if test="${empty currentUser.getPhone()}">
						  	<form method="post" onsubmit="checkformT(event)" action="payment" name="formT">
						    	<label for="inputphone" class="form-label"><strong>Telephone: </strong></label><p class="loginConnect">Vous devez spécifier un numéro de téléphone.</p>
						    	<input type="text" class="form-control form-controlT" id="phone" name="phone">
						    	<p class="errorphone error"></p>
						    	<input type="hidden" name="telephoneP" value="telNew"><br>
						    	<button type="submit" class="btn btn-primary" id="envformT" disabled> <i class="bi bi-telephone-fill"></i>  Ajouter</button>
						   
						    </form>
						    </c:if>
						    <c:if test="${not empty currentUser.getPhone()}">
						    <form method="post" onsubmit="checkformT(event)" action="payment" name="formT">
						    	<label for="inputphone" class="form-label"><strong>Telephone: </strong></label>
						    	<input type="text" class="form-control form-controlT" id="phone" name="phone" value="<c:out value="${currentUser.getPhone() }"/>">
						    	<p class="errorphone error"></p>
						    	<input type="hidden" name="telephoneP" value="telEdit"><br>
						    	<button type="submit" class="btn btn-primary" id="envformT" disabled> <i class="bi bi-telephone-fill"></i>  Mettre à jour</button>
						    </form>
						    </c:if>
						  </div>
						  <div class="col-12">
						  <br>

						    
						    
						  </div>

						  <div class="col-12">

						<h3 class="text-secondary"><i class="bi bi-envelope"></i> Mon adresse de livraison *</h3><hr>
						<c:if test="${deliveryAddressesCounter > 0}">
							    <select class="form-select form-control" aria-label="Default select example" name="AddressEnv" id="AddressEnv">
							  				<option selected>Choisir une adresse</option>
							  		<c:forEach items="${addressesList}" var="address">
										<c:if test="${address.address_type.type == 'livraison'}">
							  				<option value="${address.id}"><c:out value="${address.address}" />, <c:out value="${address.zipCode}" />, <c:out value="${address.city}" /></option>
										</c:if>
							  		</c:forEach>
								</select>
						
							    <p class="errorAddressEnv error"></p>
								<button class="btn btn-link text-primary btn-toggle-details"
								type="button" data-bs-toggle="collapse"
								data-bs-target="#collapse5" aria-expanded="false"
								aria-controls="collapse">Ajouter</button>
								<div class="collapse" id="collapse5">
								<form method="post" onsubmit="checkformAddE(event)" action="payment" name="formAddE">
									<div class="mb-3">
										<div class="row">
											<div class="col-6">
												<label for="inputStreet" class="form-label">Voie</label>
												<input type="text" class="form-control form-controlAddE" id="inputStreetA" name="inputStreetA" placeholder="Voie">
												<p class="errorinputStreetA error"></p>
											</div>
											<div class="col">
												<label for="inputZipCode" class="form-label">Code Postal</label>
												<input type="text" class="form-control form-controlAddE col-5" id="inputZipCodeA" name="inputZipCodeA" placeholder="Code Postal">
												<p class="errorinputZipCodeA error"></p>
											</div>
											<div class="col">
												<label for="inputCity" class="form-label">Ville</label>
												<input type="text" class="form-control form-controlAddE col-5" id="inputCityA" name="inputCityA" placeholder="Ville" >
												<p class="errorinputCityA error"></p>
											</div>
										</div>
									</div>
									<input type="hidden" name="AdresseP" value="AdresseP">
									<button type="submit" class="btn btn-primary" id="addressAddE" disabled> <i class="bi bi-plus-circle"></i> </button>
								</form>
								</div>
						</c:if>
						<c:if test="${deliveryAddressesCounter == 0}">
							<h3 class="text-center mb-3">Aucune adresse renseignée</h3>
							<form method="post" onsubmit="checkformAddE(event)" action="payment" name="formAddE">
									<div class="mb-3">
										<div class="row">
											<div class="col-6">
												<label for="inputStreet" class="form-label">Voie</label>
												<input type="text" class="form-control form-controlAddE" id="inputStreetA" name="inputStreetA" placeholder="Voie">
												<p class="errorinputStreetA error"></p>
											</div>
											<div class="col">
												<label for="inputZipCode" class="form-label">Code Postal</label>
												<input type="text" class="form-control form-controlAddE col-5" id="inputZipCodeA" name="inputZipCodeA" placeholder="Code Postal">
												<p class="errorinputZipCodeA error"></p>
											</div>
											<div class="col">
												<label for="inputCity" class="form-label">Ville</label>
												<input type="text" class="form-control form-controlAddE col-5" id="inputCityA" name="inputCityA" placeholder="Ville" >
												<p class="errorinputCityA error"></p>
											</div>
										</div>
									</div>
									<input type="hidden" name="AdresseP" value="AdresseP">
									<button type="submit" class="btn btn-primary" id="addressAddE" disabled> <i class="bi bi-plus-circle"></i> </button>
								</form>
						</c:if>
						
						<hr id="accountBilling">
						<h3 class="text-secondary"><i class="bi bi-receipt"></i> Mon adresse de facturation *</h3><hr>
					 	<c:if test="${not empty addressesFacturation}">
						<form method="post" onsubmit="checkformAddE(event)" action="payment" name="formAddF">
							<div class="mb-3">
								<div class="row">
									<div class="col-6">
										<label for="inputBillingStreet" class="form-label">Voie</label>
										<input type="text" class="form-control form-controlAddF" id="inputStreetF" name="inputStreetF" placeholder="Voie" value="<c:out value="${addressesFacturation.getAddress()}" />">
										<p class="errorinputStreetF error"></p>
									</div>
									<div class="col">
										<label for="inputBillingZipCode" class="form-label">Code Postal</label>
										<input type="text" class="form-control form-controlAddF col-5" id="inputZipCodeF" name="inputZipCodeF" placeholder="Code Postal" value="<c:out value="${addressesFacturation.getZipCode()}" />">
										<p class="errorinputZipCodeF error"></p>
									</div>
									<div class="col">
										<label for="inputBillingCity" class="form-label">Ville</label>
										<input type="text" class="form-control form-controlAddF col-5" id="inputCityF" name="inputCityF" placeholder="Ville" value="<c:out value="${addressesFacturation.getCity()}" />">
										<p class="errorinputCityF error"></p>
									</div>
								</div>
							</div>
							<input type="hidden" name="AdresseP" value="AdresseF">
							<input type="hidden" name="AdresseP2" value="<c:out value="${addressesFacturation.getId()}" />">
							<button type="submit" class="btn btn-primary" id="addressAddF" disabled><i class="bi bi-pencil-square" ></i>  Mettre à jour</button>
						</form>
						</c:if>
						<c:if test="${empty addressesFacturation}">
						<h3 class="text-center mb-3">Aucune adresse renseignée</h3>
						<form method="post" onsubmit="checkformAddE(event)" action="payment" name="formAddF">
							<div class="mb-3">
								<div class="row">
									<div class="col-6">
										<label for="inputBillingStreet" class="form-label">Voie</label>
										<input type="text" class="form-control form-controlAddF" id="inputStreetF" name="inputStreetF" placeholder="Voie">
										<p class="errorinputStreetF error"></p>
									</div>
									<div class="col">
										<label for="inputBillingZipCode" class="form-label">Code Postal</label>
										<input type="text" class="form-control form-controlAddF col-5" id="inputZipCodeF" name="inputZipCodeF" placeholder="Code Postal" >
										<p class="errorinputZipCodeF error"></p>
									</div>
									<div class="col">
										<label for="inputBillingCity" class="form-label">Ville</label>
										<input type="text" class="form-control form-controlAddF col-5" id="inputCityF" name="inputCityF" placeholder="Ville" >
										<p class="errorinputCityF error"></p>
									</div>
								</div>
							</div>
							<input type="hidden" name="AdresseP" value="AdresseF">
							<input type="hidden" name="AdresseP2" value="0">
							<button type="submit" class="btn btn-primary" id="addressAddF" disabled><i class="bi bi-pencil-square"></i> Créer adresse</button>
						</form>
						</c:if>
						
						<hr>
							
						  </div>
						<div>
						
				
						<hr>
						

						</div>
						</form>
						
						
												
						
						   <div class="col-md-6">
						   <form method="post" action="authorize_payment" name="formPaypal">
							   <input type="hidden" name="product" value="Detaille">
							   <input type="hidden" name="subtotal" value="<c:out value="${ String.format('%.2f', ((cart.countPrixProduct()-(cart.countPrixProduct()*0.20)))-(cart.countPrixProduct() - cart.countPrixProductApresRemise())) }" />">
							   <input type="hidden" name="shipping" value="<c:out value="${ String.format('%.2f', (0.00)) }" />">
							   <input type="hidden" name="tax" value="<c:out value="${ String.format('%.2f', (cart.countPrixProduct()*0.20)) }" />">
							   <input type="hidden" name="total" value="<c:out value="${ String.format('%.2f', cart.countPrixProductApresRemise()) }" />">
							   <input type="hidden" name="telphoneL" id="telphoneL" value="<c:out value="${currentUser.getPhone() }"/>">
							   <input type="hidden" name="adressL" id="adressL" value="">
							   <input type="hidden" name="adressF" id="adressF" value="<c:out value="${addressesFacturation.getId()}" />">
							   <input type="hidden" name="remiseT" value="<c:out value="${ String.format('%.2f', ((cart.countPrixProduct() - cart.countPrixProductApresRemise())*100)/cart.countPrixProduct()) }" />">
							   <label class="form-label"><strong>Paiement via Paypal:</strong></label>
							   <c:if test="${addressesFacturation.getId() != null && currentUser.getPhone() != null}">
							    	<button type="button" class="btn btn-success" id="btnpaypal" onclick="valdir(event)"><i class="bi bi-paypal"></i> Proceder au paiment</button><br><br>
							   </c:if>
							   	<c:if test="${addressesFacturation.getId() == null && currentUser.getPhone() == null}">
							    	<button type="submit" class="btn btn-success" id="btnpaypal" disabled><i class="bi bi-paypal"></i> Proceder au paiment</button><br><br>
							   </c:if>
						  </form>
						  </div>
						  </div>
				</div>
				
				</c:if>
				</div>
			</div>
		</aside>

		<aside class="col-lg-3">
	
				
			<div class="card">
				<div class="card-body">
					<dl class="dlist-align"><dt><h5><strong>Commande total :</strong></h5></dt></dl><hr>
					<dl class="dlist-align">
					
						<dt>Sous-Total HT:</dt>
						<dd class="text-right ml-3"><c:out value="${ String.format('%.2f', cart.countPrixProduct()-(cart.countPrixProduct()*0.20)) }" /> &euro;</dd>
					</dl>
					<dl class="dlist-align">
						<dt>Remise: </dt>
				
												
								<c:forEach items="${cart.getItems()}" var="item">
								<p class="cartD"><c:out value="${item.getProduct().getName() }" /></p>
								<c:if test="${not empty item.getDiscount() }">
									<c:forEach items="${item.getDiscount() }" var="itemD" >
										<c:if test="${not empty itemD.getPercent()  }">
											<p class="cartD">- <c:out value="${String.format('%.2f', itemD.getPercent()*100) }" /> %</p>
										</c:if>
										<c:if test="${empty itemD.getPercent()}">	
											<p class="cartD">0.00 %</p>
										</c:if>
									</c:forEach>
								</c:if>
								</c:forEach>
				
	
					</dl>
					<dl class="dlist-align">
						<dt>TVA (20 %): </dt>
						<dd class="text-right ml-3"><c:out value="${ String.format('%.2f', (cart.countPrixProduct()*0.20)) }" /> &euro;</dd>
					</dl>
					<dl class="dlist-align ">
						<dt class="totalPayment"> TOTAL TTC:</dt>
						<dd class="text-right ml-3 totalPaymentGr"> <c:out value="${ String.format('%.2f', cart.countPrixProductApresRemise()) }" /> &euro;</dd>
					</dl>
					<hr>
		                
						
					<div class="align-self-end">
							<a href="cart"	class="btn btn-primary " data-abc="true"><i class="bi bi-sign-turn-slight-left-fill"></i>Modifier mes achats</a>				
					</div>
			
				</div>
			</div>
		</aside>
	</div>
</div>
<br>
</c:if>
<c:if test="${empty cart.getItems() }">
<br>
	<div>
		<img src="assets/images/logo/paniervide.png" width="200px">
	</div>
	<p class="cartL">Votre panier est vide!!!</p>
	<a href="/Afpazon" class="btn btn-primary">Continuer les achats</a>
<br>
</c:if>
<br>
</section>
