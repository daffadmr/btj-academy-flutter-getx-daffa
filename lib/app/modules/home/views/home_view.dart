import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>();
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Data Mahasiswa'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
      ),
      body: Obx(
        () => controller.loading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Container(
                    child: ListView.builder(
                        itemCount: controller.data.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => {
                              Get.toNamed(
                                "/detail-mahasiswa",
                                arguments: {
                                  'nama': controller.data[index].nama,
                                  'nim': controller.data[index].nim,
                                  'prodi': controller.data[index].prodi,
                                  'ipk': controller.data[index].ipk,
                                  'angkatan': controller.data[index].angkatan,
                                },
                              ),
                            },
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                  border: Border.all(width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(controller.data[index].nama ?? "-",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        Row(
                                          children: [
                                            Text(controller.data[index].prodi ??
                                                "-"),
                                            const Text(' - '),
                                            Text(controller
                                                    .data[index].angkatan ??
                                                "-"),
                                          ],
                                        )
                                      ],
                                    ),
                                    const Icon(
                                      Icons.navigate_next,
                                    )
                                  ]),
                            ),
                          );
                        }))),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.grey[400],
          child: const Icon(Icons.add),
          onPressed: () {
            Get.defaultDialog(
              onCancel: () => {
                controller.namaController.text = "",
                controller.nimController.text = "",
                controller.ipkController.text = "",
                controller.prodiController.text = "",
                controller.angkatanController.text = ""
              },
              title: 'Add Mahasiswa',
              titlePadding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
              contentPadding: const EdgeInsets.fromLTRB(10, 15, 10, 0),
              content: Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: controller.namaController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'Nama',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: controller.nimController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'NIM',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: controller.prodiController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'Prodi',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: controller.angkatanController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'Angkatan',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: controller.ipkController,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        labelText: 'IPK',
                      ),
                    ),
                  ),
                ],
              ),
              actions: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (controller.namaController.text == "") {
                        Get.defaultDialog(
                            title: "Error", content: Text('Lengkapi input!'));
                      } else if (controller.nimController.text == "") {
                        Get.defaultDialog(
                            title: "Error", content: Text('Lengkapi input!'));
                      } else if (controller.prodiController.text == "") {
                        Get.defaultDialog(
                            title: "Error", content: Text('Lengkapi input!'));
                      } else if (controller.ipkController.text == "") {
                        Get.defaultDialog(
                            title: "Error", content: Text('Lengkapi input!'));
                      } else if (controller.angkatanController.text == "") {
                        Get.defaultDialog(
                            title: "Error", content: Text('Lengkapi input!'));
                      } else {
                        controller.addData();
                      }
                    },
                    child: Text('Simpan'),
                  ),
                )
              ],
            );
          }),
    );
  }
}
