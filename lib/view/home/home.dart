import 'package:flutter/material.dart';
import 'package:rfc_admin_panel/dummy_data.dart';
import 'package:rfc_admin_panel/view/home/widgets/dashboard_card.dart';
import 'package:rfc_admin_panel/view/home/widgets/recent_orders_table.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Panel'),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              children: const [
                DashboardCard(
                  title: 'Total Orders',
                  value: '1,234',
                  icon: Icons.shopping_cart,
                ),
                DashboardCard(
                  title: 'Total Revenue',
                  value: '\$12,345',
                  icon: Icons.attach_money,
                ),
                DashboardCard(
                  title: 'New Customers',
                  value: '56',
                  icon: Icons.people,
                ),
                DashboardCard(
                  title: 'Pending Deliveries',
                  value: '12',
                  icon: Icons.delivery_dining,
                ),
              ],
            ),
            const SizedBox(height: 32),
            RecentOrdersTable(orders: dummyOrders),
          ],
        ),
      ),
    );
  }
}
