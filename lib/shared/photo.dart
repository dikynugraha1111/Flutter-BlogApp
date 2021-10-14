import 'dart:math';

class Photo {
  static const List _photoUrl = [
    'https://gravatar.com/avatar/bb30b0cc4662b31baf4df56f843c107a?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/5671d07c2df67cef78601ccae2a6d214?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/2627c79b8803215528bbbe65383e7a16?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/7296298ad939e4e7192f85613caf831b?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/9ea3aa7da6d68b0f6c93362a9ccb80da?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/a7e707183410f544d24c4958071f35ca?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/b9b2bd00e385af7899fdcc04028e9d83?s=400&d=robohash&r=x',
    'https://gravatar.com/avatar/072b276da2c81ed0d49a8ae5d32c7ab1?s=400&d=robohash&r=x'
  ];

  static String randomPhoto() {
    final _random = Random();
    return _photoUrl[_random.nextInt(_photoUrl.length)];
  }
}
