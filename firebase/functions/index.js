const functions = require("firebase-functions");
const admin = require("firebase-admin");
admin.initializeApp();

exports.onUserDeleted = functions.auth.user().onDelete(async (user) => {
  let firestore = admin.firestore();
  let userRef = firestore.doc("userCollection/" + user.uid);
  await firestore
    .collection("budgetListCollection")
    .where("userForeignKEY", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(
          `Deleting document ${doc.id} from collection budgetListCollection`,
        );
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("profileCollection")
    .where("userForeignKEY", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(
          `Deleting document ${doc.id} from collection profileCollection`,
        );
        await doc.ref.delete();
      }
    });
  await firestore.collection("userCollection").doc(user.uid).delete();
  await firestore
    .collection("folderCreateCollection")
    .where("userForeignKEY", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(
          `Deleting document ${doc.id} from collection folderCreateCollection`,
        );
        await doc.ref.delete();
      }
    });
  await firestore
    .collection("pieChartCollection")
    .where("userForeignKEY", "==", userRef)
    .get()
    .then(async (querySnapshot) => {
      for (var doc of querySnapshot.docs) {
        console.log(
          `Deleting document ${doc.id} from collection pieChartCollection`,
        );
        await doc.ref.delete();
      }
    });
});
