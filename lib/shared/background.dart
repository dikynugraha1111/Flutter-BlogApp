import 'dart:math';

class Background {
  static const List _BackroundUrl = [
    'https://images.unsplash.com/photo-1510511459019-5dda7724fd87?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVjaG5vbG9neSwgY29kZXx8fHx8fDE2MzQxNzQxNTg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
    'https://images.unsplash.com/photo-1498050108023-c5249f4df085?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVjaG5vbG9neSwgY29kZXx8fHx8fDE2MzQxNzQxODI&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
    'https://images.unsplash.com/photo-1511376777868-611b54f68947?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVjaG5vbG9neSwgY29kZXx8fHx8fDE2MzQxNzQyMDI&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
    'https://images.unsplash.com/photo-1519241047957-be31d7379a5d?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVjaG5vbG9neSwgY29kZXx8fHx8fDE2MzQxNzQyMTE&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
    'https://images.unsplash.com/photo-1532522750741-628fde798c73?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVjaG5vbG9neSwgY29kZXx8fHx8fDE2MzQxNzQyMjY&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
    'https://images.unsplash.com/photo-1502951682449-e5b93545d46e?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVjaG5vbG9neSwgY29kZXx8fHx8fDE2MzQxNzQyMzg&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
    'https://images.unsplash.com/photo-1509395062183-67c5ad6faff9?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVjaG5vbG9neSwgY29kZXx8fHx8fDE2MzQxNzQyNDc&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600',
    'https://images.unsplash.com/photo-1514070706115-47c142769603?crop=entropy&cs=tinysrgb&fit=crop&fm=jpg&h=900&ixid=MnwxfDB8MXxyYW5kb218MHx8dGVjaG5vbG9neSwgY29kZXx8fHx8fDE2MzQxNzQzMDA&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=1600'
  ];

  /// GET IMAGE FROM : https://source.unsplash.com/1600x900/?technology,%20code

  static String randomBackground() {
    final _random = Random();
    return _BackroundUrl[_random.nextInt(_BackroundUrl.length)];
  }
}