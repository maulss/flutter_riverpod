import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/screens/cart/cart_screen.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalItemInCart = ref.watch(cartNotifierProvider);
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            context.go('/cart');
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return const CartScreen();
            // }));
          },
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blueAccent,
            ),
            child: Text(
              totalItemInCart.length.toString(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
