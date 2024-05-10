import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/blocs/cards_bloc/user_cards_event.dart';
import 'package:my_bank_project/screen/tab/card/widget/global_button.dart';
import 'package:my_utils/my_utils.dart';

import '../../../blocs/cards_bloc/user_cards_bloc.dart';
import '../../../blocs/cards_bloc/user_cards_state.dart';
import '../../../blocs/user_profile/user_profile_bloc.dart';
import '../../../utils/colors/app_colors.dart';
import '../../routes.dart';


double wd = 0;

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  void initState() {
    debugPrint(
        '---------- ${context.read<UserProfileBloc>().state.userModel.userId} -----------');

    Future.microtask(() => {
      context.read<CardsBloc>().add(GetCardsByUserId(
          userId: context.read<UserProfileBloc>().state.userModel.userId)),
      context.read<CardsBloc>().add(GetCardsDatabaseEvent()),
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wd = MediaQuery.of(context).size.width;
    debugPrint('=========== $wd ============');
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text(
          "Bank Bank",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RouteNames.addCardScreen);
            },
            icon: const Icon(Icons.add, color: Colors.black),
          ),
        ],
      ),
      body: BlocBuilder<CardsBloc, UserCardsState>(
        builder: (context, state) {
          if (state.userCardsDB.isEmpty) {
            return Center(
                child: Icon(Icons.insert_emoticon_sharp, size: 150 ));
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height:20),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    state.userCardsDB.length,
                        (index) => Container(
                      margin: EdgeInsets.symmetric(
                          horizontal: 15 , vertical: 8 ),
                      width: 280.w ,
                      padding: EdgeInsets.symmetric(
                          vertical: 15.h , horizontal: 15.w ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16 ),
                        color: state.userCardsDB[index].color != ''
                            ? Color(int.parse(
                            "0xff${state.userCardsDB[index].color}"))
                            : Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4 ,
                            color: Colors.black.withOpacity(.8),
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          state.userCardsDB[index].type == 1
                              ? Image.network(
                            "https://humocard.uz/upload/medialibrary/208/8x0p9hi3h9jww0flwdm92dayhn0flulj/humo-logo-more.png",
                            fit: BoxFit.cover,
                            width: 40.w ,
                            height: 30.h ,
                          )
                              : const SizedBox(),
                          SizedBox(height:10.h),
                          Text(
                            state.userCardsDB[index].cardNumber,
                            style: TextStyle(
                              fontSize: 18.w ,
                              color: Colors.white,
                            ),
                          ),
                    SizedBox(height:10.w),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                      fontSize: 12.w ,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    state.userCardsDB[index].cardHolder,
                                    style: TextStyle(
                                      fontSize: 18 ,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Valid Till",
                                    style: TextStyle(
                                      fontSize: 12 ,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    state.userCardsDB[index].expireDate,
                                    style: TextStyle(
                                      fontSize: 18 ,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
             SizedBox(height:10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(
                    state.userCardsDB.length,
                        (index) => Container(
                      height: 8 ,
                      width: 8 ,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            SizedBox(height:10),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GlobalButtons(
                      icons: const Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                        size: 30,
                      ),
                      voidCallback: () {},
                      title: 'Sent',
                    ),
                    GlobalButtons(
                      icons: const Icon(
                        Icons.arrow_downward_rounded,
                        color: Colors.green,
                        size: 30,
                      ),
                      voidCallback: () {},
                      title: 'Receive',
                    ),
                    GlobalButtons(
                      icons: const Icon(
                        Icons.forward_5,
                        color: Colors.white,
                        size: 30,
                      ),
                      voidCallback: () {},
                      title: 'Top up',
                    ),
                    GlobalButtons(
                      icons: const Icon(
                        Icons.qr_code,
                        color: Colors.white,
                        size: 30,
                      ),
                      voidCallback: () {},
                      title: 'Payment',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 7 ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "  Recent Activities",
                      style: TextStyle(
                        fontSize: 22 ,
                        color: Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}