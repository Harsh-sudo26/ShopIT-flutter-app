import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/Data/model/Uistateview.dart';
import 'package:shopit/Presentaions/View/Auth/Authscreen.dart';

import 'Presentaions/View/Auth/firebase_options.dart';


import 'package:shopit/Data/service/Authservices/Auth_service.dart';
import 'package:shopit/Data/repository/Auth_repository.dart';
import 'package:shopit/Presentaions/Viewmodel/auth_viewmodel.dart';


import 'package:shopit/Data/service/product_api.dart';
import 'package:shopit/Data/repository/product_repo.dart';
import 'package:shopit/Presentaions/Viewmodel/product_viewmoderl.dart';
import 'package:shopit/Presentaions/Viewmodel/cart_viewmodel.dart';
import 'package:shopit/Presentaions/Viewmodel/favorite_viewmodel.dart';

import 'package:shopit/Presentaions/View/home/home.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),

        Provider<AuthRepository>(
          create: (context) => AuthRepository(context.read<AuthService>()),
        ),

        ChangeNotifierProvider<AuthViewModel>(
          create: (context) => AuthViewModel(context.read<AuthRepository>()),
        ),

        Provider<ProductApi>(create: (_) => ProductApi()),

        Provider<ProductRepository>(
          create: (context) =>
              ProductRepository(api: context.read<ProductApi>()),
        ),

        ChangeNotifierProvider<ProductViewModel>(
          create: (context) =>
              ProductViewModel(context.read<ProductRepository>()),
        ),

        ChangeNotifierProvider(create: (_) => FavoriteViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),
        ChangeNotifierProvider(create: (_) => UIStateViewModel()),
      ],

      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AuthGate(),
      ),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasError) {
          return const Scaffold(
            body: Center(child: Text("Something went wrong")),
          );
        }

        if (snapshot.data != null) {
          return const Homepage();
        }

        return const AuthScreen();
      },
    );
  }
}
