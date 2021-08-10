import firebase from "firebase";
import "firebase/auth";


const firebaseApp = firebase.initializeApp({
    apiKey: "AIzaSyC5mjkiajNrj2-Juu8PO2G4kdK_5fyTbr0",
    authDomain: "db-grads-2021---group-24.firebaseapp.com",
    projectId: "db-grads-2021---group-24",
    storageBucket: "db-grads-2021---group-24.appspot.com",
    messagingSenderId: "904093273130",
    appId: "1:904093273130:web:0db617b68c448d07718753"
});

const auth = firebaseApp.auth();
const db = firebaseApp.firestore();

export { auth }
export default db;