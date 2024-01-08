import 'package:blinkbuy6/pages/wallet.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class DatabaseMethods {


  Future addUserDetail(Map<String, dynamic> userInfoMap, String id) async {
    return await FirebaseFirestore.instance.collection('users').doc(id).set(
        userInfoMap);
  }

  UpdateUserWallet(String id,String amount)async{
    return await FirebaseFirestore.instance.collection("users").doc(id).update({"Wallet":amount});


}
Future addFoodItem(Map<String, dynamic> userInfoMap, String name) async {
  return await FirebaseFirestore.instance.collection(name).add(
      userInfoMap);
}
Future<Stream<QuerySnapshot>> getFoodItem(String name)async{
    return await FirebaseFirestore.instance.collection(name).snapshots();
}

Future addFoodToCart(Map<String, dynamic> userInfoMap,String id)async{
    return await FirebaseFirestore.instance
  .collection('users')
  .doc(id)
  .collection("Cart")
  .add(userInfoMap);

}

Future<Stream<QuerySnapshot>> getFoodCart(String name )async{
    return await FirebaseFirestore.instance.collection("users").doc("id").collection("Cart").snapshots();
}


}