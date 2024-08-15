import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sadad_poc/src/core/authorization/domain/page.dart';
import 'package:sadad_poc/src/features/authentication/data/firebase_auth_repository.dart';

part 'authorization_repository.g.dart';

class AuthorizationRepository {
  final FirebaseFirestore _firebaseFirestore;
  static const String _pageCollection = 'pages';
  AuthorizationRepository(this._firebaseFirestore);

  // read
  // Stream<Page> watchJob({required UserID uid, required JobID jobId}) => _firestore
  //     .doc(jobPath(uid, jobId))
  //     .withConverter<Job>(
  //   fromFirestore: (snapshot, _) => Job.fromMap(snapshot.data()!, snapshot.id),
  //   toFirestore: (job, _) => job.toMap(),
  // )
  //     .snapshots()
  //     .map((snapshot) => snapshot.data()!);

  // Working function
  Stream<List<Page>> watchPages() => queryPages().snapshots().map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());

  // Query Jobs from Firestore
  Query<Page> queryPages() => _firebaseFirestore.collection(_pageCollection).withConverter(
        fromFirestore: (snapshot, _) => Page.fromMap(snapshot.data()!, snapshot.id!),
        toFirestore: (page, _) => page.toMap(),
      );
}

@Riverpod(keepAlive: true)
AuthorizationRepository authorizationRepository(AuthorizationRepositoryRef ref) {
  return AuthorizationRepository(FirebaseFirestore.instance);
}

