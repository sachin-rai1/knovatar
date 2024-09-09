import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovatar/app/modules/detail_post/views/detail_post_view.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Welcome'),
          centerTitle: true,
        ),
        body: GetBuilder<HomeController>(builder: (logic) {
          return controller.isLoading.isTrue ? const Center(
              child: CircularProgressIndicator()) : ListView.builder(
            itemCount: controller.posts.length,
            itemBuilder: (context, index) {
              final post = controller.posts[index];
              return VisibilityDetector(
                key: Key(index.toString()),
                onVisibilityChanged: (info) {
                  if (info.visibleFraction > 0.5) {
                    controller.startTimer(index);
                  } else {
                    controller.pauseTimer(index);
                  }
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  color: controller.bgColors[index].value,
                  child: ListTile(
                    title: Row(
                      children: [
                        Expanded(child: Text(post.title)),
                        Column(
                          children: [
                            Obx(() {
                              return Text("${controller.timers[index].value}s");
                            }),
                            const Icon(Icons.timer),
                          ],
                        ),
                      ],
                    ),
                    onTap: () {
                      controller.changeBgColor(index);
                      Get.to(() => DetailPostView(), arguments: index + 1);
                    },
                    subtitle: Text(post.body),
                  ),
                ),
              );
            },
          );
        })
    );
  }
}
