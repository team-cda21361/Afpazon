<div class="container my-5">
    <div class="row">
        <div class="col-9">
        <c:if test="${not empty cart.getItems() }">
            <table class="table text-center">
                <thead>
                    <tr>
                        <th>visuel</th>
                        <th>Nom produit</th>
                        <th>Prix unitaire</th>
                        <th>Remise</th>
                        <th>Quantite</th>
                        <th>TTC</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody class="align-middle">
                  <c:forEach items="${cart.getItems()}" var="item">  
                    <tr>
                        <td><img height=40 src="assets/products/img/<c:out value="${item.getProduct().getMainPicPath()}"/>"  alt="#"></td>
                        <td><p class="cartD"><c:out value="${item.getProduct().getName()}"/></p></td>
                        <td><p class="cartD"><c:out value="${String.format('%.2f', item.getProduct().getPrice()+(item.getDiscount()*item.getProduct().getPrice())) }"/> &euro; ttc</p></td>
                        
                        <td><p class="cartD"><c:out value="${String.format('%.2f', item.getDiscount()*100) }"/> %</p></td>
                        
                        <td><div style="display: inline-flex;">
                        <p class="cartD">
                        <form method="post" >
							<button type="submit" class="btn btn-light" name="plus" value="<c:out value="${item.getProduct().getId()}"/>">
							   <i class="bi bi-plus-circle  p-3"></i>
							</button>
						</form>
                        
                        
                        <c:out value="${item.getQuantity()}"/>
                        
                        <form method="post" >
							<button type="submit" class="btn btn-light" name="minus" value="<c:out value="${item.getProduct().getId()}"/>">
							   <i class="bi bi-dash-circle p-3 "></i>
							</button>
						</form>
						
                        
                        </div>
                        </p></td>
                        
                        
                        
                        <td><p class="cartD"><c:out value="${ String.format('%.2f', item.getProduct().getPrice()*item.getQuantity()) }"/> &euro; </p></td>
                    
                    
                  		<td><p class="cartD">
   
   
                        <form method="post">
							<button type="submit" class="btn btn-danger" name="deleteItem" value="<c:out value="${item.getProduct().getId()}"/>">
							    <i class="bi bi-trash3-fill"></i>
							</button>
						</form>
						               		


						</p></td>
                    
                    </tr>
                  </c:forEach>  
                  
                  
                  <tr>
                        <td colspan="4"><p class="total">TOTAL:</p></td>
         
                        
                        <td><p class="cartH"><c:out value="${cart.countProduct() }"/></p></td>
                    
                    
                  		<td><p class="cartH"><c:out value="${cart.countPrixProduct() }"/> &euro; </p></td>
                    
                    </tr>
                </tbody>
            </table>
         
        </div>
        <div class="col-3 p-3 bg-secondary d-flex flex-column justify-content-between">
            <div>
                <table class="table text-light lh-lg">
                    <thead class="text-center align-middle table-light">
                        <tr>
                            <th colspan="2">Commande total :</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="col-3 fst-italic">Sous-Total HT :</td>
                            <td class="col-3 fst-italic"> &euro;</td>
                        </tr>
                        <tr>
                            <td class="col-3 fst-italic">Remise ():</td>
                            <td class="col-3 fst-italic">0 &euro;</td>
                        </tr>
                        <tr>
                            <td class="col-3 fst-italic">TVA (20 %) :</td>
                            <td class="col-3 fst-italic">  &euro;</td>
                        </tr>
                        <tr class="mt-5">
                            <td class="col-3 fw-bolder">TOTAL TTC :</td>
                            <td class="col-3 fw-bolder"><c:out value="${cart.countPrixProduct() }"/> &euro;</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="align-self-end">
                <a href="payment">
                    <button class="btn btn-success" type="submit"><i class="bi bi-cash-coin me-3"></i>payer</button>
                </a>
            </div>
          </c:if>
          
          <c:if test="${empty cart.getItems() }">
           <div><img src="assets/images/logo/paniervide.png" width="200px">  </div>
            	     <p class="cartL">Votre panier est vide!!!</p>
            	     <a href="/Afpazon" class="btn btn-primary">Continuer les achats</a>
          </c:if>
          
        </div>
       
    </div>
    
</div>

