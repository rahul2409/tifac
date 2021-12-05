import 'dart:convert';

CreateOrderId createOrderIdFromJson(String str) => CreateOrderId.fromJson(json.decode(str));

String createOrderIdToJson(CreateOrderId data) => json.encode(data.toJson());

class CreateOrderId {
    CreateOrderId({
        this.success = 0,
        this.orderid = "",
    });

    int success;
    String orderid;

    factory CreateOrderId.fromJson(Map<String, dynamic> json) => CreateOrderId(
        success: json["success"],
        orderid: json["orderid"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "orderid": orderid,
    };
}
