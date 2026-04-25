import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopit/features/products/repository/Auth_repository.dart';
import 'package:shopit/features/products/repository/product_repo.dart';
import 'package:shopit/features/products/service/Authservices/Auth_service.dart';
import 'package:shopit/features/products/service/product_api.dart';
import 'package:shopit/features/products/view/home.dart';
import 'package:shopit/features/products/viewmodel/auth_viewmodel.dart' show AuthViewModel;
import 'package:shopit/features/products/viewmodel/cartview_model.dart';
import 'package:shopit/features/products/viewmodel/favoriteview_model.dart' show FavoriteViewModel;
import 'package:shopit/features/products/viewmodel/productview_moderl.dart' show ProductViewModel;
import 'package:shopit/screens/Auth/Authscreen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService()),

        Provider<AuthRepository>(
          create: (context) => AuthRepository(
            context.read<AuthService>(),
          ),
        ),

        ChangeNotifierProvider<AuthViewModel>(
          create: (context) =>
              AuthViewModel(context.read<AuthRepository>()),
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

        if (snapshot.hasData && snapshot.data != null) {
          return const Homepage();
        }

        return const AuthScreen();
      },
    );
  }
}