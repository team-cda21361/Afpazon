<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<script defer type="text/javascript" src="./assets/js/validation.js"></script>
<script type="text/javascript" src="./assets/jQuery/jquery-3.6.2.min.js"></script>
<br>
<section>

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

	<div class="row ">
		<div
			class="col-lg-6 offset-lg-3 col-md-10 offset-md-1 col-12 shadow p-3 mb-5 bg-body rounded">
			<div class="register-form">

				<h3>Se Connecter</h3>
				<hr>
				<div class="row">
					<div class="mb-3 w-50">
						<img src="assets/images/login.jpg" class="imgv">
					</div>
					<div class="mb-3 w-50">
					
						<form method="post" onsubmit="checkformML(event)" action="login" name="formML">
							<div class="mb-3">
								<label class="form-label">*Email</label> <input type="text"
									class="form-control form-controlV" placeholder="Email" id="email" name="email">
								<p class="erroremail error"></p>
							</div>

							<div class="mb-3 lab1">
								<label class="form-label">*Password</label> <input
									type="password" class="form-control form-controlV" placeholder="Password"	id="password" name="password">
								<p class="errorpassword error"></p>
								
							</div>


							<button type="submit" class="btn btn-primary envformL">Se connecter</button>


						</form>

					</div>

				</div>



			</div>
		</div>
	</div>
</section>