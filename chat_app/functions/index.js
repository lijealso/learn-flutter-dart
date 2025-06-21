const { initializeApp } = require("firebase-admin/app");
const { getMessaging } = require("firebase-admin/messaging");
const { onDocumentCreated } = require("firebase-functions/firestore");

initializeApp();

exports.dispatchMessage = onDocumentCreated("chat/{messageId}", (event) => {
    const snapshot = event.data;
    const data = snapshot.data();
    const message = getMessaging();
    message.send({
        topic: "chat",
        notification: {
            title: data["username"],
            body: data["text"],
        },
        data: {
            click_action: "FLUTTER_NOTIFICATION_CLICK",
        },
    });
});