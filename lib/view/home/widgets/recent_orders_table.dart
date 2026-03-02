import 'package:flutter/material.dart';
import 'package:rfc_admin_panel/models/order.dart';

class RecentOrdersTable extends StatelessWidget {
  final List<Order> orders;
  const RecentOrdersTable({super.key, required this.orders});

  Color _statusColor(BuildContext context, String status) {
    final normalized = status.toLowerCase();
    if (normalized.contains('deliver') || normalized.contains('complete')) {
      return Colors.green;
    }
    if (normalized.contains('pending')) {
      return Colors.orange;
    }
    if (normalized.contains('cancel')) {
      return Colors.red;
    }
    return Theme.of(context).colorScheme.primary;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Recent Orders',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            order.orderId,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: _statusColor(
                              context,
                              order.status,
                            ).withOpacity(0.12),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Text(
                            order.status,
                            style: TextStyle(
                              color: _statusColor(context, order.status),
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          order.customer,
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                        Text(
                          '\$${order.total.toStringAsFixed(2)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    if (index < orders.length - 1)
                      Divider(color: Colors.grey.shade300, height: 16),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
