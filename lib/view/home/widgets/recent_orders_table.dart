import 'package:flutter/material.dart';
import 'package:rfc_admin_panel/models/order.dart';

class RecentOrdersTable extends StatelessWidget {
  final List<Order> orders;
  const RecentOrdersTable({super.key, required this.orders});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recent Orders',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          DataTable(
            columns: const [
              DataColumn(label: Text('Order ID')),
              DataColumn(label: Text('Customer')),
              DataColumn(label: Text('Total')),
              DataColumn(label: Text('Status')),
            ],
            rows: orders
                .map(
                  (order) => DataRow(
                    cells: [
                      DataCell(Text(order.orderId)),
                      DataCell(Text(order.customer)),
                      DataCell(Text('\$${order.total.toStringAsFixed(2)}')), // Format total to 2 decimal places
                      DataCell(Text(order.status)),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
