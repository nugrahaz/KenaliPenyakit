import 'package:kenalipenyakit/app/models/base_list_response.dart';
import 'package:kenalipenyakit/app/models/information_model.dart';
import 'package:kenalipenyakit/app/services/api_base_helper.dart';

class InformationServices {
  final ApiBaseHelper _helper = ApiBaseHelper();
  static const baseUrl = "https://dikitis.online/api";
  var readInformation = "$baseUrl/information/read_information.php";

  Future<BaseListResponse<Information>> readS() async {
    final resp = await _helper.get(
      url: readInformation,
    );

    var responseData = BaseListResponse<Information>.fromJson(resp, (data) {
      List<Information> list =
          data.map((e) => Information.fromJson(e)).toList();
      return list;
    });

    return BaseListResponse(
      data: responseData.data,
      message: responseData.message,
      isSuccess: responseData.isSuccess,
    );
  }
}
