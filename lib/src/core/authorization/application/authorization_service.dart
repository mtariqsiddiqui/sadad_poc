import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sadad_poc/src/core/authorization/data/authorization_repository.dart';
import 'package:sadad_poc/src/core/authorization/domain/page.dart';

part 'authorization_service.g.dart';

class AuthorizationService {
  final AuthorizationRepository authorizationRepository;

  AuthorizationService({required this.authorizationRepository});

  Stream<List<Page>> pagesTileModelStream() {
    return authorizationRepository.watchPages();
  }
}

@Riverpod(keepAlive: true)
AuthorizationService authorizationService(AuthorizationServiceRef ref) {
  return AuthorizationService(
    authorizationRepository: ref.watch(authorizationRepositoryProvider)
  );
}

@Riverpod(keepAlive: true)
Stream<List<Page>> pagesTileModelStream(PagesTileModelStreamRef ref) {
  final authorizationService = ref.watch(authorizationServiceProvider);
  return authorizationService.pagesTileModelStream();
}