import 'package:flutter/material.dart';
import './unit.dart';
import './converter_route.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final ColorSwatch color;
  final IconData iconLocation;
  final List<Unit> units;

  const Category({
    Key key,
    @required this.name,
    @required this.color,
    @required this.iconLocation,
    @required this.units,
  })  : assert(name != null),
        assert(color != null),
        assert(iconLocation != null),
        assert(units != null),
        super(key: key);

  void _navigateToConverter(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            name,
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
          backgroundColor: color,
          centerTitle: true,
        ),
        body: ConverterRoute(
          color: color,
          name: name,
          units: units,
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _rowHeight,
      child: InkWell(
        onTap: () {
          _navigateToConverter(context);
          print("i am tapped");
        },
        splashColor: color,
        highlightColor: color,
        borderRadius: _borderRadius,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                iconLocation,
                size: 64.0,
              ),
            ),
            Center(
              child: Text(
                name,
                style: TextStyle(fontSize: 24.0),
              ),
            )
          ],
        ),
      ),
    );
  }
}
