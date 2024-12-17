import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PegawaiController extends GetxController {
  //TODO: Implement PegawaiController
  late TextEditingController cNo;
  late TextEditingController cNama;
  late TextEditingController cJabatan;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference pegawai = firestore.collection('Karyawan_22312006');

    return pegawai.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference pegawai = firestore.collection('Karyawan_22312006');
    return pegawai.snapshots();
  }

  void add(
      String no_karyawan, String nama_karyawan, String jabatan_karyawan) async {
    CollectionReference pegawai = firestore.collection("Karyawan_22312006");

    try {
      await pegawai.add({
        "no": no_karyawan,
        "nama": nama_karyawan,
        "jabatan": jabatan_karyawan,
      });
      Get.defaultDialog(
          title: "Berhasil",
          middleText: "Berhasil menyimpan data pegawai",
          onConfirm: () {
            cNo.clear();
            cNama.clear();
            cJabatan.clear();
            Get.back();
            Get.back();
            textConfirm: "OK";
          });
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan karyawan.",
      );
    }
  }

  Future<DocumentSnapshot<Object?>> getData(String id) async {
    DocumentReference docRef = firestore.collection("dosen").doc(id);

    return docRef.get();
  }

  void Update(String no_karyawan, String nama_karyawan, String jabatan_karyawan,
      String id) async {
    DocumentReference pegawaiById =
        firestore.collection("Karyawan_22312006").doc(id);

    try {
      await pegawaiById.update({
        "no": no_karyawan,
        "nama": nama_karyawan,
        "jabatan": jabatan_karyawan,
      });

      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil mengubah data Pegawai.",
        onConfirm: () {
          cNo.clear();
          cNama.clear();
          cJabatan.clear();
          Get.back();
          Get.back();
        },
        textConfirm: "OK",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi Kesalahan",
        middleText: "Gagal Menambahkan Pegawai.",
      );
    }
  }

  void delete(String id) {
    DocumentReference docRef =
        firestore.collection("Karyawan_22312006").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin menghapus data ini ?",
        onConfirm: () {
          docRef.delete();
          Get.back();
          Get.defaultDialog(
            title: "Sukses",
            middleText: "Berhasil menghapus data",
          );
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    cNo = TextEditingController();
    cNama = TextEditingController();
    cJabatan = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    cNo.dispose();
    cNama.dispose();
    cJabatan.dispose();
    super.onClose();
  }
}
