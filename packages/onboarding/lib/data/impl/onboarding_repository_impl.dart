import 'package:core/network/dto/response_model.dart';
import 'package:onboarding/data/repository/onboarding_repository.dart';
import 'package:onboarding/data/source/onboarding_remote_data_source.dart';

class OnboardingRepositoryImpl implements OnboardingRepository {
  final OnboardingRemoteDataSource remote;

  OnboardingRepositoryImpl(this.remote);

  @override
  Future<ResponseModel> me() {
    return remote.me();
  }
}
