
import 'package:get/get.dart';
import 'package:knovatar/app/modules/detail_post/models/model_detail_post.dart';

import '../../../data/api_services/api_end_points.dart';
import '../../../data/api_services/api_service.dart';

class DetailPostController extends GetxController {


  Rx<ModelDetailPosts> body = ModelDetailPosts().obs;

  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    var arg = Get.arguments;
    print(arg);
    await getPostById(postId: arg) ;
    super.onInit();

  }
  Future<void> getPostById({required int postId}) async {
    var response = await ApiService.apiRequest(url: ApiEndPoints.getPostById(postId: postId),requestType: RequestType.get,isLoading:isLoading);
    body.value = ModelDetailPosts.fromJson(response.jsonBody);
  }

}
