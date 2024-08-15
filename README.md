# SADAD PoC using Flutter

This is a PoC project for the SADAD Portal that uses Flutter as a front-end, and ServerPod, Dart as a backend along with Firebase, and Firestore.


## Initial Attempt
The initial attempt was using Flutter application directly connected to the Firebase and Firestore. This attempt was to build a framework on to which further whole application needs to be developed. 
This initial attempt is considered as a failed attempt as Flutter does not support dart:mirror library and the building of Portal like framework did not proceeded further.

## Second Attempt
The second attempt will be doing the same building a Portal like framework but with ServerPod in the middle. 

Flutter Application will talk to the ServerPod application server, and the ServerPod application server will talk to the backend databases Firestore and Firebase, or PostgreSQL database.
