import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';
import 'package:riverpod_files/shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProduct = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Garage Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProduct.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 30,
                    child: Image.asset(
                      allProduct[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("\$ ${allProduct[index].price.toString()}"),
                  Text(allProduct[index].title),
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .removeProduct(allProduct[index]);
                        },
                        child: const Text("remove")),
                  if (!cartProducts.contains(allProduct[index]))
                    TextButton(
                        onPressed: () {
                          ref
                              .read(cartNotifierProvider.notifier)
                              .addProduct(allProduct[index]);
                        },
                        child: const Text("Add to cart"))
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
