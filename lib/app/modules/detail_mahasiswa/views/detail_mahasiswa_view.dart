import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_mahasiswa_controller.dart';

class DetailMahasiswaView extends GetView<DetailMahasiswaController> {
  const DetailMahasiswaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    var nama = arguments['nama'];
    var angkatan = arguments['angkatan'];
    var ipk = arguments['ipk'];
    var prodi = arguments['prodi'];
    var nim = arguments['nim'];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Detail Mahasiswa'),
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 1,
                        offset: const Offset(2, 2),
                      )
                    ]),
                    child: Image.asset(
                      'assets/images/person.jpg',
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    nama,
                    style: const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '$prodi - $angkatan',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                    margin: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Detail Mahasiswa',
                          style: TextStyle(fontSize: 18),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(5),
                                    topLeft: Radius.circular(5)),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Nama'),
                                  Text(nama),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('NIM'),
                                  Text(nim),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Program Studi'),
                                  Text(prodi),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                color: Colors.white,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Angkatan'),
                                  Text(angkatan),
                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 15, 10, 15),
                              decoration: BoxDecoration(
                                border: Border.all(width: 1),
                                color: Colors.white,
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5)),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('IPK'),
                                  Text(ipk),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 5),
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
