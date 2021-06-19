import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiilevel/blocs/item/item_bloc.dart';
import 'package:multiilevel/blocs/item/item_event.dart';
import 'package:multiilevel/presentation/subcategory.dart';

import 'bloc_observer.dart';
import 'blocs/item/item_state.dart';

void main() async {
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  debugPrint('Firebase app initialized...');

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => ItemBloc()..add(LoadItems())),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  ));
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ItemBloc, ItemState>(
          builder: (context, state) {
            if (state is LoadedItems) {
              return SubCategories(
                subcategories: state.subcategories,
              );
            } else if (state is LoadingItems) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LoadingItemsError) {
              return Center(
                child: IconButton(
                  icon: Icon(
                    Icons.update,
                    color: Colors.red,
                    size: 40,
                  ),
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
