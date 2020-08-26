/* global paypal */

paypal.Buttons({
    createOrder: function (data, actions) {
        // This function sets up the details of the transaction, including the amount and line item details.
        return actions.order.create({
            purchase_units: [{
                    amount: {
                        currency: 'EUR',
                        value: getPrice()
                    }
                }]
        });
    },
    onApprove: function (data, actions) {
        // This function captures the funds from the transaction.
        return actions.order.capture().then(function (details) {
            // This function shows a transaction success message to your buyer.
            alert('Transaction completed by ' + details.payer.name.given_name + '!  The Owner should soon contact you!');
        });
    }
}).render('#paypal-button-container');
//This function displays Smart Payment Buttons on your web page.

function getPrice() {
    var pricePerDay = document.getElementById("boatPricePerDay").value;
    return pricePerDay;
}