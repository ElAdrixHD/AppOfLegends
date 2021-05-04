import 'package:app_of_legends/src/blocs/champions/champions_bloc.dart';
import 'package:app_of_legends/src/models/champion.dart';
import 'package:app_of_legends/src/providers/champions_provider.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockChampionsProvider extends Mock implements ChampionsProvider {}

void main(){
  group("Champions List",(){

    FlutterDriver? driver;

    setUpAll(() async{
      driver = await FlutterDriver.connect();
    });

    tearDownAll((){
      if(driver != null){
        driver?.close();
      }
    });

    test("Mostrar todo ok", () async{
      await driver?.waitFor(find.byValueKey("list_champions"));
    });

    blocTest(
      'Cuando el bloc se crea',
      build: () => ChampionsBloc(),
      expect: () => [],
    );

    blocTest(
      'Cuando se ejecuta el evento',
      build: () => ChampionsBloc(),
      act: (ChampionsBloc bloc) => bloc.add(LoadChampionsEvent()),
      expect: () => [LoadingChampionsState(), ReceivedChampionsState()],
    );
  });
}