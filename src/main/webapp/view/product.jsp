<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="UTF-8"%>
<script defer type="text/javascript" src="./assets/js/product.js"></script>
<script type="text/javascript" src="./assets/jQuery/jquery-3.6.2.min.js"></script>
	<main>
	<br>
	<!-- Start Item Details -->
    <section class="item-details section">
        <div class="container">
            <div class="top-area">
                <div class="row align-items-center">
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-images">
                            <main id="gallery">
                                <div class="main-img">
                                    <img src="assets/products/img/<c:out value="${ product.getMainPicPath() }" />" id="current" alt="#">
                                </div>
                                <div class="images">
                                    <img src="assets/products/img/<c:out value="${ product.getMainPicPath() }" />" class="img" alt="#">
                                <c:forEach items="${ images }" var="images" varStatus="status">
                                    <img src="assets/products/img/<c:out value="${ images.getPicPath() }" />" class="img" alt="#">
                                </c:forEach>
                                </div>
                            </main>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12 col-12">
                        <div class="product-info">
                            <h2 class="title"><c:out value="${ product.getName() }" /></h2>
                            <p class="category"></p>
                            <h3 class="price"><c:out value="${ product.getPrice() }" /> &euro; <span></span></h3>
                            <p class="info-text"><c:out value="${ product.getDescription() }" /></p>
                            <div class="row">
                                <div class="col-lg-4 col-md-4 col-12">
                                    <div class="form-group color-option">
                                      
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-12">
                                    <div class="form-group">
                                        <label for="color"><strong>Couleur: </strong></label>
                              <c:out value="${ product.getColor() }" />
                                    </div>
                                </div>
                                <div class="col-lg-4 col-md-4 col-12">
                                    <div class="form-group quantity">
                                        <label for="color">Quantity</label>
                   <i class="bi bi-plus-circle"></i> 1 <i class="bi bi-dash-circle"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="bottom-content">
                                <div class="row align-items-end">
                                    <div class="col-lg-6 col-md-6 col-12">
                                        <div class="button cart-button">
                                            <a href="#" class="btn btn-primary"><i class="bi bi-cart-plus"></i></a>
                                            <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#exampleModal">
  Me prevenir
</button>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="wish-button">
                            
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-4 col-12">
                                        <div class="wish-button">
                                   
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="product-details-info">
                <div class="single-block">
                    <div class="row">
                        <div class="col-lg-6 col-12">
                            <div class="info-body custom-responsive-margin">
     
                                <ul class="features">
                                    <li><strong>Size:</strong><c:out value="${ product.getSize() }" /></li>
                                    <li><strong>Weihgt:</strong><c:out value="${ product.getWeight() }" /></li>

                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-6 col-12">
                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

   
	</main>
