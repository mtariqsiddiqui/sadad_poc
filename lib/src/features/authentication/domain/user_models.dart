class AuthenticatedUser {
  final String? uid;
  final String? email;
  String? displayName;
  AuthenticatedUser({this.uid, this.email});
  AuthenticatedUser.withDisplayName({this.uid, this.email, this.displayName});
}

class AuthorizedUser {
  final String? uid;
  final String? role;
  AuthorizedUser({this.uid, this.role});
}