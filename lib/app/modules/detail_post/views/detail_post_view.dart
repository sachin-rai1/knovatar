import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_post_controller.dart';

class DetailPostView extends GetView<DetailPostController> {
  DetailPostView({super.key});

  final detailPostController = Get.put(DetailPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailPostView'),
        centerTitle: true,
      ),
      body: Obx(() {
        return controller.isLoading.isTrue?const Center(child: CircularProgressIndicator()): ListTile(
          title: Text(controller.body.value.title ?? ""),
          subtitle: Text(controller.body.value.body ?? ""),
        );
      }),
    );
  }
}
