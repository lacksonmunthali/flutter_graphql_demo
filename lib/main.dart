import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

const String vendorsGraphQl = """
       query Product{
        products(first: 5, channel: "default-channel") {
          edges {
            node {
              id
              name
              description
              thumbnail{
                url
              }
            }
          }
        }
      }
""";

void main() {
  final HttpLink link = HttpLink('https://demo.saleor.io/graphql/');
  ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
    link: link,
    cache: GraphQLCache(
      store: InMemoryStore(),
    ),
  ));
  var app = GraphQLProvider(
    client: client,
    child: HomeApp(),
  );
  runApp(app);
}

class HomeApp extends StatelessWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Demo'),
        ),
        body: Query(
          options: QueryOptions(
            document: gql(vendorsGraphQl),
          ),
          builder: (QueryResult result, {fetchMore, refetch}) {
            if (result.hasException) {
              return Text(result.exception.toString());
            }
            if (result.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final products = result.data?['products']['edges'];
            return ListView.builder(
                itemCount: products.length,
                itemBuilder: (_, index) {
                  var vendor = products[index]['node'];
                  return Column(
                    children: [
                      Container(
                        child: Image.network(vendor['thumbnail']['url']),
                      ),
                      Text(vendor['name'])
                    ],
                  );
                });
          },
        ),
      ),
    );
  }
}
