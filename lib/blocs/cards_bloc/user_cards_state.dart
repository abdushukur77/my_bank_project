import 'package:equatable/equatable.dart';

import '../../data/models/card_model.dart';
import '../../data/models/forms_status.dart';

class UserCardsState extends Equatable {
  final List<CardModel> userCards;
  final FormsStatus status;
  final String errorMessage;
  final String statusMessage;
  final List<CardModel> userCardsDB;

  UserCardsState({
    required this.userCardsDB,
    required this.userCards,
    required this.status,
    required this.errorMessage,
    required this.statusMessage,
  });

  UserCardsState copyWith({
    List<CardModel>? userCards,
    FormsStatus? status,
    String? errorMessage,
    String? statusMessage,
    List<CardModel>? userCardsDB,
  }) {
    return UserCardsState(
      userCards: userCards ?? this.userCards,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      statusMessage: statusMessage ?? this.statusMessage,
      userCardsDB: userCardsDB ?? this.userCardsDB,
    );
  }

  @override
  List<Object?> get props => [
        status,
        statusMessage,
        errorMessage,
        userCards,
        userCardsDB,
      ];
}
