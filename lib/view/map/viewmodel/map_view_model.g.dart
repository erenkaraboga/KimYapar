// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'map_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MapViewModel on _MapViewModelBase, Store {
  late final _$positionAtom =
      Atom(name: '_MapViewModelBase.position', context: context);

  @override
  Position get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Position value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$listAtom =
      Atom(name: '_MapViewModelBase.list', context: context);

  @override
  List<UserModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<UserModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_MapViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getLocationAsyncAction =
      AsyncAction('_MapViewModelBase.getLocation', context: context);

  @override
  Future<void> getLocation() {
    return _$getLocationAsyncAction.run(() => super.getLocation());
  }

  late final _$fetcAllMapsAsyncAction =
      AsyncAction('_MapViewModelBase.fetcAllMaps', context: context);

  @override
  Future<void> fetcAllMaps() {
    return _$fetcAllMapsAsyncAction.run(() => super.fetcAllMaps());
  }

  late final _$_MapViewModelBaseActionController =
      ActionController(name: '_MapViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MapViewModelBaseActionController.startAction(
        name: '_MapViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MapViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
position: ${position},
list: ${list},
isLoading: ${isLoading}
    ''';
  }
}
