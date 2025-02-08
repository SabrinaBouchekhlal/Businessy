<<<<<<< HEAD
=======

>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81
import 'package:businessy/blocs/inventory/inventory_event.dart';
import 'package:businessy/blocs/inventory/inventory_state.dart';
import 'package:businessy/mainScreen.dart';
import 'package:businessy/views/screens/features/edit_inventory.dart';
import 'package:businessy/views/screens/features/first_page.dart';
import 'package:businessy/views/screens/features/homepage.dart';
import 'package:businessy/views/screens/features/inventory.dart';
import 'package:businessy/views/screens/features/wallet.dart';
import 'package:businessy/views/screens/user/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:businessy/views/screens/auth/login_screen.dart';
import 'package:businessy/views/screens/auth/sign_up_screen2.dart';
import 'package:businessy/views/screens/auth/otp_verification.dart';
import 'package:businessy/views/screens/auth/sign_up_screen.dart';
import 'package:businessy/views/screens/auth/business_setup_screen.dart';
import 'package:businessy/views/screens/auth/forgot_password_screen.dart';
import 'package:businessy/views/screens/auth/otp_verification.dart';
import 'package:businessy/views/screens/auth/set_new_password_screen.dart';
import 'package:businessy/views/screens/auth/logo_upload_screen.dart';
import 'package:businessy/views/screens/features/details_screen.dart';
import 'package:businessy/views/screens/features/add_item_screen.dart';
import 'package:businessy/views/screens/features/edit_item_screen.dart';
import 'package:businessy/views/screens/features/insights_screen.dart';
import 'package:businessy/views/screens/user/settings_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/inventory/inventory_bloc.dart';
<<<<<<< HEAD
import 'database/tables/income.dart';
import 'database/tables/item.dart';
import 'blocs/insights/insights_bloc.dart';
import'package:supabase_flutter/supabase_flutter.dart';
=======
>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://abpvispbtgxlrxrcnryj.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFicHZpc3BidGd4bHJ4cmNucnlqIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mzg3NjU5ODMsImV4cCI6MjA1NDM0MTk4M30.nQiybEKNmMatjgptZWQpa2qhK3gvwG5719UXqS0r0AM',
    debug: true 
    );
  runApp(const MainApp());
}

final supabase = Supabase.instance.client;

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => InventoryBloc(),
<<<<<<< HEAD
          create: (context) => InsightsBloc()
=======
>>>>>>> 6012124136260cfbc70a3af03cc305feb6b05a81
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: const Mainscreen(), //LoginScreen(),
        routes: {
          //main pages
          '/ProfileScreen': (ctx) => const ProfileScreen(),
          '/SettingsScreen': (ctx) => const SettingsScreen(),
          '/MainScreen': (ctx) => const Mainscreen(),
          '/LoginScreen': (ctx) => const LoginScreen(),
          '/ForgotPasswordScreen': (ctx) => const ForgotPasswordScreen(),
          '/SetNewPasswordScreen': (ctx) => const SetNewPasswordScreen(),
          '/BusinessSetupScreen': (ctx) => const BusinessSetupScreen(),
          '/SignUpScreen': (ctx) => const SignUpScreen(),
          '/SignUpScreen2': (ctx) => const SignUpScreen2(),
          '/OtpVerification': (ctx) => const OtpVerification(),
          '/LogoUploadScreen': (ctx) => const LogoUploadScreen(),
          '/Homepage': (ctx) => const Homepage(),
          '/WalletPage': (ctx) => const WalletPage(),
          '/InventoryPage': (ctx) => const InventoryPage(),
          '/InsightsPage': (ctx) => InsightsPage(),
        },
      ),
    );
  }
}
