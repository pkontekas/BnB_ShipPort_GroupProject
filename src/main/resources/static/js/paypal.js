/* global paypal */

$(document).ready(function () {
    document.querySelectorAll('.paypal-button-container').forEach(function (selector) {

        paypal.Buttons({
            style: {
                layout: 'horizontal',
                color: 'gold',
                shape: 'pill',
                label: 'paypal',
                size: 'responsive'
            },
            createOrder: function (data, actions) {
                // This function sets up the details of the transaction, including the amount and line item details.
                return actions.order.create({
                    purchase_units: [{
                            amount: {
                                currency: 'EUR',
                                value: selector.getAttribute("data-prices")
                            }
                        }]
                });
            },
            onApprove: function (data, actions) {
                // This function captures the funds from the transaction.
                return actions.order.capture().then(function (details) {
                    let xhttp;
                    // This function shows a transaction success message to your buyer.
                    alert('Transaction completed by ' + details.payer.name.given_name + '!  The Owner will soon contact you!');
                    //TO DO we will call the server to send info that transaction successful
//            xhttp.open("GET", "paypalsuccess", true);
//            xhttp.send();
                });
            }
        }).render(selector);
//This function displays Smart Payment Buttons on your web page.
    });
});
