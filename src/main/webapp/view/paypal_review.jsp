<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<script defer type="text/javascript" src="./assets/js/cart.js"></script>
<script type="text/javascript" src="./assets/jQuery/jquery-3.6.2.min.js"></script>
<div align="center">
    <h1>Please Review Before Paying</h1>
    <a href="javascript:window.print()" class="btn btn-light"><button>Print <i class="bi bi-printer-fill"></i> </button></a>
    <form action="execute_payment" method="post">
    <div class="container">
    

    <table class="table">
        <tr>
            <td colspan="2"><b>Transaction Details:</b></td>
            <td>
                <input type="hidden" name="paymentId" value="${param.paymentId}" />
                <input type="hidden" name="PayerID" value="${param.PayerID}" />
            </td>
        </tr>
        <tr>
            <td>Description:</td>
            <td>${transaction.description}</td>
        </tr>
        <tr>
            <td>Subtotal:</td>
            <td>${transaction.amount.details.subtotal} EUR</td>
        </tr>
        <tr>
            <td>Shipping:</td>
            <td>${transaction.amount.details.shipping} EUR</td>
        </tr>
        <tr>
            <td>Tax:</td>
            <td>${transaction.amount.details.tax} EUR</td>
        </tr>
        <tr>
            <td>Total:</td>
            <td>${transaction.amount.total} EUR</td>
        </tr>
        <tr><td><br/></td></tr>
        <tr>
            <td colspan="2"><b>Payer Information:</b></td>
        </tr>
        <tr>
            <td>First Name:</td>
            <td>${payer.firstName}</td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td>${payer.lastName}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>${payer.email}</td>
        </tr>
        <tr><td><br/></td></tr>
        <tr>
            <td colspan="2"><b>Shipping Address:</b></td>
        </tr>
        <tr>
            <td>Recipient Name:</td>
            <td>${shippingAddress.recipientName}</td>
        </tr>
        <tr>
            <td>Line 1:</td>
            <td>${shippingAddress.line1}</td>
        </tr>
        <tr>
            <td>City:</td>
            <td>${shippingAddress.city}</td>
        </tr>
        <tr>
            <td>State:</td>
            <td>${shippingAddress.state}</td>
        </tr>
        <tr>
            <td>Country Code:</td>
            <td>${shippingAddress.countryCode}</td>
        </tr>
        <tr>
            <td>Postal Code:</td>
            <td>${shippingAddress.postalCode}</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" value="Pay Now" />
            </td>
        </tr>    
    </table>
    </form>
</div>
</div>