import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/service/bmi.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class _ArticleDescription extends StatelessWidget {
  _ArticleDescription({
    Key key,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
    this.readDuration,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '$title',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Text(
                '$subtitle',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                '$author',
                style: const TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
              Text(
                '$publishDate',
                style: const TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomListItem extends StatelessWidget {
  CustomListItem({
    Key key,
    this.thumbnail,
    this.title,
    this.subtitle,
    this.author,
    this.publishDate,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 1.0,
              child: thumbnail,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                child: _ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class HistoryScreen2 extends StatefulWidget {
  HistoryScreen2({Key key}) : super(key: key);

  @override
  _HistoryScreen2State createState() => _HistoryScreen2State();
}

class _HistoryScreen2State extends State<HistoryScreen2> {
  List<CustomListItem> list = [];
  @override
  void initState() {
    super.initState();
    getList();
  }

  Future getList() async {
    BMI bmi = BMI();
    List<BMI> bmiList = await bmi.getBMI();
    print("This history page $bmiList");
    print(DateFormat.EEEE().format(bmiList[0].createdDate));
    print(DateFormat('MMM d, yyyy').add_jm().format(bmiList[0].createdDate));

    List<CustomListItem> customListItem = [];
    for (BMI bmi in bmiList) {
      customListItem.add(CustomListItem(
        thumbnail: ReusableCard(
          kActiveCardColor,
          childCard: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "BMI",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 15.0),
              ),
              Text(
                bmi.bmi.toString(),
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),
              ),
            ],
          ),
        ),
        title: bmi.status,
        subtitle: bmi.getInterpretation(),
        author: DateFormat.EEEE().format(bmi.createdDate),
        publishDate: DateFormat('MMM d, yyyy').add_jm().format(bmi.createdDate),
      ));
    }

    setState(() {
      list = customListItem;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(2.0),
      children: list.length == 0
          ? <Widget>[Center(child: Text("You do not have any bmi"))]
          : list,
    );
  }
}
