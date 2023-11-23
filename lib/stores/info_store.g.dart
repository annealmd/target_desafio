// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfoStore on InfoStoreBase, Store {
  Computed<ObservableList<String>>? _$infoListComputed;

  @override
  ObservableList<String> get infoList => (_$infoListComputed ??=
          Computed<ObservableList<String>>(() => super.infoList,
              name: 'InfoStoreBase.infoList'))
      .value;

  late final _$_infoListAtom =
      Atom(name: 'InfoStoreBase._infoList', context: context);

  @override
  ObservableList<String> get _infoList {
    _$_infoListAtom.reportRead();
    return super._infoList;
  }

  @override
  set _infoList(ObservableList<String> value) {
    _$_infoListAtom.reportWrite(value, super._infoList, () {
      super._infoList = value;
    });
  }

  late final _$addInfoAsyncAction =
      AsyncAction('InfoStoreBase.addInfo', context: context);

  @override
  Future<void> addInfo(String info) {
    return _$addInfoAsyncAction.run(() => super.addInfo(info));
  }

  late final _$editInfoAsyncAction =
      AsyncAction('InfoStoreBase.editInfo', context: context);

  @override
  Future<void> editInfo(int index, String info) {
    return _$editInfoAsyncAction.run(() => super.editInfo(index, info));
  }

  late final _$deleteInfoAsyncAction =
      AsyncAction('InfoStoreBase.deleteInfo', context: context);

  @override
  Future<void> deleteInfo(int index) {
    return _$deleteInfoAsyncAction.run(() => super.deleteInfo(index));
  }

  @override
  String toString() {
    return '''
infoList: ${infoList}
    ''';
  }
}
