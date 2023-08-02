import 'package:enaya_doctor/features/more/model/about_us_model.dart';
import 'package:enaya_doctor/features/more/repository/more_repo.dart';

mixin AboutUsHelper{
  Future<AboutUsModel?>getAboutUs()async{
    AboutUsModel? model;
    await MoreRepo().getAboutUs().then((value){
       model= AboutUsModel.fromList(value.data)[0];
    });
    return model;
  }
}