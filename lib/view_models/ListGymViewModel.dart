import 'package:gym_practical/Services/NetworkDataServices.dart';
import 'package:gym_practical/view_models/GymViewModel.dart';

class ListGymViewModel{
    List<GymViewModel>? gymList;
    List<PopularViewModel>? popularList;

    Future<void> fetchGymList() async {

      final apiResult = await NetworkDataServices().getResponse();

      this.gymList = apiResult.map((e) => GymViewModel(e)).toList();


      print("this.gymList == >"+this.gymList.toString());
    }
}