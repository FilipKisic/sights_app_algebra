import 'package:hive_ce/hive_ce.dart';
import 'package:sights_app/domain/model/place.dart';


@GenerateAdapters([AdapterSpec<Place>()])
part 'hive_adapters.g.dart';

const String placeBoxName = 'places';
