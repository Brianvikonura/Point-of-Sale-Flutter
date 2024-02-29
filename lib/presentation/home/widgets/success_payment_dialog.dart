import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:point_of_sale_flutter/core/components/buttons.dart';
import 'package:point_of_sale_flutter/core/components/spaces.dart';
import 'package:point_of_sale_flutter/presentation/home/bloc/local_product/checkout/checkout_bloc.dart';
import 'package:print_bluetooth_thermal/print_bluetooth_thermal.dart';

import '../../../../core/core.dart';
import '../models/order_item.dart';

class SuccessPaymentDialog extends StatefulWidget {
  const SuccessPaymentDialog({super.key});

  @override
  State<SuccessPaymentDialog> createState() => _SuccessPaymentDialogState();
}

class _SuccessPaymentDialogState extends State<SuccessPaymentDialog> {
  List<OrderItem> data = [];
  int totalQty = 0;
  int totalPrice = 0;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Assets.icons.success.svg()),
            const SpaceHeight(16.0),
            const Center(
              child: Text(
                'Pembayaran telah sukses dilakukan',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SpaceHeight(20.0),
            const Text('METODE BAYAR'),
            const SpaceHeight(5.0),
            const Text(
              'Tunai',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(10.0),
            const Divider(),
            const SpaceHeight(8.0),
            const Text('TOTAL TAGIHAN'),
            const SpaceHeight(5.0),
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                final price = state.maybeWhen(
                  orElse: () => 0,
                  loaded: (products) => products.fold<int>(
                    0,
                    ((previousValue, element) =>
                        previousValue +
                        (element.product.price!.toIntegerFromText *
                            element.quantity)),
                  ),
                );
                final tax = price * 0.11;
                final total = price + tax;
                // data = state.maybeWhen(
                //   orElse: () => [],
                //   loaded: (products) => products
                //   .map((e) => OrderItem(
                //     name: e.product.name!,
                //     price: e.product.price!.toIntegerFromText,
                //     qty: e.quantity,
                //   ))
                //   .toList(),
                // );
                totalQty = state.maybeWhen(
                  orElse: () => 0,
                  loaded: (products) => products.fold<int>(
                    0,
                    (previousValue, element) =>
                        previousValue + element.quantity,
                  ),
                );
                totalPrice = state.maybeWhen(
                  orElse: () => 0,
                  loaded: (products) => products.fold<int>(
                    0,
                    (previousValue, element) =>
                        previousValue +
                        (element.product.price!.toIntegerFromText *
                            element.quantity),
                  ),
                );
                return Text(
                  total.ceil().currencyFormatRp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
            const SpaceHeight(10.0),
            const Divider(),
            const SpaceHeight(8.0),
            const Text('NOMINAL BAYAR'),
            const SpaceHeight(5.0),
            BlocBuilder<CheckoutBloc, CheckoutState>(
              builder: (context, state) {
                final price = state.maybeWhen(
                  orElse: () => 0,
                  loaded: (products) => products.fold<int>(
                    0,
                    (previousValue, element) =>
                        previousValue +
                        (element.product.price!.toIntegerFromText *
                            element.quantity),
                  ),
                );
                final tax = price * 0.11;
                final total = price + tax;
                return Text(
                  total.ceil().currencyFormatRp,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                  ),
                );
              },
            ),
            const SpaceHeight(10.0),
            const Divider(),
            const SpaceHeight(8.0),
            const Text('WAKTU PEMBAYARAN'),
            const SpaceHeight(5.0),
            const Text(
              '22 Januari, 11:17',
              style: TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
            const SpaceHeight(20.0),
            Row(
              children: [
                Flexible(
                  child: Button.outlined(
                    onPressed: () {
                      context
                          .read<CheckoutBloc>()
                          .add(const CheckoutEvent.started());
                      context.popToRoot();
                    },
                    label: 'Kembali',
                  ),
                ),
                const SpaceWidth(8.0),
                Flexible(
                  child: Button.filled(
                    onPressed: () async {
                      //   final printValue = await CwbPrint.instance.printOrder(
                      //     data,
                      //     totalQty,
                      //     totalPrice,
                      //     'Tunai',
                      //     totalPrice,
                      //     'Brian's Restaurant',
                      //   );
                      //   await PrintBluetoothThermal.writeBytes(printValue);
                    },
                    label: 'Print',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
