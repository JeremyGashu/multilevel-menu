import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multiilevel/blocs/item/item_event.dart';
import 'package:multiilevel/blocs/item/item_state.dart';
import 'package:multiilevel/firebase_services/firebase_services.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  FirebaseService _firebaseService = FirebaseService();

  ItemBloc() : super(InitialState());

  @override
  Stream<ItemState> mapEventToState(ItemEvent event) async* {
    if (event is LoadItems) {
      yield LoadingItems();
      try {
        var subcategories = await _firebaseService.getAllItems();
        yield LoadedItems(subcategories: subcategories);
      } catch (e, stacktrace) {
        print(stacktrace);
        yield LoadingItemsError(message: 'Error Loading items.');
        throw Exception(e);
      }
    }
  }
}
