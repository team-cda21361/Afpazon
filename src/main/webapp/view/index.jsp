<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" %>
<script defer src="./assets/js/swiper-bundle.min.js"></script>
<script defer src="./assets/js/slider.js"></script>
<style>
	hr {
		border: none !important;
		margin: 30px 0 30px !important;
		height: 10px;
		background: linear-gradient(90deg, rgba(255,255,255,0) 0%, rgba(255,255,255,0) 25%, rgba(255, 153, 0, 1) 50%, rgba(255,255,255,0) 75%, rgba(255,255,255,0) 100%);
	}
</style>

			
		<div class="container">
			<div class="row justify-content-around">
				<div class="col-lg-8 col-md-6 col-12">
					<div class="nav-inner">
						<nav class="navbar navbar-expand-lg">
							<button class="navbar-toggler mobile-menu-btn" type="button" data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
								aria-expanded="false" aria-label="Toggle navigation">
								<span class="toggler-icon"></span> <span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse sub-menu-bar" id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav mx-auto">
									<li class="nav-item"><a href="#discountcar" class="nav-link"
											aria-label="Toggle navigation">Promotions</a></li>
									<li class="nav-item"><a href="#newness" class="nav-link"
											aria-label="Toggle navigation">Nouveautés</a></li>
									<li class="nav-item"><a href="#contact" class="nav-link"
											aria-label="Toggle navigation">Contactez-nous</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
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
		<h3 id="discountcar" class="text-center mb-3">Les promos du moment</h3>
		<c:import url="/carrousel/newProdSponsoredCarousel.jsp"></c:import> 
		<hr>
		<h3 id="newness" class="text-center mb-3">Nos nouveautés</h3>
    	<c:import url="/carrousel/newProductCarousel.jsp"></c:import>  			
		<hr>
		<h3 class="text-center mb-3">Sponsorisés</h3>
		<c:import url="/carrousel/newProductSponsortCarousel.jsp"></c:import> 	
		<hr>
		<section id="section4">
			<div class="container">
				<h2 class="text-center mb-4">Témoignages de nos clients</h2>
				<div class="row">
					<div class="col-md-6 col-lg-4">
						<div class="card mb-4">
							<div class="card-header bg-white text-center">
								<i class="bi bi-chat-right-quote-fill text-muted fs-2"></i>
							</div>
							<div class="card-body">
								<p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Sed euismod rhoncus tellus nec varius. Duis a eros quis sapien iaculis
									accumsan. In malesuada vulputate quam, quis finibus turpis maximus eget."
								</p>
								<p class="card-text text-end"><small class="text-muted">- John Doe</small></p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4">
						<div class="card mb-4">
							<div class="card-header bg-white text-center">
								<i class="bi bi-chat-right-quote-fill text-muted fs-2"></i>
							</div>
							<div class="card-body">
								<p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Sed euismod rhoncus tellus nec varius. Duis a eros quis sapien iaculis
									accumsan. In malesuada vulputate quam, quis finibus turpis maximus eget."
								</p>
								<p class="card-text text-end"><small class="text-muted">- Jane Doe</small></p>
							</div>
						</div>
					</div>
					<div class="col-md-6 col-lg-4">
						<div class="card mb-4">
							<div class="card-header bg-white text-center">
								<i class="bi bi-chat-right-quote-fill text-muted fs-2"></i>
							</div>
							<div class="card-body">
								<p class="card-text">"Lorem ipsum dolor sit amet, consectetur adipiscing elit.
									Sed euismod rhoncus tellus nec varius. Duis a eros quis sapien iaculis
									accumsan. In malesuada vulputate quam, quis finibus turpis maximus eget."
								</p>
								<p class="card-text text-end"><small class="text-muted">- Bob Smith</small></p>
							</div>
						</div>
					</div>
				</div>
				<div id="contact" class="text-center">
					<a href="#" class="btn btn-lg btn-primary">Voir plus de témoignages</a>
				</div>
			</div>
		</section>
		<!-- The Modal -->
		<div id="myModal" class="modal">
			<span class="close">&times;</span>
			<img class="modal-content" id="img01">
			<div id="caption"></div>
		</div>
				