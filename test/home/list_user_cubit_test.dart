import 'package:base_template_bloc/features/data/models/user_model.dart';
import 'package:base_template_bloc/features/domain/usecases/home.dart';
import 'package:base_template_bloc/features/presentation/home/bloc/list_user_cubit.dart';
import 'package:base_template_bloc/features/presentation/home/bloc/list_user_state.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// Create mock classes
class MockHomeUseCase extends Mock implements HomeUseCase {}

void main() {
  group('ListUserCubit', () {
    late MockHomeUseCase mockHomeUseCase;
    late ListUserCubit listUserCubit;

    setUp(() {
      mockHomeUseCase = MockHomeUseCase();
      listUserCubit = ListUserCubit(mockHomeUseCase);
    });

    test('initial state is ListUserLoading', () {
      expect(listUserCubit.state, equals(const ListUserLoading()));
    });

    blocTest<ListUserCubit, ListUserState>(
      'emits [ListUserLoaded] when fetchUsers is successful',
      build: () {
        // Use `Future.value` to simulate async method
        when(() => mockHomeUseCase.fetchUsers()).thenAnswer(
          (_) async => Future.value([
            User(
              id: 1,
              name: 'John Doe',
              username: 'johndoe',
              email: 'john.doe@example.com',
              address: Address(
                street: '123 Elm St',
                suite: 'Apt 4',
                city: 'Gotham',
                zipcode: '12345',
                geo: Geo(lat: '40.7128', lng: '-74.0060'),
              ),
              phone: '123-456-7890',
              website: 'johndoe.com',
              company: Company(
                name: 'Doe Inc',
                catchPhrase: 'Innovate the future',
                bs: 'tech',
              ),
            )
          ]),
        );
        return listUserCubit;
      },
      act: (cubit) => cubit.fetchUsers(),
      expect: () => [
        isA<ListUserLoaded>().having(
          (state) => state.users,
          'users',
          [
            isA<User>()
                .having(
                  (user) => user.id,
                  'id',
                  1,
                )
                .having(
                  (user) => user.name,
                  'name',
                  'John Doe',
                )
                .having(
                  (user) => user.username,
                  'username',
                  'johndoe',
                )
                .having(
                  (user) => user.email,
                  'email',
                  'john.doe@example.com',
                )
                .having(
                  (user) => user.address,
                  'address',
                  isA<Address>()
                      .having(
                        (address) => address.street,
                        'street',
                        '123 Elm St',
                      )
                      .having(
                        (address) => address.suite,
                        'suite',
                        'Apt 4',
                      )
                      .having(
                        (address) => address.city,
                        'city',
                        'Gotham',
                      )
                      .having(
                        (address) => address.zipcode,
                        'zipcode',
                        '12345',
                      )
                      .having(
                        (address) => address.geo,
                        'geo',
                        isA<Geo>()
                            .having(
                              (geo) => geo.lat,
                              'lat',
                              '40.7128',
                            )
                            .having(
                              (geo) => geo.lng,
                              'lng',
                              '-74.0060',
                            ),
                      ),
                )
                .having(
                  (user) => user.phone,
                  'phone',
                  '123-456-7890',
                )
                .having(
                  (user) => user.website,
                  'website',
                  'johndoe.com',
                )
                .having(
                  (user) => user.company,
                  'company',
                  isA<Company>()
                      .having(
                        (company) => company.name,
                        'name',
                        'Doe Inc',
                      )
                      .having(
                        (company) => company.catchPhrase,
                        'catchPhrase',
                        'Innovate the future',
                      )
                      .having(
                        (company) => company.bs,
                        'bs',
                        'tech',
                      ),
                ),
          ],
        ),
      ],
    );

    blocTest<ListUserCubit, ListUserState>(
      'emits [ListUserFailure] when fetchUsers fails',
      build: () {
        when(() => mockHomeUseCase.fetchUsers())
            .thenThrow(Exception('Failed to fetch users'));
        return listUserCubit;
      },
      act: (cubit) => cubit.fetchUsers(),
      expect: () => [
        const ListUserFailure('Exception: Failed to fetch users'),
      ],
    );
  });
}
