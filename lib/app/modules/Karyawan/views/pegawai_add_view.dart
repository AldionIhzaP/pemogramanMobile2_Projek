import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:myapp/app/modules/Karyawan/controllers/pegawai_controller.dart';

class PegawaiAddView extends GetView<PegawaiController> {
  const PegawaiAddView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Karyawan'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNo,
              autocorrect: false,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: "no"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNama,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "nama"),
            ),
            TextField(
              controller: controller.cJabatan,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Jabatan"),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () => controller.add(
                  controller.cNo.text,
                  controller.cNama.text,
                  controller.cJabatan.text,
              ),
              child: Text("Simpan"),
              
            )
          ],
        ),
      ),
    );
  }
}