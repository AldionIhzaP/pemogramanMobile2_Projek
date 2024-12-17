import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/app/modules/Karyawan/controllers/pegawai_controller.dart';
import 'package:myapp/app/modules/Karyawan/views/pegawai_update_view.dart';


class PegawaiView extends GetView<PegawaiController> {
  void showOption(id) async {
    await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              // Implement update functionality here
              Get.back();
              Get.to(
                PegawaiUpdateView(),
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.delete(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Object?>>(
      stream: Get.put(PegawaiController()).streamData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          // Mengambil data dari Firestore
          var listAllDocs = snapshot.data?.docs ?? [];
          return listAllDocs.isNotEmpty
              ? ListView.builder(
                  itemCount: listAllDocs.length,
                  itemBuilder: (context, index) {
                    // Mendapatkan data dari Firestore
                    var data =
                        listAllDocs[index].data() as Map<String, dynamic>;

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Color.fromARGB(255, 248, 248, 248),
                      ),
                      // title: Text("${data["nama"]}"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" ${data["no"]}"),
                          Text(" ${data["nama"]}"),
                          Text(" ${data["jabatan"]}"),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () => showOption(listAllDocs[index].id),
                        icon: Icon(Icons.more_vert),
                      ),
                    );
                  },
                )
              : Center(
                  child: Text("Data Kosong"),
                );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}