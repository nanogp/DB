//TODO: Add SDKs for Firebase products that you want to use
//https://firebase.google.com/docs/web/setup#config-web-app
// Your web app's Firebase configuration
var firebaseConfig = {
    apiKey: "AIzaSyCXsgXcjapJuK635vViUER70pS5dsc1Fm4",
    authDomain: "mi-primer-chat-13b7c.firebaseapp.com",
    databaseURL: "https://mi-primer-chat-13b7c.firebaseio.com",
    projectId: "mi-primer-chat-13b7c",
    storageBucket: "",
    messagingSenderId: "590035331646",
    appId: "1:590035331646:web:d4ec21f267b4868f"
};
// Initialize Firebase

firebase.initializeApp(firebaseConfig);

/*
https://firebase.google.com/docs/firestore/quickstart?authuser=0
*/
var db = firebase.firestore();
