import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference products = firestore.collection("products");

    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firestore.collection("products");
    return products.orderBy("time",descending: true).snapshots();
  }

  void deleteproduct(String docID) {
    DocumentReference docRef = firestore.collection("products").doc(docID);
    try {
      Get.defaultDialog(
        title: "Delete Data",
        middleText: "Apakah kamu yakin akan menghapus data ini ?",
        onConfirm: () async {
          await docRef.delete();
          Get.back();
        },
        textConfirm: "YES",
        textCancel: "NO",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Tidak berhasil menghapus data ini.",
      );
    }
  }
}