const admin = require("firebase-admin/app");
admin.initializeApp();

const makePayment = require("./make_payment.js");
exports.makePayment = makePayment.makePayment;
