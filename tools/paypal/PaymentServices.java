package paypal;

import java.util.*;

import com.paypal.api.payments.*;
import com.paypal.base.rest.*;

import beans.OrderDetail;

public class PaymentServices {
	private static final String CLIENT_ID = "Ab7A9S527X2ECRtxRKnhB_ITzEykRNtfmnqGJ1lJMeCncNZT6xJAByZ9crsk4J3POxlRNKxA4S9fP68b";
    private static final String CLIENT_SECRET = "EPo36cooS8U0kIdUmbqlL7n1rHoBOPZ9iL2LztDmGkVZOJIV241e_GoB-4p5Ws0k0fDRfJ8D66SFPlGU";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(OrderDetail orderDetail)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation();
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
     
    
    private Payer getPayerInformation() {
        Payer payer = new Payer();
        payer.setPaymentMethod("paypal");
         
        PayerInfo payerInfo = new PayerInfo();
       /* payerInfo.setFirstName("William")
                 .setLastName("Peterson")
                 .setEmail("william.peterson@company.com");*/
        
        payerInfo.setFirstName("SEGARD")
        .setLastName("Marc")
        .setEmail("sb-43uh8224942914@personal.example.com");
         
        payer.setPayerInfo(payerInfo);
         
        return payer;
    }
     
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
        redirectUrls.setCancelUrl("http://localhost:8080/Afpazon/");
        redirectUrls.setReturnUrl("http://localhost:8080/Afpazon/review_payment");
         
        return redirectUrls;
    }
     
    private List<Transaction> getTransactionInformation(OrderDetail orderDetail) {
    	Details details = new Details();
        details.setShipping(orderDetail.getShipping().replace(",", "."));
        details.setSubtotal(orderDetail.getSubtotal().replace(",", "."));
        details.setTax(orderDetail.getTax().replace(",", "."));
     
        Amount amount = new Amount();
        amount.setCurrency("USD");
        amount.setTotal(orderDetail.getTotal().replace(",", "."));
        amount.setDetails(details);
     
        Transaction transaction = new Transaction();
        transaction.setAmount(amount);
        transaction.setDescription(orderDetail.getProductName());
         
        ItemList itemList = new ItemList();
        List<Item> items = new ArrayList<>();
         
        Item item = new Item();
        item.setCurrency("USD");
        item.setName(orderDetail.getProductName());
        item.setPrice(orderDetail.getSubtotal().replace(",", "."));
        item.setTax(orderDetail.getTax().replace(",", "."));
        item.setQuantity("1");
         
        items.add(item);
        itemList.setItems(items);
        transaction.setItemList(itemList);
     
        List<Transaction> listTransaction = new ArrayList<>();
        listTransaction.add(transaction);  
         
        return listTransaction;
    }
     
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
        String approvalLink = null;
         
        for (Links link : links) {
            if (link.getRel().equalsIgnoreCase("approval_url")) {
                approvalLink = link.getHref();
                break;
            }
        }      
         
        return approvalLink;
    }
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
        return Payment.get(apiContext, paymentId);
    }
    
    public Payment executePayment(String paymentId, String payerId)
            throws PayPalRESTException {
        PaymentExecution paymentExecution = new PaymentExecution();
        paymentExecution.setPayerId(payerId);
     
        Payment payment = new Payment().setId(paymentId);
     
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
     
        return payment.execute(apiContext, paymentExecution);
    }
}
