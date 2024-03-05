import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:point_of_sale_flutter/presentation/home/models/product_category.dart';
import 'package:point_of_sale_flutter/presentation/home/widgets/custom_tab_bar.dart';
import 'package:point_of_sale_flutter/presentation/setting/dialogs/form_discount_dialog.dart';
import 'package:point_of_sale_flutter/presentation/setting/models/discount_model.dart';
import 'package:point_of_sale_flutter/presentation/setting/widgets/add_data.dart';
import 'package:point_of_sale_flutter/presentation/setting/widgets/manage_discount_card.dart';
import 'package:point_of_sale_flutter/presentation/setting/widgets/settings_title.dart';

class DiscountPage extends StatefulWidget {
  const DiscountPage({super.key});

  @override
  State<DiscountPage> createState() => _DiscountPageState();
}

class _DiscountPageState extends State<DiscountPage> {
  final List<DiscountModel> discounts = [
    DiscountModel(
      name: '20',
      code: 'BUKAPUASA',
      description: null,
      discount: 50,
      category: ProductCategory.food,
    ),
  ];

  void onEditTap(DiscountModel item) {
    showDialog(
      context: context,
      builder: (context) => FormDiscountDialog(data: item),
    );
  }

  void onAddDataTap() {
    showDialog(
      context: context,
      builder: (context) => const FormDiscountDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SettingsTitle('Kelola Diskon'),
          const SizedBox(height: 24),
          CustomTabBar(
            tabTitles: const ['Semua'],
            initialTabIndex: 0,
            tabViews: [
              // SEMUA TAB
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: discounts.length + 1,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.85,
                    crossAxisCount: 3,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 30.0,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return AddData(
                        title: 'Tambah Diskon Baru',
                        onPressed: onAddDataTap,
                      );
                    }
                    final item = discounts[index - 1];
                    return ManageDiscountCard(
                      data: item,
                      onEditTap: () => onEditTap(item),
                    );
                  },
                ),
              ),

              // MAKANAN TAB
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: discounts
                          .where((element) => element.category.isFood)
                          .toList()
                          .length +
                      1,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.85,
                    crossAxisCount: 3,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 30.0,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return AddData(
                        title: 'Tambah Diskon Baru',
                        onPressed: onAddDataTap,
                      );
                    }
                    final item = discounts
                        .where((element) => element.category.isFood)
                        .toList()[index - 1];
                    return ManageDiscountCard(
                      data: item,
                      onEditTap: () => onEditTap(item),
                    );
                  },
                ),
              ),

              // MINUMAN TAB
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: discounts
                          .where((element) => element.category.isDrink)
                          .toList()
                          .length +
                      1,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.85,
                    crossAxisCount: 3,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 30.0,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return AddData(
                        title: 'Tambah Diskon Baru',
                        onPressed: onAddDataTap,
                      );
                    }
                    final item = discounts
                        .where((element) => element.category.isDrink)
                        .toList()[index - 1];
                    return ManageDiscountCard(
                      data: item,
                      onEditTap: () => onEditTap(item),
                    );
                  },
                ),
              ),

              // SNACK TAB
              SizedBox(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: discounts
                          .where((element) => element.category.isSnack)
                          .toList()
                          .length +
                      1,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.85,
                    crossAxisCount: 3,
                    crossAxisSpacing: 30.0,
                    mainAxisSpacing: 30.0,
                  ),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return AddData(
                        title: 'Tambah Diskon Baru',
                        onPressed: onAddDataTap,
                      );
                    }
                    final item = discounts
                        .where((element) => element.category.isSnack)
                        .toList()[index - 1];
                    return ManageDiscountCard(
                      data: item,
                      onEditTap: () => onEditTap(item),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
