part of 'service_bloc.dart';

abstract class ServiceEvent extends Equatable {
  const ServiceEvent();
}

// Complaint List Fetching
class ComplaintListFetchEvent extends ServiceEvent{
  final String token;
  final String id;

  ComplaintListFetchEvent(this.token, this.id);

  @override
  List<Object?> get props => [token, id];
}
