import 'package:core/network/dto/response_model.dart';
import 'package:onboarding/data/repository/onboarding_repository.dart';

class OnboardingUseCase {
  final OnboardingRepository repository;

  OnboardingUseCase(this.repository);

  Future<ResponseModel> me() async {
    var result = await repository.me();
    return ResponseModel(status: result.status, message: result.message);
  }
}
