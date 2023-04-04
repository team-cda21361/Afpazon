		<c:if test="${(empty currentUser) || (currentUser.role.role == 'Client')}">
			<footer class="footer text-light bg-dark pt-4 pb-4">
				<div class="container text-white-50">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-12">
                            <div class="single-footer f-contact">
                                <h3>Contactez nous !</h3>
                                <p class="phone">T�l�phone : <a href="tel:0123456789" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">01 23 45 67 89</a></p>
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
                                    <li><a href="" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">A propos</a></li>
                                    <li><a href="cgv" class="link-light link-offset-2 link-underline-opacity-25 link-underline-opacity-100-hover">Conditions G�n�rales de Vente</a></li>
                                </ul>
                            </div>
                        </div>
						<div class="col-md-6 col-12 text-center">
							<div>
								<h3>Afpazon <em class="fs-6">by SPEAR</em></h3>
								<p>Afpazon est une entreprise de commerce en ligne fran�aise
									bas�e � Paris. Elle est l'un des g�ants du Web. Cr��e par le
									groupe SPEAR en Mars 2022, son si�ge social est situ� rue
									Politzer � Paris. La Soci�t� Afpazon est sp�cialis�e dans la
									vente de produits avec une philosophie tr�s simple : tout vendre !</p>
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
										<span>Partenaire de paiment </span> <img src="assets/images/footer/credit-cards-footer.png" alt="#">
									</div>
								</div>
								<div class="col-lg-4 col-12 text-center">
									<div class="copyright">
										<p>
											&#169; 2023 SPEAR. Tous droits r�serv�s.
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