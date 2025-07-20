import 'package:e_commerce_project/model/onboarding/onboarding_model.dart';

class OnboardingViewModel {
  List<OnboardingModel> get onboardingItems => [
        OnboardingModel(
          title: "Binlerce Ürün Elinizin Altında",
          desc:
              "Elektronikten modaya, aradığınız her şeyi tek bir uygulamada bulabilirsiniz.",
          image: "assets/images/image.png",
        ),
        OnboardingModel(
          title: "Güvenli ve Kolay Alışveriş",
          desc:
              "Güvenli ödeme seçenekleri ve hızlı sipariş takibi ile alışveriş artık çok kolay.",
          image: "assets/images/image2.png",
        ),
        OnboardingModel(
          title: "Özel İndirimleri Kaçırmayın",
          desc:
              "Size özel kampanyalar ve bildirimlerle her zaman avantajlı alışveriş yapın.",
          image: "assets/images/image1.png",
        ),
      ];
}
