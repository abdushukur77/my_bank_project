import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bank_project/blocs/cards_bloc/user_cards_event.dart';
import 'package:my_bank_project/blocs/cards_bloc/user_cards_state.dart';
import '../../data/models/card_model.dart';
import '../../data/models/forms_status.dart';
import '../../data/models/network_response.dart';
import '../../data/repositories/cards_repository.dart';


class CardsBloc extends Bloc<UserCardsEvent, UserCardsState> {
  CardsBloc({required this.cardRepository})
      : super(
    UserCardsState(
      statusMessage: '',
      errorMessage: '',
      status: FormsStatus.pure,
      userCards: [],
      userCardsDB: [],
    ),
  ) {
    on<AddCardEvent>(_addCard);
    on<UpdateCardEvent>(_updateCard);
    on<DeleteCardEvent>(_deleteCard);
    on<GetCardsByUserId>(_listenCard);
    on<GetCardsDatabaseEvent>(_listenCardDatabase);
  }

  final CardsRepository cardRepository;

  _addCard(AddCardEvent event, emit) async {
    NetworkResponse response = await cardRepository.addCard(event.cardModel);

    if (response.errorText.isEmpty) {
      emit(state.copyWith(
          status: FormsStatus.success, statusMessage: "added"));
    } else {
      emit(state.copyWith(
        errorMessage: response.errorText,
        status: FormsStatus.error,
      ));
    }
  }

  _updateCard(UpdateCardEvent event, emit) async {
    NetworkResponse response = await cardRepository.updateCard(event.cardModel);

    if (response.errorText.isEmpty) {
      emit(state.copyWith(status: FormsStatus.success));
    } else {
      emit(state.copyWith(
        errorMessage: response.errorText,
        status: FormsStatus.error,
      ));
    }
  }

  _deleteCard(DeleteCardEvent event, emit) async {
    NetworkResponse response = await cardRepository.deleteCard(event.cardDocId);

    if (response.errorText.isEmpty && response.errorCode.isEmpty) {
      emit(state.copyWith(status: FormsStatus.success));
    } else {
      emit(state.copyWith(
        errorMessage: response.errorText,
        status: FormsStatus.error,
      ));
    }
  }

  _listenCard(GetCardsByUserId event, Emitter emit) async {
    await emit.onEach(cardRepository.getCardsByUserId(event.userId),
        onData: (List<CardModel> userCards) {
          emit(state.copyWith(userCards: userCards));
        });
  }

  _listenCardDatabase(GetCardsDatabaseEvent event, Emitter emit) async {

    await emit.onEach(cardRepository.getCardsDatabase(),
        onData: (List<CardModel> cards) {

      debugPrint("Listing cards URAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
          emit(state.copyWith(userCardsDB: cards));
        });
  }


}