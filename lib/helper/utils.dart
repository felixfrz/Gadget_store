import 'package:course_store/helper/appcolors.dart';
import 'package:course_store/helper/iconhelper.dart';
import 'package:course_store/models/category.dart';
import 'package:course_store/models/categorypart.dart';
import 'package:course_store/models/onboardingcontent.dart';
import 'package:course_store/models/subcategory.dart';

class Utils {
  static List<OnboardingContent> getOnboarding() {
    return [
      OnboardingContent(
          message: 'Good products,\n from our Store to your home',
          img: 'onboard1'),
      OnboardingContent(
          message: 'Latest SmartPhones,\n Tvs, Cameras\n, Laptops',
          img: 'onboard2'),
      OnboardingContent(
          message: 'Acquire them from\n the comfort of\n your mobile device',
          img: 'onboard4'),
      OnboardingContent(message: 'Fast and\n Reliable', img: 'onboard3'),
    ];
  }

  static List<Category> getMockedCategories() {
    return [
      Category(
        color: AppColors.LAPTOPS,
        name: 'Laptop',
        imgName: 'cat1',
        icon: IconFontHelper.LAPTOP,
        subCategories: [
          SubCategory(
              name: 'HP',
              imgName: 'hp',
              icon: IconFontHelper.LAPTOP,
              color: AppColors.LAPTOPS,
              parts: [
                CategoryPart(
                    name: 'Hp laptop', imgName: 'hp', isSelected: false),
                CategoryPart(
                    name: 'Battery', imgName: 'hp_battery', isSelected: false),
                CategoryPart(name: 'Ram', imgName: 'hp_ram', isSelected: false),
                CategoryPart(
                    name: 'Screen', imgName: 'hp_screen', isSelected: false),
                CategoryPart(
                    name: 'Keyboard',
                    imgName: 'hp_keyboard',
                    isSelected: false),
                CategoryPart(
                    name: 'Charger', imgName: 'hp_charger', isSelected: false),
              ]),
          SubCategory(
              name: 'Mac Book',
              imgName: 'mac',
              icon: IconFontHelper.LAPTOP,
              color: AppColors.LAPTOPS,
              parts: []),
          SubCategory(
              name: 'Lenovo',
              imgName: 'lenovo',
              icon: IconFontHelper.LAPTOP,
              color: AppColors.LAPTOPS,
              parts: []),
          SubCategory(
              name: 'Asus',
              imgName: 'asus',
              icon: IconFontHelper.LAPTOP,
              color: AppColors.LAPTOPS,
              parts: []),
          SubCategory(
              name: 'Samsung',
              imgName: 'samsung',
              icon: IconFontHelper.LAPTOP,
              color: AppColors.LAPTOPS,
              parts: []),
          SubCategory(
              name: 'Dell',
              imgName: 'dell',
              icon: IconFontHelper.LAPTOP,
              color: AppColors.LAPTOPS,
              parts: []),
        ],
      ),
      Category(
        color: AppColors.PHONES,
        name: 'Phone',
        imgName: 'cat2',
        icon: IconFontHelper.PHONE,
        subCategories: [],
      ),
      Category(
        color: AppColors.TVS,
        name: 'TV',
        imgName: 'cat3',
        icon: IconFontHelper.TV,
        subCategories: [],
      ),
      Category(
        color: AppColors.POWER_BANKS,
        name: 'Power Bank',
        imgName: 'cat4',
        icon: IconFontHelper.POWER_BANK,
        subCategories: [],
      ),
      Category(
        color: AppColors.LAPTOPS,
        name: 'Laptop',
        imgName: 'cat1',
        icon: IconFontHelper.LAPTOP,
        subCategories: [],
      ),
      Category(
        color: AppColors.PHONES,
        name: 'Phone',
        imgName: 'cat2',
        icon: IconFontHelper.PHONE,
        subCategories: [],
      ),
      Category(
        color: AppColors.TVS,
        name: 'TV',
        imgName: 'cat3',
        icon: IconFontHelper.TV,
        subCategories: [],
      ),
      Category(
        color: AppColors.POWER_BANKS,
        name: 'Power Bank',
        imgName: 'cat4',
        icon: IconFontHelper.POWER_BANK,
        subCategories: [],
      ),
    ];
  }
}
