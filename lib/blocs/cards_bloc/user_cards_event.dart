import 'package:equatable/equatable.dart';
import 'package:my_bank_project/data/models/card_model.dart';

abstract class UserCardsEvent extends Equatable {}

class AddCardEvent extends UserCardsEvent {
  final CardModel cardModel;

  AddCardEvent(this.cardModel);

  @override
  List<Object?> get props => [cardModel];
}

class UpdateCardEvent extends UserCardsEvent {
  final CardModel cardModel;

  UpdateCardEvent({required this.cardModel});

  @override
  List<Object?> get props => [cardModel];
}

class DeleteCardEvent extends UserCardsEvent {
  final String cardDocId ;

  DeleteCardEvent(this.cardDocId);

  @override
  List<Object?> get props => [cardDocId];
}

class GetCardsByUserId extends UserCardsEvent {
  GetCardsByUserId({required this.userId});

  final String userId;

  @override
  List<Object?> get props => [userId];
}


class GetCardsDatabaseEvent extends UserCardsEvent {
  GetCardsDatabaseEvent();

  @override
  List<Object?> get props => [];
}


