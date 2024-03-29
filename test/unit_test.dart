import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:veganic_foods_app/providers/Api_provider.dart';
import 'package:veganic_foods_app/providers/cart_provider.dart';
import 'package:veganic_foods_app/screens/details_page/components/product_class.dart';

List<Product> fixture_data = [
  Product(
      name: 'food 1',
      product_id: 1,
      description: 'first food',
      price: 3,
      quantity: 1,
      image: 'assets/images/toppng_1.png',
      category: 1),
  Product(
      name: 'food 2',
      product_id: 2,
      description: 'second food',
      price: 4,
      quantity: 1,
      image: 'assets/images/toppng_1.png',
      category: 1),
  Product(
      name: 'food 3',
      product_id: 3,
      description: 'third food',
      price: 5,
      quantity: 1,
      image: 'assets/images/toppng_1.png',
      category: 1),
  Product(
      name: 'food 4',
      product_id: 4,
      price: 2,
      description: 'fourth',
      quantity: 1,
      image: 'assets/images/toppng_1.png',
      category: 1)
];

class MockGetdata implements ApiProvider {
  @override
  late Client client;

  @override
  late String id;

  @override
  Future gateway(String number, double cart_total) {
    throw UnimplementedError();
  }

  @override
  Future<Product> getProduct(String? id) async {
    return fixture_data[1];
  }

  @override
  Future createCustomer() {
    // TODO: implement createCustomer
    throw UnimplementedError();
  }

  @override
  Future makePayment(double amount) {
    // TODO: implement makePayment
    throw UnimplementedError();
  }

  @override
  Future returningCustomer(double amount, String customerID, String currency) {
    // TODO: implement returningCustomer
    throw UnimplementedError();
  }
}

class BetterMockService extends Mock implements ApiProvider {}

void main() {
  late Cart cart = Cart();
  late BetterMockService mockService;
  late ApiProvider http;
  setUp(() {
    for (Product i in fixture_data) {
      cart.addtoCart(i);
      http = BetterMockService();
    }
  });
  group('cart provider tests', () {
    test('testing basic functionalities ', () {
      expect(cart.cart, isNotEmpty);
      expect(cart.count, 4);
      expect(cart.total, 14);
      expect(cart.carttotal(), 14);
    });
    test('clear function', () {
      for (Product i in fixture_data) {
        cart.addtoCart(i);
      }

      cart.clearall();
      expect(cart.cart, isEmpty);
      expect(cart.carttotal(), 0);
      expect(cart.count, 0);
    });
  });

  group('mocking api', () {
    test('Api call to get product Data ', () async {
      when(() => http.getProduct('1')).thenAnswer((_) async => fixture_data[1]);
      expect(await http.getProduct('1'), fixture_data[1]);
      expect(await http.getProduct('1'), isA<Product>());
      // verify(() => http.getProduct('1')).called(1);
    });
    test('payment gateway test', () async {
      when(() => http.gateway('01234567890', cart.total))
          .thenAnswer((_) async => 'successful');
      expect(await http.gateway('01234567890', cart.total), 'successful');
    });

    test("stripe implementation for returning customer", () async {
      when(() => http.returningCustomer(430, "customerID", "usd"))
          .thenAnswer((_) async => {
                "customer_id": "customerID",
                "empheral_key": "786576ghdfhbgyuy4534",
                "client_secret": "sfhbkclient__secret__947943eugiewgjdvbjkxc"
              });
      expect(await http.returningCustomer(430, "customerID", "usd"),
          contains("empheral_key"));
      verify(() => http.returningCustomer(430, "customerID", "usd"));
    });
    test("create stripe customer ", () async {
      when(() => http.createCustomer()).thenAnswer((_) async => "anId435jgkdj");
      expect(await http.createCustomer(), isA<String>());
      verify(() => http.createCustomer());
    });

    test("making default stripe payment", () async {
      when(() => http.makePayment(300)).thenAnswer((_) async => "sucessful");
      expect(await http.makePayment(300), "sucessful");
      verify(() => http.makePayment(300));
    });
  });
}
