import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_cli_demo/app/data/models/mahasiswa_model.dart';
import 'package:get_cli_demo/app/data/providers/mahasiswa_provider.dart';

class HomeController extends GetxController {
  MahasiswaProvider _provider = Get.find<MahasiswaProvider>();

  TextEditingController namaController = TextEditingController();
  TextEditingController nimController = TextEditingController();
  TextEditingController prodiController = TextEditingController();
  TextEditingController ipkController = TextEditingController();
  TextEditingController angkatanController = TextEditingController();

  final count = 0.obs;
  RxList<Mahasiswa> data = <Mahasiswa>[].obs;
  RxBool loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    showData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    namaController.dispose();
    nimController.dispose();
    ipkController.dispose();
    angkatanController.dispose();
    prodiController.dispose();
    super.onClose();
  }

  void increment() => count.value++;

  showData() async {
    loading(true);
    try {
      await _provider.getDataMahasiswa().then((value) async {
        await value.body.entries.map((element) {
          var temp = Mahasiswa.fromJson(element.value);
          data.add(temp);
        }).toList();
        loading(false);
      });
    } catch (error) {
      print(error);
    }
  }

  addData() async {
    try {
      await _provider
          .postMahasiswa(Mahasiswa(
              ipk: ipkController.text,
              nama: namaController.text,
              nim: nimController.text,
              prodi: prodiController.text,
              angkatan: angkatanController.text))
          .then((value) {
        data.clear();
        showData();
        Get.back();
        namaController.clear();
        nimController.clear();
        prodiController.clear();
        ipkController.clear();
        angkatanController.clear();
      });
    } catch (e) {
      print(e);
    }
  }
}
