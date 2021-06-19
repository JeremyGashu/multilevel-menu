import 'package:equatable/equatable.dart';
import 'package:multiilevel/data/models/subcategory.dart';

class ItemState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends ItemState {
  @override
  List<Object> get props => [];
}

class LoadingItems extends ItemState {
  @override
  List<Object> get props => [];
}

class LoadedItems extends ItemState {
  final List<Subcategories> subcategories;

  LoadedItems({this.subcategories});
  @override
  List<Object> get props => [subcategories];
}

class LoadingItemsError extends ItemState {
  final String message;

  LoadingItemsError({this.message});
  @override
  List<Object> get props => [message];
}
