import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shopit/features/products/model/auth_viewmodel.dart';
import 'package:shopit/features/products/model/cartview_model.dart';
import 'package:shopit/features/products/model/favoriteview_model.dart';
import 'package:shopit/features/products/model/productview_moderl.dart';

import 'package:shopit/features/products/repository/product_repo.dart';
import 'package:shopit/features/products/service/product_api.dart';

import 'package:shopit/screens/Auth/Authscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       
        Provider(create: (_) => ProductApi()),

       
        Provider(
          create: (context) =>
              ProductRepository(api: context.read<ProductApi>()),
        ),

      
        ChangeNotifierProvider(create: (_) => FavoriteViewModel()),
        ChangeNotifierProvider(create: (_) => CartViewModel()),

        
        ChangeNotifierProvider(
          create: (context) =>
              ProductViewModel(context.read<ProductRepository>()),
        ),

        ChangeNotifierProvider(create: (_) => AuthViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ShopIT',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),

        home: const AuthScreen(),
      ),
    );
  }
}
