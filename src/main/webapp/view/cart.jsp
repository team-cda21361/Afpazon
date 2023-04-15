<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<script defer type="text/javascript" src="./assets/js/cart.js"></script>
<script type="text/javascript" src="./assets/jQuery/jquery-3.6.2.min.js"></script>
<br>
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
<c:if test="${not empty cart.getItems() }">
<br>
<div class="container-fluid">
	<div class="row">
		<aside class="col-lg-9">
			<div class="card">
				<div class="table-responsive">
					<table class="table text-center">
						<thead>
							<tr>
								<th scope="col">Visuel</th>
								<th scope="col">Nom produit</th>
								<th scope="col">Prix unitaire</th>
								<th scope="col">Remise</th>
								<th scope="col">Quantite</th>
								<th scope="col">TTC</th>
								<th scope="col"></th>
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
														<p class="cartD"> <c:out value="${String.format('%.2f', itemD.getPercent()*100) }" /> %</p>
													</c:if>
													<c:if test="${item.getDiscount().size() <= 1}">	
														<p class="cartD">0.00 %</p>
													
													</c:if>
												</c:forEach>
											</c:if>
											<c:if test="${empty item.getDiscount()  }">
												<p class="cartD">0 %</p>
											</c:if>
										</div>
									</td>

									<td>
										<div style="display: inline-flex;">
									
											<form method="post">
												<button type="submit" class="btn btn-light" name="minus" value="<c:out value="${item.getProduct().getId()}"/>">
														<i class="bi bi-dash-circle p-3 "></i>		
												</button>
											</form>


											<span ><c:out value="${item.getQuantity()}" /></span>
											
											
											<form method="post">
												<button type="submit" class="btn btn-light" name="plus"	value="<c:out value="${item.getProduct().getId()}"/>">
														<i class="bi bi-plus-circle  p-3"></i>
												</button>
											</form>
										</div>


									</td>

									<td>
										<div class="price-wrap">
											<p class="cartD">
												<c:out value="${ String.format('%.2f', item.getPrixR()*item.getQuantity()) }" /> &euro;
											</p>
										</div>
									</td>
									<td>


										<form method="post">
											<button type="submit" class="btn btn-danger"
												name="deleteItem"
												value="<c:out value="${item.getProduct().getId()}"/>">
												<i class="bi bi-trash3-fill"></i>
											</button>
										</form>
									</td>

								</tr>
							</c:forEach>
								<tr>
								<td colspan="4"><p class="total">TOTAL:</p></td>
	
	
								<td><p class="cartH">
										<c:out value="${cart.countProduct() }" />
									</p></td>
	
	
								<td><p class="cartH">
										<c:out value="${String.format('%.2f', cart.countPrixProductApresRemise()) }" />
										&euro;
									</p></td>
	
							   </tr>
							
							
						</tbody>
					</table>
				</div>
			</div>
		</aside>








		<aside class="col-lg-3">
			<div class="card mb-3">
				<div class="card-body">
					
						<div class="form-group">
							<label>Vous avez un coupon?</label>
							<div class="input-group">
							
							<form method="post">
								<input type="text" class="form-control" name="coupon" placeholder="Coupon code"> 
								
									<button type="submit" class="btn btn-primary">
												<i class="bi bi-trash3-fill"></i> Appliquer
											</button>
							</form>
										
							
							
							</div>
						</div>
			
				</div>
			</div>
				
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
						 	<c:if test="${item.getDiscount().size() >1 && item.getDiscount() != null}">
								<p class="cartD"><c:out value="${item.getProduct().getName() }" /></p>							
								<c:forEach items="${item.getDiscount()}" var="itemR">
									<c:if test="${not empty itemR.getPercent() }">
										<dd class="text-right text-danger ml-3">- <c:out value="${ String.format('%.2f', itemR.getPercent()) }" /> %</dd>
									</c:if>
									<c:if test="${empty itemR.getPercent() == null}">
										<dd class="text-right text-danger ml-3">0 %</dd>
									</c:if>
								</c:forEach>
							</c:if>
							<c:if test="${item.getDiscount() == null }">
								<dd class="text-right text-danger ml-3">0 %</dd>
							</c:if>
						</c:forEach>
				
	
					</dl>
					<dl class="dlist-align">
						<dt>TVA (20 %): </dt>
						<dd class="text-right ml-3"><c:out value="${ String.format('%.2f', (cart.countPrixProduct()*0.20)) }" /> &euro;</dd>
					</dl>
					<dl class="dlist-align">
						<dt>TOTAL TTC: </dt>
						<dd class="text-right ml-3"><c:out value="${ String.format('%.2f', cart.countPrixProductApresRemise()) }" /> &euro;</dd>
					</dl>
					<hr>
		                
						
					<div class="align-self-end">
							<a href="index"	class="btn btn-primary " data-abc="true"><i class="bi bi-sign-turn-slight-left-fill"></i> Continuer les achats</a>
						<hr>
							<a href="payment"  class="btn btn-success"><i class="bi bi-cash-coin me-3"></i>Payer		
						</a>
				
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