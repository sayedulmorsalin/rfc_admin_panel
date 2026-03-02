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
        centerTitle: false,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Dashboard Overview',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 4),
            Text(
              'Track your business performance at a glance.',
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(color: Colors.grey.shade600),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: const [
                SizedBox(
                  width: 150,
                  height: 120,
                  child: DashboardCard(
                    title: 'Total Orders',
                    value: '1,234',
                    icon: Icons.shopping_cart,
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 120,
                  child: DashboardCard(
                    title: 'Total Revenue',
                    value: '\$12,345',
                    icon: Icons.attach_money,
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 120,
                  child: DashboardCard(
                    title: 'New Customers',
                    value: '56',
                    icon: Icons.people,
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 120,
                  child: DashboardCard(
                    title: 'Pending Deliveries',
                    value: '12',
                    icon: Icons.delivery_dining,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            RecentOrdersTable(orders: dummyOrders),
          ],
        ),
      ),
    );
  }
}
