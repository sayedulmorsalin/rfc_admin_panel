import 'package:rfc_admin_panel/models/order.dart';

final List<Order> dummyOrders = [
  Order(
    orderId: '#12345',
    customer: 'John Doe',
    total: 25.50,
    status: 'Processing',
  ),
  Order(
    orderId: '#12346',
    customer: 'Jane Smith',
    total: 15.75,
    status: 'Shipped',
  ),
  Order(
    orderId: '#12347',
    customer: 'Peter Jones',
    total: 45.00,
    status: 'Delivered',
  ),
  Order(
    orderId: '#12348',
    customer: 'Mary Johnson',
    total: 32.10,
    status: 'Delivered',
  ),
];
