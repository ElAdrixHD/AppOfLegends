import 'dart:convert';

import 'package:app_of_legends/src/blocs/champions/champions_bloc.dart';
import 'package:app_of_legends/src/providers/champions_provider.dart';
import 'package:app_of_legends/src/providers/mocks/dio_adapter_mock.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:dio/dio.dart';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

void main() {
  group("App Legends", () {
    FlutterDriver? driver;


    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() {
      if (driver != null) {
        driver?.close();
      }
    });

    group("List Champions", () {

      test("Mostrar todo ok", () async {
        await driver?.waitFor(find.byValueKey("list_champions"));
      });

      test('verifies the list contains a Zyra item', () async {
        // Create two SerializableFinders and use these to locate specific
        // widgets displayed by the app. The names provided to the byValueKey
        // method correspond to the Keys provided to the widgets in step 1.
        final listFinder = find.byValueKey('list_champions');
        final itemFinder = find.byValueKey('show_item_champion_Zyra');

        await driver?.scrollUntilVisible(
          // Scroll through the list
          listFinder,
          // Until finding this item
          itemFinder,
          // To scroll down the list, provide a negative value to dyScroll.
          // Ensure that this value is a small enough increment to
          // scroll the item into view without potentially scrolling past it.
          //
          // To scroll through horizontal lists, provide a dxScroll
          // property instead.
          dyScroll: -300.0,
        );

        // Verify that the item contains the correct text.
        expect(
          await driver?.getText(find.byValueKey("text_item_champion_Zyra")),
          'Zyra',
        );
      });
    });

    group("Bloc test", () {

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
    
    group("Test providers", (){
      DioAdapterMock dioAdapterMock = DioAdapterMock();

      test("return list champs", ()async{

        var data = {'message': 'Get champs'};

        final responsepayload = jsonEncode(data);

        final httpResponse = ResponseBody.fromString(
          responsepayload,
          200,
          headers: {
            Headers.contentTypeHeader: [Headers.jsonContentType],
          },
        );

        when(dioAdapterMock.fetch(RequestOptions(path: ""), any, any))
            .thenAnswer((_) async => httpResponse);
        
        expect(actual, matcher)

      });
    });
  });
}
