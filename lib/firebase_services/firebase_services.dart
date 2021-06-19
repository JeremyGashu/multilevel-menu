import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:multiilevel/data/models/subcategory.dart';

class FirebaseService {
  static final fireStore = FirebaseFirestore.instance;

  Future<List<Subcategories>> getAllItems() async {
    QuerySnapshot<Map<String, dynamic>> items =
        await fireStore.collection('items').get();
    return items.docs.map((item) {
      return Subcategories.fromJson(item.data());
    }).toList();
  }
}
