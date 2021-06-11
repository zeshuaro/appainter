part of 'home_cubit.dart';

enum EditMode { basic, advanced }

@CopyWith()
@immutable
class HomeState extends Equatable {
  final EditMode editMode;

  const HomeState({this.editMode = EditMode.basic});

  @override
  List<Object> get props => [editMode];
}
