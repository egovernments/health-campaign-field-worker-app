import 'package:bloc_test/bloc_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';
import 'package:digit_components/blocs/location/location.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:location/location.dart';
import 'package:mocktail/mocktail.dart';

class MockLocationPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements LocationPlatform {}

void main() {
  const mockLat = -25.953724;
  const mockLng = 32.588711;

  group('Location bloc', () {
    blocTest(
      'loads with mock latLng',
      build: () => LocationBloc(),
      setUp: () {
        final mock = MockLocationPlatform();
        when(
          () => mock.getLocation(
            settings: any(named: 'settings'),
          ),
        ).thenAnswer(
          (invocation) async => LocationData(
            latitude: mockLat,
            longitude: mockLng,
            accuracy: 1.0,
          ),
        );

        setLocationInstance(mock);
      },
      act: (bloc) => bloc.add(const LoadLocationEvent()),
      expect: () => [
        isA<LocationState>().having(
          (state) => state.loading,
          'will enter loading state',
          true,
        ),
        isA<LocationState>().having(
          (state) => state.latitude,
          'will fetch mocked lat',
          mockLat,
        ),
        isA<LocationState>().having(
          (state) => state.loading,
          'will enter loading state',
          false,
        ),
      ],
    );
  });
}
