import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:watfa/features/auth/login/logic/cubit/login_cubit.dart';
import 'package:watfa/features/auth/password_updated/presentation/password_updated_screen.dart';
import 'package:watfa/features/bank_account/presentation/screen/bank_account_screen.dart';
import 'package:watfa/features/category/presentation/screen/category_screen.dart';
import 'package:watfa/features/common/main_screen.dart';
import 'package:watfa/features/notifications/presentation/screen/notifications_screen.dart';
import 'package:watfa/features/payment/presentation/screen/payment_screen.dart';
import 'package:watfa/features/saved_items/presentation/screens/saved_items_screen.dart';
import '../../features/add_new_card/presentation/screen/add_new_card_screen.dart';
import '../../features/auth/forget_password/presentation/screen/forget_password_screen.dart';
import '../../features/auth/get_started/presentation/screen/get_started_screen.dart';
import '../../features/auth/login/presentation/screen/login_screen.dart';
import '../../features/auth/reset_password/presentation/screen/reset_password_screen.dart';
import '../../features/auth/sign_up_buyer/logic/cubit/sign_up_buyer_cubit.dart';
import '../../features/auth/sign_up_buyer/presentation/screen/sign_up_buyer_screen.dart';
import '../../features/auth/verify/presentation/screens/verify_screen.dart';
import '../../features/home/presentation/screen/home_screen.dart';
import '../../features/onboarding/logic/on_boarding_data.dart';
import '../../features/onboarding/presentation/screen/on_boarding_screen.dart';
import '../../features/payment_home/presentation/screen/payment_home_screen.dart';
import '../../features/profile/presentation/screen/profile_screen.dart';
import '../../features/purchases/presentation/screen/purchases_screen.dart';
import '../../features/select_plan/presentation/screen/select_plan_screen.dart';
import '../../features/settings/presentation/screen/settings_screen.dart';
import '../../features/shipping_address/presentation/screen/shipping_address_screen.dart';
import '../../features/wallet/presentation/screen/wallet_screen.dart';
import '../di/dependency_injection.dart';
import '../helpers/shared_pref_helper.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    CacheServices.instance.setCurrentRoute(settings.name);
    debugPrint('Navigating to: ${settings.name}');
    switch (settings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => OnBoardingScreen(
            onBoardingData: OnBoardingData.onBoardingBayer,
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.categoryScreen:
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(
            selectedCategory: arguments != null ? arguments as int : 0,
          ),
        );

      case Routes.getStartedScreen:
        return MaterialPageRoute(builder: (_) => const GetStartedScreen());

      case Routes.forgotPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ForgetPasswordScreen(),
        );

      case Routes.resetPasswordScreen:
        return MaterialPageRoute(
          builder: (_) => const ResetPasswordScreen(),
        );

      case Routes.passwordUpdatedScreen:
        return MaterialPageRoute(
          builder: (_) => const PasswordUpdatedScreen(),
        );

      case Routes.signUpBuyerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignUpBuyerCubit>(),
            child: const SignUpBuyerScreen(),
          ),
        );
      case Routes.verifyScreen:
        return MaterialPageRoute(
          builder: (_) => VerifyScreen(
              //!  comeFromPayment: arguments as bool,
              ),
        );

      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
        );
      case Routes.settingsScreen:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
        );
      case Routes.walletScreen:
        return MaterialPageRoute(
          builder: (_) => const WalletScreen(),
        );
      case Routes.notificationsScreen:
        return MaterialPageRoute(
          builder: (_) => const NotificationsScreen(),
        );
      case Routes.savedItemsScreen:
        return MaterialPageRoute(
          builder: (_) => const SavedItemsScreen(),
        );
      case Routes.mainScreen:
        return MaterialPageRoute(
          builder: (_) => const MainScreen(),
        );
      case Routes.paymentScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentScreen(),
        );
      case Routes.purchaseScreen:
        return MaterialPageRoute(
          builder: (_) => const PurchasesScreen(),
        );
      case Routes.shippingAddressScreen:
        return MaterialPageRoute(
          builder: (_) => const ShippingAddressScreen(),
        );
      case Routes.selectPlanScreen:
        return MaterialPageRoute(
          builder: (_) => const SelectPlanScreen(),
        );
      case Routes.paymentHomeScreen:
        return MaterialPageRoute(
          builder: (_) => const PaymentHomeScreen(),
        );
      case Routes.addNewCardScreen:
        return MaterialPageRoute(
          builder: (_) => const AddNewCardScreen(),
        );
      case Routes.bankAccountScreen:
        return MaterialPageRoute(
          builder: (_) => const BankAccountScreen(),
        );
  
      default:
        return MaterialPageRoute(
          builder: (_) => GetStartedScreen(),
        );
    }
  }
}

