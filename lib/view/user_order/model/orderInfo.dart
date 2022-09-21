class OrderInfo {
  const OrderInfo({
    required this.date,
    required this.driverInfo,
    required this.deliveryProcesses,
  });

  final DateTime date;
  final DriverInfo driverInfo;
  final List<DeliveryProcess> deliveryProcesses;
}

class DriverInfo {
  const DriverInfo({
    required this.name,
    required this.thumbnailUrl,
  });

  final String name;
  final String thumbnailUrl;
}

class DeliveryProcess {
  const DeliveryProcess(
    this.name,
    this.compllete, {
    this.messages = const [],
  });

  final bool compllete;
  final String name;
  final List<DeliveryMessage> messages;
}

class DeliveryMessage {
  const DeliveryMessage(this.createdAt, this.message);

  final String createdAt;
  final String message;

  @override
  String toString() {
    return '$createdAt $message';
  }
}
