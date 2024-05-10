import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/blocs/cards_bloc/user_cards_bloc.dart';
import 'package:my_bank_project/blocs/cards_bloc/user_cards_event.dart';
import 'package:my_bank_project/blocs/cards_bloc/user_cards_state.dart';
import 'package:my_bank_project/data/models/card_model.dart';
import 'package:my_bank_project/data/models/forms_status.dart';
import 'package:my_bank_project/screen/auth/widget/login_button.dart';
import 'package:my_bank_project/screen/tab/card/widget/text_card_field.dart';
import 'package:my_utils/my_utils.dart';

import '../../../utils/constants/app_constants.dart';
import '../../../utils/images/app_images.dart';
import '../../auth/widget/test_field_widget.dart';

class AddCardScreen extends StatelessWidget {
  AddCardScreen({super.key});

  TextEditingController cardController = TextEditingController();
  TextEditingController expireController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<CardsBloc, UserCardsState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 80.h),
                TextCardField(
                    cnt: cardController,
                    typew: TextInputType.number,
                    hint: "Card Number"),
                SizedBox(height: 20.h),
                TextCardField(
                    cnt: expireController,
                    typew: TextInputType.text,
                    hint: "Expire Date"),
                SizedBox(height: 20.h),
                LogInButton(
                    title: "Add Card",
                    onTap: () {
                      List<CardModel> db = state.userCardsDB;
                      List<CardModel> myCards = state.userCards;

                      bool isExist = false;

                      for (var element in myCards) {
                        if (element.cardNumber == cardController.text) {
                          isExist = true;
                        }
                      }
                      CardModel? cardModel;

                      bool hasInDb = false;

                      for (var element in db) {
                        if (element.cardNumber == cardController.text) {
                          hasInDb = true;
                          cardModel = element;
                        }
                      }

                      if ((!isExist) && (hasInDb)) {
                        context.read<CardsBloc>().add(AddCardEvent(cardModel!));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                "Karta allaqachon Mavjud yoki bazada mavjud emas")));
                      }
                    },
                    isLoading: state.status == FormsStatus.loading,
                    isReady: true)
              ],
            ),
          );
        },
        listener: (BuildContext context, UserCardsState state) {
          if (state.statusMessage == "addaed") {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
