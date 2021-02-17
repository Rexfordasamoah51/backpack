abstract class FirebaseSetup {
  void addToDatabase();
  void removeFromDatabase();
  Future<void> addUser({String userEmail, String userPassword});
}
