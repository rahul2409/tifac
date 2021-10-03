// To parse this JSON data, do
//
//     final reportModel = reportModelFromJson(jsonString);

import 'dart:convert';

ReportModel reportModelFromJson(String str) => ReportModel.fromJson(json.decode(str));

String reportModelToJson(ReportModel data) => json.encode(data.toJson());

class ReportModel {
    ReportModel({
        required this.success,
        required this.reports,
    });

    int success;
    List<Report> reports;

    factory ReportModel.fromJson(Map<String, dynamic> json) => ReportModel(
        success: json["success"],
        reports: List<Report>.from(json["reports"].map((x) => Report.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "reports": List<dynamic>.from(reports.map((x) => x.toJson())),
    };
}

class Report {
    Report({
        required this.reportname,
        required this.excerpt,
        required this.reportimagepath,
        required this.yearofpublication,
        required this.price,
        required this.category,
    });

    String reportname;
    String excerpt;
    String reportimagepath;
    String yearofpublication;
    String price;
    String category;

    factory Report.fromJson(Map<String, dynamic> json) => Report(
        reportname: json["reportname"],
        excerpt: json["excerpt"],
        reportimagepath: json["reportimagepath"],
        yearofpublication: json["yearofpublication"],
        price: json["price"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "reportname": reportname,
        "excerpt": excerpt,
        "reportimagepath": reportimagepath,
        "yearofpublication": yearofpublication,
        "price": price,
        "category": category,
    };
}
