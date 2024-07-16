import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_files/providers/cart_provider.dart';
import 'package:riverpod_files/providers/products_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final reducedProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_left)),
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: reducedProducts
                  .map(
                    (product) => Container(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: [
                          Image.asset(
                            product.image,
                            height: 60,
                            width: 60,
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Text(product.title),
                          const Expanded(child: SizedBox()),
                          Text("\$ ${product.price.toString()}")
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
            // output totals here
            Align(
              alignment: Alignment.center,
              child: Text("Total Price : \$ $total"),
            )
          ],
        ),
      ),
    );
  }
}
