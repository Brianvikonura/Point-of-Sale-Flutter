// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:point_of_sale_flutter/presentation/home/models/product_quantity.dart';

class OrderModel {
  final int? id;
  final int paymentAmount;
  final int subTotal;
  final int tax;
  final int discount;
  final int serviceCharge;
  final int total;
  final String paymentMethod;
  final int totalItem;
  final int idKasir;
  final String namaKasir;
  final String transactionTime;
  final int isSync;
  final List<ProductQuantity> orderItems;
  OrderModel({
    this.id,
    required this.paymentAmount,
    required this.subTotal,
    required this.tax,
    required this.discount,
    required this.serviceCharge,
    required this.total,
    required this.paymentMethod,
    required this.totalItem,
    required this.idKasir,
    required this.namaKasir,
    required this.transactionTime,
    required this.isSync,
    required this.orderItems,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'payment_amount': paymentAmount,
      'sub_total': subTotal,
      'tax': tax,
      'discount': discount,
      'service_charge': serviceCharge,
      'total': total,
      'payment_method': paymentMethod,
      'total_item': totalItem,
      'id_kasir': idKasir,
      'nama_kasir': namaKasir,
      'transaction_time': transactionTime,
      'is_sync': isSync,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id']?.toInt(),
      paymentAmount: map['payment_amount']?.toInt() ?? 0,
      subTotal: map['sub_total']?.toInt() ?? 0,
      tax: map['tax']?.toInt() ?? 0,
      discount: map['discount']?.toInt() ?? 0,
      serviceCharge: map['service_charge']?.toInt() ?? 0,
      total: map['total']?.toInt() ?? 0,
      paymentMethod: map['payment_method'] ?? '',
      totalItem: map['total_item']?.toInt() ?? 0,
      idKasir: map['id_kasir']?.toInt() ?? 0,
      namaKasir: map['nama_kasir'] ?? '',
      transactionTime: map['transaction_time'] ?? '',
      isSync: map['is_sync']?.toInt() ?? 0,
      orderItems: [],
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
