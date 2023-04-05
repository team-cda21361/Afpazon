<h1 class="text-center text-dark my-3">Paiement</h1>

<div class="row justify-content-center">

<!--  ******************************************************************* DIV GAUCHE ************************************** -->

  <div class="col-5">
  <h3 class="text-center text-dark my-5">Recapitulatif commande</h3>
   
   <table class="table table-bordered mx-3">
  <thead class="table-active">
    <tr>
      <th scope="col">Image</th>
      <th scope="col">name</th>
      <th scope="col">Quantity</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th>:)</th>
      <td>reherher</td>
      <td>ghdfhdfgdr</td>
      <td>rhrherh</td>
    </tr>
    <tr>
      <th>:(</th>
      <td>reherher</td>
      <td>erherh</td>
      <td>erherh</td>
    </tr>
  </tbody>
</table>
 <div class="row d-flex justify-content-between">
  <div class="col-md-3 mx-3">
    <label for="inputVoucher" class="form-label">Code promo</label>
    <input type="text" class="form-control" id="inputVoucher" name="voucher">
  </div>
  <div class="col-md-3 align-right">
    <label for="inputTotal" class="form-label text-dark">Total</label>
    <input type="text" class="form-control" id="inputTotal" name="total">
  </div>
 </div>
   
  </div>

<!--  ******************************************************************* DIV DROITE ************************************** -->
  <div class="col-5 ml-3">
  <h3 class="text-center text-dark my-5">Recapitulatif client</h3>
     <form class="row g-3" method="post">
  <div class="col-md-6">
    <label for="inputFirstName" class="form-label">Nom</label>
    <input type="text" class="form-control" id="inputFirstName" value="$(currentUser.firstName)" name="firstName">
  </div>
  <div class="col-md-6">
    <label for="inputLastName" class="form-label">Prenom</label>
    <input type="text" class="form-control" id="inputLastName" value="$(currentUser.lastName)" name="lastName">
  </div>
  <div class="col-12">
    <label for="inputPhone" class="form-label">Telephone</label>
    <input type="text" class="form-control" id="inputPhone" value="$(currentUser.phone)" name="phone">
  </div>
  <div class="col-12">
    <label for="inputBillingAddress" class="form-label">Adresse de facturation</label>
    <input type="text" class="form-control" id="inputBillingAddress" value="$(currentUser.address)" name="billingAddress">
  </div>



  <div class="col-12">
    <label class="form-label">Adresse de livraison</label>
    <select class="form-select" aria-label="Default select example" name="deliveryAddress">
  <option selected>Open this select menu</option>
  <option value="1">One</option>
  <option value="2">Two</option>
  <option value="3">Three</option>
</select>
  </div>
<div>
<button type="button" class="btn btn-success">+</button>
</div>


<div>
<div class="col-md-6">
    <label for="validationBillingAddress" class="form-label">Adresse</label>
    <input type="text" class="form-control" id="validationBillingAddress" name="newAddressBilling">
  </div>
  <div class="col-md-3">
    <label for="validationZipCode" class="form-label">Code postal</label>
    <input type="number" class="form-control" id="validationZipCode" name="newZipCodeBilling">
  </div>
  <div class="col-md-3">
    <label for="validationCity" class="form-label">Ville</label>
    <input type="text" class="form-control" id="validationCity" name="newCityBilling">
  </div>
</div>


  <label class="form-label">Paiement via Paypal</label>
  <div class="col-12">
    <button type="submit" class="btn btn-primary">Proceder au paiment</button>
  </div>
</form>
  </div>
</div>


