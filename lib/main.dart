import 'body_tracking_page.dart';
import 'earth_page.dart';
import 'image_detection_page.dart';
import 'measure_page.dart';
import 'physics_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final samples = [
      Sample(
        'Планета Земля',
        'Небесное тело, макет нашей планеты Земля',
        Icons.language,
            () => Navigator.of(context)
            .push<void>(MaterialPageRoute(builder: (c) => EarthPage())),
      ),
      Sample(
        'Измерения',
        'Измерения дистанции',
        Icons.linear_scale,
            () => Navigator.of(context)
            .push<void>(MaterialPageRoute(builder: (c) => MeasurePage())),
      ),
      Sample(
        'Физика',
        'Падение сферы на плоскость',
        Icons.file_download,
            () => Navigator.of(context)
            .push<void>(MaterialPageRoute(builder: (c) => PhysicsPage())),
      ),
      Sample(
        'Распознавание планеты Земля',
        'Распознаем фото нашей планеты и делаем его объёмным',
        Icons.collections,
            () => Navigator.of(context).push<void>(
            MaterialPageRoute(builder: (c) => ImageDetectionPage())),
      ),
      Sample(
        'Отслеживание движений',
        'Объект следует за рукой',
        Icons.person,
            () => Navigator.of(context)
            .push<void>(MaterialPageRoute(builder: (c) => BodyTrackingPage())),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('ReadZone'),
      ),
      body:
      ListView(children: samples.map((s) => SampleItem(item: s)).toList()),
    );
  }
}

class SampleItem extends StatelessWidget {
  const SampleItem({
    required this.item,
    Key? key,
  }) : super(key: key);
  final Sample item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => item.onTap(),
        child: ListTile(
          leading: Icon(item.icon),
          title: Text(
            item.title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          subtitle: Text(
            item.description,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}

class Sample {
  const Sample(this.title, this.description, this.icon, this.onTap);
  final String title;
  final String description;
  final IconData icon;
  final Function onTap;
}