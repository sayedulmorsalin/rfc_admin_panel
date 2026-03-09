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
  Order(
    orderId: '#12349',
    customer: 'Olivia Brown',
    total: 89.00,
    status: 'Pending',
  ),
  Order(
    orderId: '#12350',
    customer: 'Noah Davis',
    total: 12.25,
    status: 'Cancelled',
  ),
  Order(
    orderId: '#12351',
    customer: 'Amelia Wilson',
    total: 57.99,
    status: 'Shipped',
  ),
  Order(
    orderId: '#12352',
    customer: 'Liam Taylor',
    total: 130.40,
    status: 'Processing',
  ),
];
