		<c:if test="${(empty currentUser) || (currentUser.role.role == 'Client')}">
			<footer class="footer text-light bg-dark pt-4 pb-4">
				<div class="container text-white-50">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-12">
                            <div class="single-footer f-contact">
                                <h3>Contactez nous !</h3>
                                <p class="phone">Tï¿½lï¿½phone : <a href="tel:0123456789" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">01 23 45 67 89</a></p>
                                <ul>
                                    <li><span>Lundi-Vendredi : </span> 09:00 - 20:00</li>
                                    <li><span>Samedi : </span> 10:00 - 18:00</li>
                                </ul>
                                <p class="mail">
                                    <a href="mailto:contact@afpazon.fr" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">contact@afpazon.fr</a>
                                </p>
                            </div>
                        </div>
						<div class="col-lg-3 col-md-6 col-12">
                            <div class="d-flex flex-column">
                                <h3>Information</h3>
                                <ul class="list-unstyled">

  
                                    <li><a href="about" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">A propos</a></li>
                                    <li><a href="cgv" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Conditions Générales de Vente</a></li>

                                </ul>
                            </div>
                        </div>
						<div class="col-md-6 col-12 text-center">
							<div>
								<h3>Afpazon <em class="fs-6">by SPEAR</em></h3>
								<p>Afpazon est une entreprise de commerce en ligne franï¿½aise
									basï¿½e ï¿½ Paris. Elle est l'un des gï¿½ants du Web. Crï¿½ï¿½e par le
									groupe SPEAR en Mars 2022, son siï¿½ge social est situï¿½ rue
									Politzer ï¿½ Paris. La Sociï¿½tï¿½ Afpazon est spï¿½cialisï¿½e dans la
									vente de produits avec une philosophie trï¿½s simple : tout vendre !</p>
							</div>
						</div>
					</div>
				</div>
				<div class="footer-bottom">
					<div class="container">
						<div class="inner-content">
							<div class="row align-middle">
								<div class="col-lg-4 col-12">
									<div class="payment-gateway">
										<span>Partenaire de paiment </span> <img src="assets/images/credit-cards-footer.png" alt="logoPaypal">
									</div>
								</div>
								<div class="col-lg-4 col-12 text-center">
									<div class="copyright">
										<p>
											&#169; 2023 SPEAR. Tous droits rï¿½servï¿½s.
										</p>
									</div>
								</div>
								<div class="col-lg-4 col-12 text-end">
									Suivez-nous sur : </span><a href="javascript:void(0)" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover"><i class="bi bi-facebook"></i></a></li>
								</div>
							</div>
						</div>
					</div>
				</div>
			</footer>
		</c:if>
	</body>
</html>
