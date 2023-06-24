import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../app/app_barrel.dart';

class profilePicture extends StatelessWidget {
  const profilePicture.tiny({
    Key? key,
    required this.maalfUser,
  })  : _profilepictureSize = _tinyprofilePictureSize,
        _coloredCircle = _tinyColoredCircle,
        hasNewStory = false,
        fontSize = 12,
        isThumbnail = true,
        super(key: key);

  const profilePicture.small({
    Key? key,
    required this.maalfUser,
  })  : _profilepictureSize = _smallprofilePictureSize,
        _coloredCircle = _smallColoredCircle,
        hasNewStory = false,
        fontSize = 14,
        isThumbnail = true,
        super(key: key);

  const profilePicture.medium({
    Key? key,
    this.hasNewStory = false,
    required this.maalfUser,
  })  : _profilepictureSize = _mediumprofilePictureSize,
        _coloredCircle = _mediumColoredCircle,
        fontSize = 20,
        isThumbnail = true,
        super(key: key);

  const profilePicture.big({
    Key? key,
    this.hasNewStory = false,
    required this.maalfUser,
  })  : _profilepictureSize = _largeprofilePictureSize,
        _coloredCircle = _largeColoredCircle,
        fontSize = 26,
        isThumbnail = false,
        super(key: key);

  const profilePicture.huge({
    Key? key,
    this.hasNewStory = false,
    required this.maalfUser,
  })  : _profilepictureSize = _hugeprofilePictureSize,
        _coloredCircle = _hugeColoredCircle,
        fontSize = 30,
        isThumbnail = false,
        super(key: key);

  final bool hasNewStory;

  final MaalfUser maalfUser;

  final double fontSize;

  final double _profilepictureSize;
  final double _coloredCircle;

  static const _tinyprofilePictureSize = 22.0;
  static const _tinyPaddedCircle = _tinyprofilePictureSize + 2;
  static const _tinyColoredCircle = _tinyPaddedCircle * 2 + 4;

  static const _smallprofilePictureSize = 30.0;
  static const _smallPaddedCircle = _smallprofilePictureSize + 2;
  static const _smallColoredCircle = _smallPaddedCircle * 2 + 4;

  static const _mediumprofilePictureSize = 40.0;
  static const _mediumPaddedCircle = _mediumprofilePictureSize + 2;
  static const _mediumColoredCircle = _mediumPaddedCircle * 2 + 4;

  static const _largeprofilePictureSize = 90.0;
  static const _largPaddedCircle = _largeprofilePictureSize + 2;
  static const _largeColoredCircle = _largPaddedCircle * 2 + 4;

  static const _hugeprofilePictureSize = 120.0;
  static const _hugePaddedCircle = _hugeprofilePictureSize + 2;
  static const _hugeColoredCircle = _hugePaddedCircle * 2 + 4;

  final bool isThumbnail;

  @override
  Widget build(BuildContext context) {
    final picture = _CircularProfilePicture(
      size: _profilepictureSize,
      userData: maalfUser,
      fontSize: fontSize,
      isThumbnail: isThumbnail,
    );

    if (!hasNewStory) {
      return picture;
    }
    return Container(
      width: _coloredCircle,
      height: _coloredCircle,
      decoration: const BoxDecoration(
        color: Colors.red,
        shape: BoxShape.circle,
      ),
      child: Center(child: picture),
    );
  }
}

class _CircularProfilePicture extends StatelessWidget {
  const _CircularProfilePicture({
    Key? key,
    required this.size,
    required this.userData,
    required this.fontSize,
    this.isThumbnail = false,
  }) : super(key: key);

  final MaalfUser userData;

  final double size;
  final double fontSize;

  final bool isThumbnail;

  @override
  Widget build(BuildContext context) {
    final profilePhoto = isThumbnail
        ? userData.profilePhotoThumbnail
        : userData.profilePhotoResized;

    return (profilePhoto == null)
        ? Container(
            width: size,
            height: size,
            decoration: const BoxDecoration(
              color: AppColors.secondary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '${userData.firstName[0]}${userData.lastName[0]}',
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          )
        : SizedBox(
            width: size,
            height: size,
            child: CachedNetworkImage(
              imageUrl: profilePhoto,
              fit: BoxFit.contain,
              imageBuilder: (context, imageProvider) => Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
            ),
          );
  }
}
