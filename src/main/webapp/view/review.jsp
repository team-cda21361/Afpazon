<script type="text/javascript" src="./assets/js/review.js"></script>

<c:if test="${not empty message}">
	<c:choose>
		<c:when test="${fn:contains(message, 'Erreur')}">
			<div class="sticky-top messageToUser errorMessage">
				<c:out value="${message}"/>
			</div>
		</c:when>
		<c:otherwise>
			<div class="sticky-top messageToUser">
				<c:out value="${message}"/>
			</div>
		</c:otherwise>
	</c:choose>
</c:if>

<section class="container-account my-5">
	<h1 class="text-center"><i class="bi bi-star-half"></i> Laisser un avis</h1>
	ID produit : <c:out value="${selectedProduct.id}"></c:out>
</section>