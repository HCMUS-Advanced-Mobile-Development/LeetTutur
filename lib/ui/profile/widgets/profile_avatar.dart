import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:leet_tutur/models/user.dart';
import 'package:leet_tutur/stores/user_store.dart';

class ProfileAvatar extends StatelessWidget {
  final _userStore = GetIt.instance.get<UserStore>();

  final User user;
  final _picker = ImagePicker();

  ProfileAvatar({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _handleSelectAvatar,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width * 0.2,
            backgroundImage: Image.network(
              user.avatar ?? "",
            ).image,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(user.name ?? "", style: Theme.of(context).textTheme.headline5)
      ],
    );
  }

  Future _handleSelectAvatar() async {
    var img = await _picker.pickImage(source: ImageSource.gallery);
    if (img != null) {
      await _userStore.updateAvatarAsync(img.path);
    }
  }
}
