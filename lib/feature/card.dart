import 'package:appstore/core/utils/component.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/cubit.dart';
import 'package:appstore/feature/Shareit/bloc/cubit_appstore/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sensors_plus/sensors_plus.dart';

class CardesView extends StatelessWidget {
  const CardesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var editingControllName = TextEditingController();
    var editingControllEmail = TextEditingController();
    var editingControllPhone = TextEditingController();

    double posX = 00, posY = 00;
    return BlocConsumer<ShopCubit, StateLoginShop>(
      builder: (context, state) {
        ShopCubit shopCubit = BlocProvider.of(context);

/*        EditingControllPhone.text=  shopCubit.ModelsGetProfile!.data!.phone.toString();
        EditingControllName.text=  shopCubit.ModelsGetProfile!.data!.name.toString();
        EditingControllEmail.text=  shopCubit.ModelsGetProfile!.data!.email.toString();*/

        return Scaffold(
            body: SizedBox(
          height: double.maxFinite,
          child: Stack(
            //   clipBehavior: Clip.antiAlias,

            children: [
              Positioned(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20))),
                  height: 450,
                  width: double.maxFinite,
                ),
              ),
              Positioned(
                top: 100,
                width: 350,
                height: 600,
                child: StreamBuilder<GyroscopeEvent>(
                    stream: SensorsPlatform.instance.gyroscopeEvents,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        posX = posX + (snapshot.data!.x * 0.1);
                        posY = posY + (snapshot.data!.y * 0.1);
                      }
                      return Column(
                        children: [
                          const SizedBox(
                            width: double.infinity,
                            height: 150,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Transform(
                              alignment: FractionalOffset.center,
                              transform: Matrix4.identity()
                                ..rotateX(posX)
                                ..rotateY(posY),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity - 40,
                                    height: 350,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      gradient: LinearGradient(
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [
                                            posY,
                                            posX / posX,
                                            // 0.5,
                                          ],
                                          colors: const [
                                            Colors.white,
                                            Colors.white,
                                          ]),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black38.withOpacity(1),
                                            blurRadius: 17,
                                            spreadRadius: 17,
                                            offset:
                                                Offset(posY * 10, posX * 10)),
                                      ],
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: customTextFormField(
                                              return1null: ' enter name ',
                                              text: "name",
                                              controll: editingControllName),
                                        ),
                                        Expanded(
                                          child: customTextFormField(
                                              return1null: ' enter email  ',
                                              controll: editingControllEmail,
                                              text: "Email"),
                                        ),
                                        Expanded(
                                          child: customTextFormField(
                                            return1null: ' enter phone ',
                                            controll: editingControllPhone,
                                            text: "Phone",
                                          ),
                                        ),
                                        SizedBox(
                                          height: 40,
                                          width: 200,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                shopCubit.funUpdateProfile(
                                                    name: editingControllName
                                                        .text,
                                                    email: editingControllEmail
                                                        .text,
                                                    phone: editingControllPhone
                                                        .text);
                                              },
                                              child:
                                                  const Text("UpdateProfile")),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 5),
                                          height: 40,
                                          width: 200,
                                          alignment:
                                              AlignmentDirectional.bottomEnd,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                funLogOut(context);
                                              },
                                              child: const Text("Login")),
                                        )
                                      ],
                                    ),
                                  ),
                                  Opacity(
                                    opacity: 0.2,
                                    child: Container(
                                      width: double.infinity - 40,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        gradient: LinearGradient(
                                            begin: Alignment.topRight,
                                            end: Alignment.bottomLeft,
                                            stops: [
                                              posY,
                                              posX / posX,
                                              // 0.5,
                                            ],
                                            colors: const [
                                              Colors.white,
                                              Colors.white,
                                            ]),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ));
      },
      listener: (scontext, state) {
        if (state is SeccessfullGetProfile) {
          editingControllName.text = state.name!;
          editingControllEmail.text = state.email!;
          editingControllPhone.text = state.phone!;
        }

        state is SuccessUpdateProfileState
            ? tost(state.message.toString(),
                state.state! ? Colorenum.correct : Colorenum.error)
            : null;
      },
    );
  }
}
