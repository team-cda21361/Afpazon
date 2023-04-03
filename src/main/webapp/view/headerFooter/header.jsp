<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">

<head>
<meta charset="utf-8" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>AfpaZon.</title>
<meta name="description" content="" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="shortcut icon" type="image/x-icon" href="assets/images/favicon.svg" />

<!-- ========================= CSS Carousel ========================= -->
<link rel="stylesheet" href="assets/carrousel/css/owl.carousel.min.css">
<link rel="stylesheet"
	href="assets/carrousel/css/owl.theme.default.min.carousel.css">
<link rel="stylesheet" href="assets/carrousel/css/style.carousel.css">
<script src="assets/carrousel/js/jquery.min.carousel.js"></script>
<script src="assets/carrousel/js/bootstrap.min.js"></script>
<script src="assets/carrousel/js/popper.carousel.js"></script>

<!-- ========================= CSS here ========================= -->
<link rel="stylesheet" href="./assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="./assets/css/LineIcons.3.0.css" />
<link rel="stylesheet" href="./assets/css/tiny-slider.css" />
<link rel="stylesheet" href="./assets/css/glightbox.min.css" />
<link rel="stylesheet" href="./assets/css/main.css" />
<link rel="stylesheet" href="./assets/css/backOffice.css" />
<link rel="stylesheet" href="./assets/css/datatables.min.css" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.3/font/bootstrap-icons.css">
<script defer src="assets/js/bootstrap.min.js"></script>
<script defer src="assets/js/tiny-slider.js"></script>
<script defer src="assets/js/glightbox.min.js"></script>
<script type="text/javascript" src="./assets/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="./assets/js/datatables.min.js"></script>
<script defer src="assets/js/main.js"></script>
</head>

<body>
<c:if test="${currentUser.role.role == 'Client' }">
	<!--[if lte IE 9]>
      <p class="browserupgrade">
        You are using an <strong>outdated</strong> browser. Please
        <a href="https://browsehappy.com/">upgrade your browser</a> to improve
        your experience and security.
      </p>
    <![endif]-->

	<!-- Preloader -->
	<div class="preloader">
		<div class="preloader-inner">
			<div class="preloader-icon">
				<span></span> <span></span>
			</div>
		</div>
	</div>
	<!-- /End Preloader -->
	<!-- Start Header Area -->
	<header class="header navbar-area">
		<!-- Start Topbar -->
		<div class="topbar">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-lg-4 col-md-4 col-12">
						<div class="top-middle">
							<span>
								<h3
									style="display: inline-block; margin-right: 5px; color: #d29bd6;">Chez</h3>
							</span>
							<!-- Start Header Logo -->
							<a class="navbar-brand" href="index.html"> <img
								src="assets/images/logo/Amazon version_blc_logo.svg.png"
								alt="Logo" style="float: left;">
							</a>
							<!-- End Header Logo -->
							<span style="margin-left: 5px;"></span>
						</div>
					</div>

					<div class="col-lg-4 col-md-4 col-12">
						<!-- Start Main Menu Search -->
						<div class="main-menu-search">
							<!-- navbar search start -->
							<div class="navbar-search search-style-5">
								<div class="search-select">
									<div class="select-position">
										<select id="select1"
											style="background-color: #fff; color: #333;">
											<option selected>Categories</option>
											<option value="1">option 01</option>
											<option value="2">option 02</option>
											<option value="3">option 03</option>
											<option value="4">option 04</option>
											<option value="5">option 05</option>
										</select>
									</div>
								</div>
								<div class="search-input">
									<input type="text" placeholder="Recherche">
								</div>
								<div class="search-btn">
									<button>
										<i class="lni lni-search-alt"></i>
									</button>
								</div>
							</div>
							<!-- navbar search Ends -->
						</div>
						<!-- End Main Menu Search -->
					</div>
					<div class="col-lg-4 col-md-4 col-12">
						<div class="top-end">
							<div class="user">
								<i class="lni lni-user"></i> Bonjour
							</div>
							<ul class="user-login">
								<li><a href="login.html">S'inscrire</a></li>
								<li><a href="register.html">Se Connecter</a></li>
							</ul>
						</div>
						<div class="middle-right-area col-lg-6">
							<div class="nav-hotline"></div>
							<div class="navbar-cart">
								<div class="wishlist"></div>
								<div class="cart-items">
									<a href="javascript:void(0)" class="main-btn"> 
                    <i class="lni lni-cart"></i> <span class="total-items">2</span>
                  </a>
									<!-- Shopping Item -->
									<div class="shopping-item">
										<div class="dropdown-cart-header">
											<span>2 Items</span> <a href="cart">View Cart</a>
										</div>
										<ul class="shopping-list">
											<li><a href="javascript:void(0)" class="remove"
												title="Remove this item"><i class="lni lni-close"></i></a>
												<div class="cart-img-head">
													<a class="cart-img" href="product-details.html"><img
														src="assets/images/header/cart-items/item1.jpg" alt="#"></a>
												</div>
												<div class="content">
													<h4>
														<a href="product-details.html"> Apple Watch Series 6</a>
													</h4>
													<p class="quantity">1x</p>
													<p class="price">$399.99</p>
												</div></li>
											<li><a href="javascript:void(0)" class="remove"
												title="Remove this item"><i class="lni lni-close"></i></a>
												<div class="cart-img-head">
													<a class="cart-img" href="product-details.html"><img
														src="assets/images/header/cart-items/item2.jpg" alt="#"></a>
												</div>
												<div class="content">
													<h4>
														<a href="product-details.html">Beats Solo3 Wireless
															On-Ear Headphones</a>
													</h4>
													<p class="quantity">1x</p>
													<p class="price">$199.95</p>
												</div></li>
										</ul>
										<div class="bottom">
											<div class="total">
												<span>Total</span> <span class="total-amount">$134.00</span>
											</div>
											<div class="button">
												<a href="cart" class="btn animate">Checkout</a>
											</div>
											<a href="checkout.html" class="btn animate">Checkout</a>
										</div>
									</div>
									<!--/ End Shopping Item -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<h2 style="color: #d29bd6;"> on vend tous ici pour
					votre plus grand plaisir !</h2>
			</div>
		</div>
		<!-- End Topbar -->

		<!-- Start Header Bottom -->
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-8 col-md-6 col-12">
					<div class="nav-inner">
						<!-- Start Mega Category Menu -->
						<div class="mega-category-menu">
							<span class="cat-button"><i class="lni lni-menu"></i>>Toutes
								Categories</span>
							<ul class="sub-category">
								<li><a href="product-grids.html">Electronics </a></li>
								<li><a href="product-grids.html">accessories</a></li>
								<li><a href="product-grids.html">Televisions</a></li>
								<li><a href="product-grids.html">sunglass</a></li>
								<li><a href="product-grids.html">watch</a></li>
								<li><a href="product-grids.html">man’s product</a></li>
								<li><a href="product-grids.html">Home Audio & Theater</a></li>
								<li><a href="product-grids.html">Computers & Tablets </a></li>
								<li><a href="product-grids.html">Video Games </a></li>
								<li><a href="product-grids.html">Home Appliances </a></li>
							</ul>
						</div>
						<!-- End Mega Category Menu -->
						<!-- Start Navbar -->
						<nav class="navbar navbar-expand-lg">
							<button class="navbar-toggler mobile-menu-btn" type="button"
								data-bs-toggle="collapse"
								data-bs-target="#navbarSupportedContent"
								aria-controls="navbarSupportedContent" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="toggler-icon"></span> <span class="toggler-icon"></span>
								<span class="toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse sub-menu-bar"
								id="navbarSupportedContent">
								<ul id="nav" class="navbar-nav ms-auto">
									<li class="nav-item"><a href="index.html"
										aria-label="Toggle navigation">Promotions</a></li>
									<li class="nav-item"><a href="index.html"
										aria-label="Toggle navigation">Nouveautés</a></li>
									<li class="nav-item"><a href="contact.html"
										aria-label="Toggle navigation">Contactez nous</a></li>
								</ul>
							</div>
							<!-- navbar collapse -->
						</nav>
						<!-- End Navbar -->
					</div>
				</div>

				<div class="col-lg-4 col-md-6 col-12">
					<!-- Start Nav Social -->
					<div class="nav-social">
						<h5 class="title">Suivez Nous:</h5>
						<ul>
							<li><a href="javascript:void(0)"><i
									class="lni lni-facebook-filled"></i></a></li>
						</ul>
					</div>
					<!-- End Nav Social -->
				</div>

			</div>
		</div>
		<!-- End Header Bottom -->
	</header>
	<!-- End Header Area -->
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Se connecter</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<form method="post" action="register" name="login">
					<div class="modal-body">
						<div class="mb-3 ">
							<label class="form-label">Email</label> <input type="email" class="form-control" placeholder="Email" id="email" name="email">
							<p class="errortitre error"></p>
						</div>
						<div class="mb-3 ">
							<label class="form-label">Password</label> <input type="password" class="form-control" placeholder="Password" id="password" name="password">
							<p class="errorminplayer error"></p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Fermer</button>
						<button type="submit" class="btn btn-primary">Se
							connecter</button>
					</div>
				</form>
			</div>
		</div>
	</div>


	<!-- Modal FIN -->
	
	<!-- Header Backoffice -->
	</c:if>
	<c:if test="${currentUser.role.role == 'Admin' }">
	<!--start Navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="background: #F113DB">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item">
						<a class="nav-link active"
							aria-current="page" href="dashboard">
							<img alt="dashboard image" src="assets/images/back_office/logo.png" width="55">
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">
							<img alt="" src="assets/images/back_office/Catalogue.png" width="60">
						</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="stockManager"> 
							<img alt="" src="assets/images/back_office/Stock.png" width="45">
						</a>
					</li>
				</ul>
				<a class=" d-flex nav-link" href="#"> <img alt=""
					src="assets/images/back_office/logBack.png" width="60">
				</a>
			</div>
		</div>
	</nav>
<!--end Header backoffice -->

	</c:if>
	<c:if test="${currentUser.role.role == 'Admin' }">
	<!--start Navbar -->
	<nav class="navbar navbar-expand-lg bg-body-tertiary"
		style="background: #F113DB">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="dashboard"><img alt="dashboard image"
							src="assets/images/back_office/logo.png" width="55"></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><img
							alt="" src="assets/images/back_office/Catalogue.png" width="60"></a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#"> <img
							alt="" src="assets/images/back_office/Stock.png" width="45">
					</a></li>
				</ul>
				<a class=" d-flex nav-link" href="#"> <img alt=""
					src="assets/images/back_office/logBack.png" width="60">
				</a>
			</div>
		</div>
	</nav>
<!--end Navbar -->
	</c:if>
