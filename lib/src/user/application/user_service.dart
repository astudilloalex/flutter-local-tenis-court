import 'package:bcrypt/bcrypt.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tenis_court/app/domain/failure.dart';
import 'package:tenis_court/src/user/domain/i_user_repository.dart';
import 'package:tenis_court/src/user/domain/user.dart';

class UserService {
  const UserService(this._repository);

  final IUserRepository _repository;

  Future<Either<Failure, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final User? user = await _repository.findByEmail(email);
      if (user == null) return const Left(Failure(code: 'user-not-found'));
      if (!user.accountNonExpired) {
        return const Left(Failure(code: 'expired-account'));
      }
      if (!user.accountNonLocked) {
        return const Left(Failure(code: 'locked-account'));
      }
      if (!user.credentialsNonExpired) {
        return const Left(Failure(code: 'expired-credentials'));
      }
      if (!user.enabled) {
        return const Left(Failure(code: 'disabled-user'));
      }
      if (!BCrypt.checkpw(password, user.password)) {
        return const Left(Failure(code: 'invalid-password'));
      }
      return Right(user);
    } catch (e) {
      return Left(Failure(code: 'catch-error', message: e.toString()));
    }
  }

  Future<Either<Failure, User>> create(User user) async {
    try {
      final User savedUser = await _repository.save(user);
      if (savedUser.id <= 0) {
        return const Left(Failure(code: 'error-saving'));
      }
      return Right(savedUser);
    } catch (e) {
      return Left(Failure(code: 'catch-error', message: e.toString()));
    }
  }
}
