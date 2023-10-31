part of 'customer_bloc.dart';

abstract class CustomerState extends Equatable {
  const CustomerState();
}

class CustomerInitial extends CustomerState {
  @override
  List<Object> get props => [];
}

class CustomerBalanceFetching extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CustomerBalanceFetched extends CustomerState {
  final CData c_data;

  CustomerBalanceFetched(this.c_data);

  @override
  List<Object?> get props => [c_data];
}

class CustomerBalanceError extends CustomerState {
  final String message;

  CustomerBalanceError(this.message);

  @override
  List<Object?> get props => [message];
}

class CategoryGettingState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class CategoryGotState extends CustomerState {
  List<CategoryList> cList =[];

  CategoryGotState(this.cList);
  @override
  List<Object?> get props => [cList];
}

class CategoryErrorState extends CustomerState {
  final String message;

  CategoryErrorState(this.message);
  
  @override
  List<Object?> get props => [message];
}

class SubCategoryGettingState extends CustomerState {
  @override
  List<Object?> get props => [];
}

class SubCategoryGotState extends CustomerState {
  List<SubCatList> scList =[];

  SubCategoryGotState(this.scList);
  @override
  List<Object?> get props => [scList];
}

class SubCategoryErrorState extends CustomerState {
  final String message;

  SubCategoryErrorState(this.message);
  
  @override
  List<Object?> get props => [message];
}