import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:knovatar/app/modules/home/models/model_post.dart';
import '../../../data/api_services/api_end_points.dart';
import '../../../data/api_services/api_service.dart';

class HomeController extends GetxController {

  @override
  Future<void> onInit() async {
    loadPostsFromStorage();
    await getPost();
    generateTimings();
    initialTimers(posts.length);
    super.onInit();
  }

  void loadPostsFromStorage() {
    var storedPosts = localData.read<List>('posts');
    if (storedPosts != null) {
      posts.value = storedPosts.map((post) => ModelPosts.fromJson(post)).toList();
      isLoading.value = false;
    }
  }


  RxBool isLoading = false.obs;

  RxList<ModelPosts> posts = <ModelPosts>[].obs;
  var bgColors = <Rx<Color>>[].obs;

  void initialColors(int itemCount) {
    bgColors.value = List.generate(itemCount, (index) => const Color(0XffFFFFC5).obs);
  }

  void changeBgColor(int index) {
    bgColors[index].value = Colors.white;
    update();
  }

  var timers = <RxInt>[].obs;
  var isTimerRunning = <RxBool>[].obs;
  List<Timer?> activeTimers = [];

  void initialTimers(int itemCount) {
    timers.value = List.generate(itemCount, (index) => generateTimings().obs);
    isTimerRunning.value = List.generate(itemCount, (index) => false.obs);
    activeTimers = List.generate(itemCount, (index) => null);
  }

  int generateTimings() {
    List<int> randomTimes = [10, 20, 25];
    return randomTimes[DateTime.now().millisecondsSinceEpoch % randomTimes.length];
  }


  void startTimer(int index) {
    if (timers[index].value > 0 && !isTimerRunning[index].value) {
      isTimerRunning[index].value = true;
      activeTimers[index] = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (timers[index].value > 0) {
          timers[index].value--;
        } else {
          timer.cancel();
          isTimerRunning[index].value = false;
        }
      });
    }
    update();
  }


  void pauseTimer(int index) {
    if (isTimerRunning[index].value) {
      isTimerRunning[index].value = false;
      activeTimers[index]?.cancel();
    }
    update();
  }



  Future<void> getPost() async {
    var response = await ApiService.apiRequest(url: ApiEndPoints.getPost, requestType: RequestType.get, isLoading: isLoading);

    posts.value = modelPostsFromJson(jsonEncode(response.jsonBody["data"]));
    localData.write('posts', posts.map((post) => post.toJson()).toList());

    initialColors(posts.length);
    update();
  }

}
