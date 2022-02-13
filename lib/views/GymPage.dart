import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gym_practical/Services/NetworkDataServices.dart';
import 'package:gym_practical/view_models/ListGymViewModel.dart';

class GymPage extends StatefulWidget {
  const GymPage({Key? key}) : super(key: key);

  @override
  _GymPageState createState() => _GymPageState();
}

class _GymPageState extends State<GymPage> with AutomaticKeepAliveClientMixin<GymPage> {
  ListGymViewModel listGymViewModel = ListGymViewModel();
  int tempIndex = 0;

  List<String> imageList = ["assets/image/gym_rebel.png", "assets/image/gym_non_stop.png", "assets/image/gym_rebel.png"];


  @override
  void initState() {
    // TODO: implement initState
    NetworkDataServices().getResponse();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[100],
        appBar: AppBar(
          // backgroundColor: Common.hexToColor(Common.primary),
          title: Text("GYM"),
          // leading: IconButton(
          //   icon: Icon(Icons.arrow_back),
          //   onPressed: () => Navigator.pop(context),
          // ),
        ),
        body: FutureBuilder(
            future: listGymViewModel.fetchGymList(),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator());
              }else if(snapshot.hasError){
                return Center(child: Text("Something went Wrong"));
              }
              else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top : 5.0, bottom : 5.0),
                      child: Text("Recommended Gyms", style: TextStyle(fontWeight: FontWeight.w500,fontSize: MediaQuery.of(context).size.height / 25 )),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left : 8.0, right: 8.0),
                        child: ListView.builder(
                            key : PageStorageKey<String>('scroll'),
                            reverse: false,
                            scrollDirection : Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: listGymViewModel.gymList!.length,
                            itemBuilder: (BuildContext context, int index) {
                              var gym = listGymViewModel.gymList![index];
                              return GestureDetector(
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Stack(
                                      alignment: Alignment.topRight,
                                        children: [
                                          Container(
                                          width: MediaQuery.of(context).size.width / 1.7,
                                          child: Card(
                                          child: Column(
                                            children: [
                                              // Image.asset("assets/image/map.png",fit: BoxFit.fill,),
                                              Image.asset(
                                                imageList[index],
                                                fit: BoxFit.fill,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Container(
                                                      child: Text(gym.title!, textAlign: TextAlign.center,),
                                                    ),
                                                    Container(
                                                      child: Text(gym.price!  +'\n/day', style: TextStyle(color: Colors.blue),),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(left : 5.0, right : 5.0),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          child:  Icon(
                                                            Icons.star,
                                                            size: 20,
                                                            color: Colors.yellow,
                                                          ),
                                                        ),
                                                        SizedBox(width : 6.0),
                                                        Container(
                                                          child: Text(gym.rating.toString()),
                                                        )
                                                      ],
                                                    ),
                                                    Text(gym.date.toString())
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                          gym.favorite == true ?  Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: SvgPicture.asset(
                                              "assets/svImages/favorite_selected.svg",
                                              placeholderBuilder: (context) => CircularProgressIndicator(),
                                              height: 30.0,
                                            ),
                                          ) : Padding(
                                            padding: const EdgeInsets.all(17.0),
                                            child: SvgPicture.asset(
                                              "assets/svImages/favorite.svg",
                                              placeholderBuilder: (context) => CircularProgressIndicator(),
                                              height: 30.0,
                                            ),
                                          ),
                                    ])),
                                onTap: (){
                                  setState(() {
                                    tempIndex = index;
                                  });
                                },
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, top : 5.0, bottom : 5.0),
                      child: Text("Popular Classes", style: TextStyle(fontWeight: FontWeight.w500,fontSize: MediaQuery.of(context).size.height / 25 )),
                    ),
                    Expanded(
                      flex: 3,
                      child: ListView.builder(
                          reverse: false,
                          scrollDirection : Axis.vertical,
                          shrinkWrap: true,
                          itemCount: listGymViewModel.gymList![tempIndex].popularClasses!.length,
                          itemBuilder: (BuildContext context, int index) {
                            var gym = listGymViewModel.gymList![tempIndex].popularClasses!;
                            return Padding(
                              padding: const EdgeInsets.only(left :8.0, right: 8.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Stack(
                                      children: [
                                      Container(
                                      width: MediaQuery.of(context).size.width,
                                      child: Card(
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Image.asset(
                                                gym[index].image!,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Row(
                                                      children: [
                                                        Expanded( child: Text(gym[index].title!, style: TextStyle(fontSize: MediaQuery.of(context).size.width / 20 ),)),
                                                        Padding(
                                                          padding: const EdgeInsets.all(5.0),
                                                          child: Text(gym[index].price! +'\n/day', style: TextStyle(color: Colors.blue),),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.pin_drop_rounded, color: Colors.blue,),
                                                        SizedBox(width: 5.0),
                                                        Text(gym[index].location!),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.all(5.0),
                                                    child: Row(
                                                      children: [
                                                        Icon(Icons.access_time, color: Colors.blue,size: 20,),
                                                        SizedBox(width: 5.0),
                                                        Text(gym[index].time!),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                            // Padding(
                                            //   padding: const EdgeInsets.all(8.0),
                                            //   child: Row(
                                            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            //     children: [
                                            //       Container(
                                            //         child: Text(gym.title!, textAlign: TextAlign.center,),
                                            //       ),
                                            //       Container(
                                            //         child: Text(gym.price.toString()  +'\n/day'),
                                            //       )
                                            //     ],
                                            //   ),
                                            // ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ])),
                            );
                          }),
                    ),
                  ],
                );
              }

            }
        )
    );

  }

  @override
  bool get wantKeepAlive => true;
}
