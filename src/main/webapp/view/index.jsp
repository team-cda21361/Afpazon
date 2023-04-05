<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<script defer src="./assets/js/swiper-bundle.min.js"></script>
<script defer src="./assets/js/slider.js"></script>
<!--------------------------------------------------------CAROUSEL #1---------------------------------------------------->
<br>
<h3>Carousel </h3>
<hr>
<section>
	<div class="container">
		<div class="container swiper">
			<div class="slide-container">
				<div class="card-wrapper swiper-wrapper">
				
				
				 <c:forEach items="${ carousel }" var="carousel" varStatus="status">
					<div class="card swiper-slide">
						<div class="image-box">
							<img src="assets/images/product-details/<c:out value="${ carousel.getMainPicPath() }" />" alt="" />
						</div>
						<div class="profile-details d-inline-flex">
							<a href="#" class="btn btn-primary"><i class="bi bi-cart-plus"></i></a>
							<a href="product?id=<c:out value="${ carousel.getId() }" />" class="btn btn-success" title="Plus Info"><i class="bi bi-plus-circle"></i></a>
							<div class="name-job">
								<h3 class="name"><c:out value="${ carousel.getName() }" /></h3>
								<h4 class="job"><strong>Prix: </strong> <c:out value="${ carousel.getPrice() }" /> &euro; </h4>
							</div>
						</div>
					</div>
				</c:forEach>
					
				</div>
			</div>
			<div class="swiper-button-next swiper-navBtn"></div>
			<div class="swiper-button-prev swiper-navBtn"></div>
			<div class="swiper-pagination"></div>
		</div>
	</div>
</section>
<br>
<br>
<!-- ---------------------------------------------------End CAROURSEL -------------------------->
