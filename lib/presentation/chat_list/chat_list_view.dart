import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class ChatListView extends StatelessWidget {
  ChatListView({super.key});

  final List<Map<String, dynamic>> chatList = [
    {
      'name': 'Tuğçe Demir',
      'lastMessage': 'Merhaba, nasılsın?',
      'time': '10:30 AM',
      'unreadCount': 2,
      'avatar': 'assets/images/user.png',
      'isOnline': true,
    },
    {
      'name': 'Ahmet Yılmaz',
      'lastMessage': 'Paket teslim edildi mi?',
      'time': 'Dün',
      'unreadCount': 0,
      'avatar': 'assets/images/user.png',
      'isOnline': false,
    },
    {
      'name': 'Ali Veli',
      'lastMessage': 'Sana yeni bir ürün önerdim.',
      'time': '2 gün önce',
      'unreadCount': 1,
      'avatar': 'assets/images/user.png',
      'isOnline': true,
    },
    {
      'name': 'Zeynep Arslan',
      'lastMessage': 'İndirim kodunu kullandın mı?',
      'time': '3 gün önce',
      'unreadCount': 0,
      'avatar': 'assets/images/user.png',
      'isOnline': false,
    },
    {
      'name': 'Mehmet Can',
      'lastMessage': 'Yeni koleksiyonumuza göz at!',
      'time': '5 gün önce',
      'unreadCount': 3,
      'avatar': 'assets/images/user.png',
      'isOnline': true,
    },
    {
      'name': 'Elif Şahin',
      'lastMessage': 'Siparişin hazırlandı.',
      'time': '1 hafta önce',
      'unreadCount': 0,
      'avatar': 'assets/images/user.png',
      'isOnline': false,
    },
    {
      'name': 'Cemre Korkmaz',
      'lastMessage': 'Yeni bir kampanya başladı!',
      'time': '2 hafta önce',
      'unreadCount': 0,
      'avatar': 'assets/images/user.png',
      'isOnline': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: AppCommonSize.size96,
            floating: false,
            pinned: true,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: AppColorTheme.primaryGradient,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: FlexibleSpaceBar(
                title: Text(
                  'Sohbetler',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppCommonSize.size24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                centerTitle: true,
                titlePadding: EdgeInsets.symmetric(
                  horizontal: AppCommonSize.size16,
                  vertical: AppCommonSize.size16,
                ),
                background: Stack(
                  children: [
                    Positioned(
                      top: -50,
                      right: -50,
                      child: Container(
                        width: 200,
                        height: 190,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(AppCommonSize.size16),
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppCommonSize.size16,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          vertical: AppCommonSize.size16,
                        ),
                        border: InputBorder.none,
                        hintText: 'Sohbet ara...',
                        hintStyle: TextStyle(
                          color: AppColorTheme.textSecondary,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: AppColorTheme.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: chatList.length,
                  itemBuilder: (context, index) {
                    final chat = chatList[index];

                    return InkWell(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          vertical: AppCommonSize.size8,
                          horizontal: AppCommonSize.size10,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: AppCommonSize.size16,
                          vertical: AppCommonSize.size10,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.grey.withValues(alpha: 0.2),
                              width: 1,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                CircleAvatar(
                                  backgroundColor: AppColorTheme.primaryColor
                                      .withValues(alpha: 0.1),
                                  radius: AppCommonSize.size32,
                                  child: Image.asset(
                                    chat['avatar'],
                                    fit: BoxFit.cover,
                                    height: 32,
                                  ),
                                ),
                                if (chat['isOnline'])
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: CircleAvatar(
                                      radius: 8,
                                      backgroundColor: Colors.green,
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(width: AppCommonSize.size12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    chat['name'],
                                    style: TextStyle(
                                      fontSize: AppCommonSize.size16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColorTheme.textInverse,
                                    ),
                                  ),
                                  SizedBox(height: AppCommonSize.size4),
                                  Text(
                                    chat['lastMessage'],
                                    style: TextStyle(
                                      fontSize: chat['unreadCount'] == 0
                                          ? 13
                                          : 14,
                                      color: AppColorTheme.textSecondary,
                                      fontWeight: chat['unreadCount'] == 0
                                          ? FontWeight.normal
                                          : FontWeight.w500,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: AppCommonSize.size12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  chat['time'],
                                  style: TextStyle(
                                    fontSize: chat['unreadCount'] == 0
                                        ? 13
                                        : 14,
                                    color: AppColorTheme.textSecondary,
                                    fontWeight: chat['unreadCount'] == 0
                                        ? FontWeight.normal
                                        : FontWeight.w500,
                                  ),
                                ),
                                SizedBox(height: AppCommonSize.size4),
                                if (chat['unreadCount'] > 0)
                                  Container(
                                    padding: EdgeInsets.all(
                                      AppCommonSize.size6,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColorTheme.primaryColor,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Text(
                                        chat['unreadCount'].toString(),
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: AppCommonSize.size12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
