sealed class EditProfileIntent {}

class GetUserInfoIntent extends EditProfileIntent {}

class SubmitEditProfileIntent extends EditProfileIntent {
  final String? username;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phone;

  SubmitEditProfileIntent({
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
  });
}
