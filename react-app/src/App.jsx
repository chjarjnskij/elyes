//import { FirebaseAuthProvider } from "@react-firebase/auth";
import "firebase/auth";
import React from "react";
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import Login from "./components/Login/Login";


const config = {
  apiKey: "AIzaSyC5mjkiajNrj2-Juu8PO2G4kdK_5fyTbr0",
  authDomain: "db-grads-2021---group-24.firebaseapp.com",
  projectId: "db-grads-2021---group-24",
  storageBucket: "db-grads-2021---group-24.appspot.com",
  messagingSenderId: "904093273130",
  appId: "1:904093273130:web:0db617b68c448d07718753"
};

const App = () => {
  return (
    <Router>
      <Switch>
        <Route path="/">
          <Login />
        </Route>
      </Switch>
    </Router>
  );
};

export default App;
