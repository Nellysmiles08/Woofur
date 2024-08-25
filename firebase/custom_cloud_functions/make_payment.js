const functions = require("firebase-functions");
const admin = require("firebase-admin");

const stripe = require("stripe")(
  "sk_test_51PCm8N02xOhf3tOd7zGKPCyLScnm5CY3hznmmlOjRg3TbF7amUByOmhxNzq75OuloA3QoYpR51nJgKrpQVjD5dJm00VVCgZFIW",
);
const db = admin.firestore();
const userRef = db.collection("users");

exports.makePayment = functions.https.onCall(async (data, context) => {
  console.log({ data: data });
  const { userId, timeout, connectedAccountId, reservationId } = data;

  const reservationRef = userRef
    .doc(userId)
    .collection("reservations")
    .doc(reservationId);

  const reservationData = await reservationRef.get();
  console.log(reservationData.data());

  const amount = +reservationData.data().reservationPrice / 2;

  async function transact(amount, connectedAccountId) {
    try {
      const transfer = await stripe.transfers.create({
        amount: amount,
        currency: "usd",
        destination: connectedAccountId,
      });
      return transfer;
    } catch (err) {
      console.log({ transferError: err });
      throw new Error(err);
    }
  }

  async function updateReservation() {
    try {
      await reservationRef.update({ pay_connected_account: true });
    } catch (err) {
      console.log({ updateReservationError: err });
      throw new Error(err);
    }
  }

  console.log({ amount });
  function runTask() {
    setTimeout(async () => {
      const { status } = await reservationRef.get();
      if (status === "completed") {
        const trxn = transact(amount, connectedAccountId);
        if (trxn.id) updateReservation();
      }
    }, timeout);
  }

  runTask();
});
