import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:odella_master/app/di.dart';
import 'package:odella_master/presentation/common/state_renderer/state_renderer_imp.dart';
import 'package:odella_master/presentation/resources/assets_manager.dart';
import 'package:odella_master/presentation/resources/color_manager.dart';
import 'package:odella_master/presentation/resources/routes_manager.dart';
import 'package:odella_master/presentation/resources/strings_manager.dart';
import 'package:odella_master/presentation/resources/values_manager.dart';
import 'package:odella_master/presentation/signup/view_model/signup_view_model.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SignUpView extends StatefulWidget {
  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  SignUpViewModel _signUpViewModel=instance();
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _signUpViewModel=  Provider.of<SignUpViewModel>(context, listen: false);
      _signUpViewModel.start();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_getContentWidget(context)
    );
  }

  Widget _getContentWidget(BuildContext context) {
    var _register2 = Provider.of<SignUpViewModel>(context, listen: false);
    var _register1 = Provider.of<SignUpViewModel>(context);
    if (_register2.isLog == true) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _register2.isLog = false;
        Navigator.pushNamed(context, Routes.afterSignUp);
      });
    }
    return Form(
      key: _globalKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Stack(
                alignment: Alignment.topLeft,
                children: [

                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(AppSize.s50),
                        bottomLeft: Radius.circular(AppSize.s50),
                      ),
                      child: Container(
                        color: ColorManager.icon,
                        width: double.infinity,
                        //    height: double.maxFinite,
                        child: Provider.of<SignUpViewModel>(context).getImage() !=
                                null
                            ? Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p50),
                                child: InkWell(
                                  onTap: () => _register2.setImageFromGallory(),
                                  child: Container(
                                      width: 160.0,
                                      height: 160.0,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.grey[300],
                                          image: DecorationImage(
                                            fit: BoxFit.contain,
                                            image: FileImage(
                                              Provider.of<SignUpViewModel>(context)
                                                  .getImage()!,
                                            ),
                                          ))),
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppPadding.p50),
                                child: InkWell(
                                  onTap: () => _register2.setImageFromGallory(),
                                  child: Container(
                                      width: 160,
                                      height: 160,
                                      decoration: BoxDecoration(
                                        color: Colors.grey[300],
                                        shape: BoxShape.circle,
                                      ),
                                      child: const Icon(Icons.add,
                                          size: 50, color: Color(0xFFFFFFFF))),
                                ),
                              ),
                      )),
                  _register2.getNum() == 2

                      ? Padding(
                        padding: const EdgeInsets.only(top: AppPadding.p16,left: AppPadding.p8),
                        child: IconButton(
                        onPressed: () {
                          _register2.setNum(1);

                        },
                        icon: Icon(Icons.west,color: ColorManager.gr,)

                  ),
                      ):Container(),
                ],
              ),
            ),
            _register2.getNum() == 0
                ? Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p28,
                            right: AppPadding.p28,
                            bottom: AppPadding.p28,
                            top: AppPadding.p60),
                        child: TextFormField(
                          controller: _firstNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringsManager.errorFirstName;
                            } else {
                              _register2.setFirstName(value);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: StringsManager.eFirstName,
                            labelText: StringsManager.eFirstName,
                            prefixIcon: Icon(
                              Icons.perm_identity,
                              color: ColorManager.kMainColor,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p28,
                            right: AppPadding.p28,
                            bottom: AppPadding.p28),
                        child: TextFormField(
                          controller: _lastNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringsManager.errorLastName;
                            } else {
                              _register2.setLastName(value);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: StringsManager.eLastName,
                            labelText: StringsManager.eLastName,
                            prefixIcon: Icon(
                              Icons.perm_identity,
                              color: ColorManager.kMainColor,
                            ),
                            //   fillColor: ColorManager.kMainColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p28,
                            right: AppPadding.p28,
                            bottom: AppPadding.p28),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringsManager.errorEmail;
                            } else {
                              _register2.setEmail(value);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: StringsManager.eEmail,
                            labelText: StringsManager.eEmail,
                            prefixIcon: Icon(
                              Icons.email,
                              color: ColorManager.kMainColor,
                            ),
                            //   fillColor: ColorManager.kMainColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p28,
                            right: AppPadding.p28,
                            bottom: AppPadding.p28),
                        child: TextFormField(
                          keyboardType: TextInputType.visiblePassword,
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringsManager.errorPassword;
                            } else {
                              _register2.setPassword(value);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: StringsManager.ePassword,
                            labelText: StringsManager.ePassword,
                            prefixIcon: Icon(
                              Icons.lock,
                              color: ColorManager.kMainColor,
                            ),
                            //   fillColor: ColorManager.kMainColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: AppPadding.p28,
                            right: AppPadding.p28,
                            bottom: AppPadding.p28),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: _phoneNumberController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return StringsManager.errorPhoneNumber;
                            } else {
                              _register2.setPhoneNumber(value);
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: StringsManager.ePhoneNumber,
                            labelText: StringsManager.ePhoneNumber,
                            prefixIcon: Icon(
                              Icons.local_phone,
                              color: ColorManager.kMainColor,
                            ),
                            //   fillColor: ColorManager.kMainColor,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p28),
                        child: InkWell(
                          onTap: () {
                            if (_globalKey.currentState!.validate()) {
                              _register2.setNum(1);
                            }
                          },
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: CircleAvatar(
                                radius: 30,
                                backgroundColor: ColorManager.icon,
                                child: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  color: ColorManager.white,
                                  size: 60,
                                )),
                          ),
                        ),
                      ),
                    ],
                  )
                : _register2.getNum() == 1
                    ? Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: AppPadding.p28,
                                right: AppPadding.p28,
                                bottom: AppPadding.p28,
                                top: AppPadding.p60),
                            child: Text(
                              " your information",
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: AppPadding.p28,
                              right: AppPadding.p28,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppPadding.p28),
                                  child: DropdownButtonFormField(
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      hint: const Text(
                                          StringsManager.transportationLines),
                                      validator: (value) {
                                        if (value == null) {
                                          return StringsManager
                                              .transportationLines;
                                        }
                                        //  return null;
                                      },
                                      items: _register1
                                          .getDataTransportationLines()
                                          .map((e) => DropdownMenuItem(
                                                value: e.id,
                                                child: Text(" ${e.name}"),

                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        _register2
                                            .setTransportationLineId(val!);
                                        Provider.of<SignUpViewModel>(context,
                                                listen: false)
                                            .getPositionLineData(val);
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppPadding.p28),
                                  child: DropdownButtonFormField(
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      hint: const Text(
                                          StringsManager.transferPositions),
                                      validator: (value) {
                                        if (value == null) {
                                          return StringsManager
                                              .transferPositions;
                                        }
                                        return null;
                                      },
                                      items: _register1
                                          .getPosition()
                                          .map((e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(" ${e.name}"),
                                              ))
                                          .toList(),

                                      onChanged: (val) {
                                        _register2.setTransferPositionId(val!.id);

                                      },
                                      ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppPadding.p28),
                                  child: DropdownButtonFormField(
                                      icon:
                                          const Icon(Icons.keyboard_arrow_down),
                                      hint: const Text(
                                          StringsManager.universities),
                                      validator: (value) {
                                        if (value == null) {
                                          return StringsManager.universities;
                                        }
                                        return null;
                                      },
                                      items: _register1
                                          .getUniversities()
                                          .map((e) => DropdownMenuItem(
                                                value: e.id,
                                                child: Text(" ${e.name}"),
                                              ))
                                          .toList(),
                                      onChanged: (val) {
                                        _register2.setUniversityId(val!);
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: AppPadding.p28
                                  ),child: Container(
                                  width: double.infinity,
                                  height: AppSize.s0_5,
                                  color: ColorManager.icon,
                                ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppPadding.p28),
                                  child: DropdownButtonFormField(
                                      icon:
                                      const Icon(Icons.keyboard_arrow_down),
                                      hint: const Text(
                                          StringsManager.cities),
                                      validator: (value) {
                                        if (value == null) {
                                          return StringsManager
                                              .eCities;
                                        }
                                        //  return null;
                                      },
                                      items: _register1
                                          .getCities()
                                          .map((e) => DropdownMenuItem(
                                        value: e.id,
                                        child: Text(" ${e.name}"),
                                      ))
                                          .toList(),
                                      onChanged: (val) {
                                        _register2
                                            .setCityId(val!);
                                        Provider.of<SignUpViewModel>(context,
                                            listen: false)
                                            .getAreasByIdCity(val);
                                      }),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: AppPadding.p28),
                                  child: DropdownButtonFormField(
                                      icon:
                                      const Icon(Icons.keyboard_arrow_down),
                                      hint: const Text(
                                          StringsManager.areas),
                                      validator: (value) {
                                        if (value == null) {
                                          return StringsManager
                                              .eAreas;
                                        }
                                        return null;
                                      },
                                      items: _register1
                                          .getAreas()
                                          .map((e) => DropdownMenuItem(
                                        value: e.name,
                                        child: Text(" ${e.name}"),
                                      ))
                                          .toList(),
                                      onChanged: (val) {
                                        print(val);
                                 //       _register2.setAreaId(val!);
                                      }),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppPadding.p28,vertical: AppPadding.p28),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                             //       if (_globalKey.currentState!.validate()) {
                                      _register2.setNum(0);
                               //     }
                                  },
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: ColorManager.icon,
                                        child: Icon(
                                          Icons.keyboard_arrow_left_rounded,
                                          color: ColorManager.white,
                                          size: 60,
                                        )),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    if (_globalKey.currentState!.validate()) {
                                      _register2.setNum(2);
                                   }
                                  },
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: CircleAvatar(
                                        radius: 30,
                                        backgroundColor: ColorManager.icon,
                                        child: Icon(
                                          Icons.keyboard_arrow_right_rounded,
                                          color: ColorManager.white,
                                          size: 60,
                                        )),
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p18,
                            vertical: AppPadding.p28),
                        child: Column(
                          children: [
                            Container(
                              height: AppSize.s50,
                              decoration: BoxDecoration(
                                color: ColorManager.card,
                                borderRadius:
                                    BorderRadius.circular(AppSize.s18),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Text(
                                    "Subscription",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )),
                                  Container(
                                    width: 1.0,
                                    color: Colors.grey[200],
                                  ),
                                  Expanded(
                                      child: Text(
                                    "DayNumber",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )),
                                  Container(
                                    width: 1.0,
                                    color: Colors.grey[200],
                                  ),
                                  Expanded(
                                      child: Text(
                                    "Price",
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.titleMedium,
                                  )),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 400,
                              child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  separatorBuilder: (context, index) =>
                                      Container(
                                        width: double.infinity,
                                        height: AppSize.s8,
                                        color: Colors.white,
                                      ),
                                  itemCount:
                                      _register2.getDataSubscriptions().length,
                                  itemBuilder: (context, index) => _register1
                                              .getC() ==
                                          index
                                      ? Container(
                                          height: AppSize.s50,
                                          decoration: BoxDecoration(
                                            color: ColorManager.card,
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s18),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _register1
                                                          .getDataSubscriptions()[
                                                              index]
                                                          .name,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                width: 2.0,
                                                color: Colors.grey[200],
                                              ),
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _register1
                                                          .getDataSubscriptions()[
                                                              index]
                                                          .daysNumber,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                color: Colors.grey[200],
                                                width: 2.0,
                                              ),
                                              Expanded(
                                                child: Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      _register1
                                                          .getDataSubscriptions()[
                                                              index]
                                                          .price,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .displayLarge,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Container(
                                          height: AppSize.s50,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(
                                                AppSize.s18),
                                          ),
                                          child: InkWell(
                                            onTap: (() {
                                              _register2.setC(
                                                  index,
                                                  _register2
                                                      .getDataSubscriptions()[
                                                          index]
                                                      .id);
                                            }),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _register2
                                                            .getDataSubscriptions()[
                                                                index]
                                                            .name,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width: 2.0,
                                                  color: Colors.grey[200],
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _register2
                                                            .getDataSubscriptions()[
                                                                index]
                                                            .daysNumber,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  color: Colors.grey[200],
                                                  width: 2.0,
                                                ),
                                                Expanded(
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        _register2
                                                            .getDataSubscriptions()[
                                                                index]
                                                            .price,
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Theme.of(context)
                                                            .textTheme
                                                            .displayLarge,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: AppPadding.p28,
                                  right: AppPadding.p28,
                                  top: AppPadding.p28),
                              child: SizedBox(
                                width: double.infinity,
                                height: AppSize.s64,
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (_globalKey.currentState!.validate()) {
                                        _register2.getSignUp();
                                      }
                                    },
                                    child: const Text(StringsManager.signUp)),
                              ),
                            ),
                          ],
                        ),
                      ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _signUpViewModel.dispose();

    });
    super.dispose();
  }
}
/*
 StreamBuilder<FlowState>(
          stream:
              Provider.of<SignUpViewModel>(context, listen: false).outputState,
          builder: (context, snapshot) {
            return snapshot.data
                    ?.getScreenWidget(context, _getContentWidget(context), () {
                  Provider.of<SignUpViewModel>(context, listen: false)
                      .getSignUp();
                }) ??
                _getContentWidget(context);
          }),
 */