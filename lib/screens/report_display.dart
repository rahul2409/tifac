import 'package:flutter/material.dart';
import 'package:tifac/models/reportmodel.dart';

class ReportPage extends StatelessWidget {
  final Report report;
  const ReportPage({Key? key, required this.report}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(report.reportname),
        backgroundColor: Color.fromRGBO(5, 0, 154, 1),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Price of the report - Rs.${report.price}'),
              MaterialButton(
                child: Text(
                  'Purchase',
                  style: TextStyle(color: Colors.white),
                ),
                color: Color.fromRGBO(5, 0, 154, 1),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      body: Container(
        height: height,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                report.reportname,
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.network(
                report.reportimagepath,
                width: width,
                height: height / 3,
              ),
            ),
            ListTile(
              title: Text('Year Of Publishing '),
              trailing: Text(report.yearofpublication),
            ),
            ListTile(
              title: Text('Category Of Report'),
              trailing: Text(report.category),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ExpansionTile(
                title: Text('Excerpt'),
                children: [
                  Text(report.excerpt),
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
