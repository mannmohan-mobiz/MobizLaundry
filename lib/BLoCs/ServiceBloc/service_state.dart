part of 'service_bloc.dart';

abstract class ServiceState extends Equatable {
  const ServiceState();
}

class ServiceInitial extends ServiceState {
  @override
  List<Object> get props => [];
}

