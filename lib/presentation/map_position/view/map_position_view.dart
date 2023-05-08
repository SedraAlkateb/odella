import 'dart:async';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:odella_master/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:odella_master/presentation/map_position/view_model/map_position_view_model.dart';
import 'package:odella_master/presentation/page/home/view_model/home_view_model.dart';
import 'package:odella_master/presentation/resources/assets_manager.dart';
import 'package:odella_master/presentation/resources/color_manager.dart';
import 'package:odella_master/presentation/resources/routes_manager.dart';
import 'package:odella_master/presentation/resources/values_manager.dart';
class MapPositionView extends StatefulWidget {
  const MapPositionView({Key? key}) : super(key: key);
  @override
  _MapPositionViewState createState() => _MapPositionViewState();
}

class _MapPositionViewState extends State<MapPositionView> {

  Completer<GoogleMapController> _controller=Completer();

  static const CameraPosition _initCameraPosition=
  CameraPosition(
      target: LatLng(33.515343,36.289590),
    zoom: 14.4746
   );
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Provider.of<MapPositionViewModel>(context,listen: false).start();
    });
    super.initState();
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.grey[200],
        key: _scaffoldKey,
        body: contentWidget()
    )
    ;
  }
  var provider;
  Widget contentWidget(){
    provider=Provider.of<HomeViewModel>(context,listen: false);
      return Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: GoogleMap(
                  initialCameraPosition: _initCameraPosition,
                  mapType: MapType.normal,
                  onMapCreated: (GoogleMapController controller){
                    _controller.complete(controller);
                  },
                ),
              ),
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppPadding.p16,horizontal: AppPadding.p16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        provider.getLine().name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:Theme.of(context).textTheme.labelLarge,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: AppPadding.p8),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: AppPadding.p8),
                              child: Icon(Icons.circle_sharp,color: ColorManager.icon,size: AppSize.s18,),
                            ),
                            Text(
                              provider.getLine().from?.name ??"",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: AppPadding.p12),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: double.infinity,
                      height: AppSize.s1_5,
                      // color: Color,
                    ),
                    itemCount:provider.getPosition().length,
                    itemBuilder: (context, index) =>index+1==provider.getPosition().length?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.gps_not_fixed,size: AppSize.s18,color: ColorManager.grey,),
                            Padding(
                              padding: const EdgeInsets.only(left: AppPadding.p8),
                              child: Text(
                                provider.getPosition()[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style:Theme.of(context).textTheme.headlineMedium,
                              ),
                            ),

                          ],
                        ),
                        ],
                    )
                        :Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.gps_not_fixed,size: AppSize.s18,color: ColorManager.grey,),
                                Padding(
                                  padding: const EdgeInsets.only(left: AppPadding.p8),
                                  child: Text(
                                    provider.getPosition()[index].name,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,

                                    style:Theme.of(context).textTheme.headlineMedium,
                                  ),
                                ),

                              ],
                            ),
                            Icon(Icons.keyboard_arrow_down_sharp,size: AppSize.s18,color: ColorManager.grey,),
                            Icon(Icons.keyboard_arrow_down_sharp,size: AppSize.s18,color: ColorManager.grey)
                          ],
                        )

                  ),
                ),

                       Padding(
                         padding: const EdgeInsets.symmetric(vertical: AppPadding.p16),
                         child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: AppPadding.p8),
                              child: Icon(Icons.circle_sharp,color: ColorManager.icon,size: AppSize.s18,),
                            ),
                            Text(
                              Provider.of<HomeViewModel>(context).getLine().to?.name ??"",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style:Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                      ),
                       ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p12),
            child: IconButton(
              onPressed: () {
                SchedulerBinding.instance.addPostFrameCallback((_) {
                  Navigator.pushNamed(context,Routes.pageScreen);
                });

              },
              icon:  SvgPicture.asset(

                  ImageAssets.vector,
                  semanticsLabel: 'Acme Logo'

              ),

            ),
          ),

        ],
      );
  }
  MapPositionViewModel  mapPositionViewModel=MapPositionViewModel();
  @override
  void dispose() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      mapPositionViewModel.dispose();
    });
    super.dispose();
  }
}

/*
StreamBuilder<FlowState>(
        stream:
        Provider.of<MapPositionViewModel>(context, listen: false).outputState,
    builder: (context, snapshot) {
    return snapshot.data?.getScreenWidget(_scaffoldKey.currentContext!,  contentWidget(), () {
    Provider.of<MapPositionViewModel>(context, listen: false).start();
    }) ??
    contentWidget();
    })
 */