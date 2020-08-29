import 'package:elis/app/modules/model/profile_model.dart';
import 'package:mobx/mobx.dart';

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  @observable
  ProfileModel profileModel;

  @action
  void setProfile(ProfileModel v) {
    profileModel = v;
  }
}
