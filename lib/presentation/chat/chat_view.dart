import 'package:e_commerce_project/theme/app_color_theme.dart';
import 'package:e_commerce_project/theme/app_common_size.dart';
import 'package:flutter/material.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {
      'message': 'Merhaba nasılsın? ',
      'isMe': false,
      'time': '10:00 AM',
      'status': 'read',
    },
    {
      'message': 'Merhaba size nasıl yardımcı olabilirim?',
      'isMe': true,
      'time': '10:01 AM',
      'status': 'read',
    },
    {
      'message': 'Son siparişim hakkında bir sorum var. ',
      'isMe': false,
      'time': '10:02 AM',
      'status': 'read',
    },
    {
      'message':
          'Tabii ki, size yardımcı olabilirim. Sipariş numaranızı paylaşabilir misiniz?',
      'isMe': true,
      'time': '10:03 AM',
      'status': 'sent',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorTheme.backgroundColor,
      appBar: AppBar(
        foregroundColor: Colors.white,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: AppColorTheme.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.white.withValues(alpha: 0.2),
              radius: AppCommonSize.size24,
              child: Image.asset(
                height: AppCommonSize.size32,
                'assets/images/user.png',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: AppCommonSize.size12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Tuğçe Demir',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: AppCommonSize.size16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Çevrimiçi',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: AppCommonSize.size12,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.video_call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.call)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(AppCommonSize.size16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isMe = message['isMe'] as bool;
                return Padding(
                  padding: EdgeInsetsGeometry.only(
                    bottom: AppCommonSize.size16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: isMe
                        ? MainAxisAlignment.end
                        : MainAxisAlignment.start,
                    children: [
                      if (!isMe)
                        CircleAvatar(
                          backgroundColor: Colors.white.withValues(alpha: 0.2),
                          radius: AppCommonSize.size16,
                          child: Image.asset(
                            height: AppCommonSize.size32,
                            'assets/images/user.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      SizedBox(width: AppCommonSize.size8),
                      Container(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.7,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: AppCommonSize.size12,
                          horizontal: AppCommonSize.size16,
                        ),
                        decoration: BoxDecoration(
                          color: isMe
                              ? AppColorTheme.primaryColor
                              : Colors.white,

                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(AppCommonSize.size16),
                            bottomLeft: Radius.circular(
                              isMe ? AppCommonSize.size16 : 0,
                            ),
                            bottomRight: Radius.circular(
                              isMe ? 0 : AppCommonSize.size16,
                            ),
                            topRight: Radius.circular(AppCommonSize.size16),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: AppCommonSize.size8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              message['message'] as String,
                              style: TextStyle(
                                fontSize: AppCommonSize.size16,
                                color: isMe
                                    ? Colors.white
                                    : AppColorTheme.textInverse,
                              ),
                            ),
                            SizedBox(height: AppCommonSize.size4),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  message['time'] as String,
                                  style: TextStyle(
                                    color: isMe
                                        ? Colors.white70
                                        : AppColorTheme.textSecondary,
                                  ),
                                ),
                                if (isMe) ...[
                                  SizedBox(width: AppCommonSize.size4),
                                  Icon(
                                    message['status'] == 'read'
                                        ? Icons.done_all
                                        : Icons.done,
                                    color: Colors.white,
                                  ),
                                ],
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: AppCommonSize.size16,
              horizontal: AppCommonSize.size10,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: AppCommonSize.size20,
                  offset: Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.attach_file),
                  color: AppColorTheme.textSecondary,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.camera_alt),
                  color: AppColorTheme.textSecondary,
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: AppCommonSize.size16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColorTheme.backgroundColor,
                      borderRadius: BorderRadius.circular(AppCommonSize.size24),
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: 'Mesaj girin',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: AppColorTheme.textSecondary,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: AppCommonSize.size8),
                InkWell(
                  onTap: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _messages.add({
                          'message': _messageController.text,
                          'isMe': true,
                          'time':
                              '${DateTime.now().hour}:${DateTime.now().minute}',
                          'status': 'sent',
                        });
                      });
                      _messageController.clear();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(AppCommonSize.size10),
                    decoration: BoxDecoration(
                      color: AppColorTheme.primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(child: Icon(Icons.send, color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
