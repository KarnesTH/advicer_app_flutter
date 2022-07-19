import 'package:advicer/domain/entities/advice_entity.dart';

class AdvicerUsecases {
  Future sleep1() {
    return Future.delayed(const Duration(seconds: 2), () => "1");
  }

  Future<AdviceEntity> getAtviceUsecase() async {
    // call function from reposentory to get advice

    // Buisness logic implementieren z.B. Rechnung etc.

    await sleep1();

    return AdviceEntity(advice: "Example", id: 1);
  }
}
